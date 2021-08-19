/***********************************
 * This is run-time infrastructure
 * for analyzer
 * functionsA (instrumentation client setup):
 * 0. compile SUTs with instrumentation
 * 1. setup env, shm, pipes
 * 2. start instrument server
 * 3. send test cases to check if everything is ready
 *functionsB (FIFO server setup):
 * 1. setup FIFOs for afl/sst/afl++/etc. <-> analyzer communication
 * 2. setup tbd.
 * *********************************/

#ifndef _HAVE_ANALYZER_RTI_H
#define _HAVE_ANALYZER_RTI_H

#include "config.h"
#include "sys/time.h"
#include "debug.h"
#include "stdint.h"
#include "unistd.h"

#include <unordered_map>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fstream>
#include <sstream>
#include <time.h>
#include <errno.h>
#include <signal.h>
#include <dirent.h>
#include <ctype.h>
#include <fcntl.h>
#include <termios.h>
#include <dlfcn.h>
#include <sched.h>
#include <string>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/shm.h>
#include <sys/ipc.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/resource.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <sys/file.h>
#include "types.h"
#include <string.h>
#include "sjyfifo.h"
#include "graphcore.h"

using namespace std;

//run analyzer
// analyzer inst-binary testpath

#define GRAPH_VISUAL_CMD "dot -Tjpg trace_graph.dot -o trace_graph.jpg" 

class analyzerRti{
  
  private:
    int shmIdCmp;
    int shmIdEdge;
    int shmIdgCnt;

    char* traceBitsgCnt;
    char* traceBitsCmp;
    char* traceBitsEdge;
    
    uint64_t cmpInfoListSize;
    uint64_t *cmpNodeInfoList;
    
    int fsrvStFd;
    int fsrvCtlFd;
    int devnullFd;
    int childPid;
    int childTimedOut;
    int forksrvPid;
    uint64_t totalExcs;
    char** argv;
    char* targetPath;
    char* aflTestfile;


    int initializeServer();
    int setupSharedMemory();
    void setupSignalHandler();
    void writeShmToFile();
    int  runTarget();

    void postDataProcessing();
    
    string exec(const string);
    static void handleTimeout(int);
    static void handleStopSignal(int);
    static void removeShm();
    static int enableGraph;

  public:
    
    static analyzerRti* instPtr;
    traceGraph *trgraph;  // generate traces as a graph.
    
    static analyzerRti* getInstance() {
      if (instPtr == nullptr) {
        instPtr = new analyzerRti();
      }
      return instPtr;
    }
    
    int setup(char**, int, int);
    template<typename T>
    void startMonitoring(T* );
    template<typename T>
    void runTest(T*);
};


int analyzerRti::setup(char** argvIn, int argcIn, int option) {

  int ret;
  

  /***********************************
   * get instrumented binary path,
   * setup shared memory
   * start server
   **********************************/

  
  setupSignalHandler();
  
  ret = setupSharedMemory();
  if (ret < 0) return ret;

  /****************************************
   * receive argv from fuzzers via FIFO
   * send childPid and forksrvPid to fuzzers via FIFO
   *****************************************/
  
  
  if (option == COOP) {
    
    char** tmpArgv;
    int argc;
    
    targetPath = *(argvIn + 1);
    tmpArgv = new char*[MAX_BUF_SIZE];
  
    for (int i = 0; i < MAX_BUF_SIZE; i++) {
      tmpArgv[i] = new char[MAX_BUF_SIZE];
    }
  
    setfifoType(I_AM_CLIENT);
    setupCommunication();
  
    passargvtoclient(tmpArgv, &argc);
    // TBD: GET aflTestFile Path
    argv = new char*[argc + 1];
    for (int i = 0; i < argc; i++) {
      argv[i] = new char[MAX_BUF_SIZE];
      strncpy(argv[i], tmpArgv[i], MAX_BUF_SIZE);
      delete(tmpArgv[i]);
    }
  
    ret = initializeServer();
    if (ret < 0) return ret;
  
#ifdef DIRECT_KILL  
    pids pidata {
      forksrvPid,
      childPid,
      getpid()
 
    };
    passpidstoserver(&pidata);
#endif
  }
  if (option == SINGLE_RUN) {
    
    targetPath = *(argvIn + 2);
    int argc = argcIn - 2;
    argv = new char*[argc + 1];
    for (int i = 0; i < argc; i++) {
      argv[i] = new char[MAX_BUF_SIZE];
      strncpy(argv[i], argvIn[i+2], MAX_BUF_SIZE);
    }
    argv[argc] = 0;
    ret = initializeServer();
    if (ret < 0) return ret;
  }

  cmpNodeInfoList = (uint64_t*)malloc(MAP_SIZE);
  trgraph = new traceGraph(&cmpInfoListSize, cmpNodeInfoList);
  return 0;
}

void analyzerRti::writeShmToFile(void) {
  
  std::string fileName = "shm.data";
  std::string fileNameEdge = "shm2.data";
  struct stat buf;
  bool filexist = stat(fileName.c_str(), &buf) != -1;
  if (filexist) {
    remove(fileName.c_str());
  }
  filexist = stat(fileNameEdge.c_str(), &buf) != -1;
  if (filexist) {
    remove(fileNameEdge.c_str());
  }
  std::ofstream ofs;
  ofs.open(fileName, std::ofstream::out |  std::ofstream::trunc);
  std::ofstream ofs2;
  ofs2.open(fileNameEdge, std::ofstream::out |  std::ofstream::trunc);
  uint64_t cnt = 0;
  uint64_t gcntShm = *(uint64_t*)traceBitsgCnt;
  while(cnt < gcntShm) {
    if (cnt % 6 == 0) {
      if (cnt != 0) {
        ofs << "\n";
      }
      ofs2 << *((uint64_t*)traceBitsEdge + cnt / 6) << std::endl;
     }
    ofs << *((uint64_t*)traceBitsCmp + cnt) << " ";
    cnt++;
  }
  ofs.close();
  ofs2.close();
}

template<typename T>
void analyzerRti::startMonitoring(T* mt) {

  char fakechar;

  while (1) {

    recvnbytes(&fakechar, 1);


    if (fakechar == '$') {
      handleStopSignal(0);
    }

    SAYF("The %lu's run \n", totalExcs);

    int ret =runTarget();

    MEM_BARRIER();
  
  
    /******************************************
     *
     * start process and analyze data
     * ****************************************/
  
    postDataProcessing();
    
    string filePath = mt->analysisStart(cmpNodeInfoList, cmpInfoListSize, aflTestfile);
    if (enableGraph == 1) {
      trgraph->updateGraphCore(); 
    }
    if (ret == FAULT_CRASH) {
      
      while(1) {
        SAYF("run target crashed!, repeat crash every 15 seconds \n");
        runTarget();
      }

      ABORT("run target crashed \n");
    }
    else if (ret == FAULT_TMOUT) {
      ABORT("run target timed out");
    }
    else if (ret == SHM_FULL) {

      ABORT("SHM FULL \n");
    }

    if (filePath == "") {
      sendnbytes(REST, strlen(REST));
    }
    sendnbytes(filePath.c_str(), filePath.size());
  }
}

//server runtime error: -> read status failed or timed out
//server setup error -> timeout counter expired, binary crashed, handshake failed
//FULL SHM  error ->  target binary shm full
int analyzerRti::runTarget() {

  itimerval it;
  int status = 0;

  childTimedOut = 0;

  /* After this memset, trace_bits[] are effectively volatile, so we
     must prevent any earlier operations from venturing into that
     territory. */

  memset(traceBitsCmp, 0, MAP_SIZE);
  memset(traceBitsEdge, 0, MAP_SIZE);
  memset(traceBitsgCnt, 0, 64);


  MEM_BARRIER();

  int res;

  if ((res = write(fsrvCtlFd, "start", 4)) != 4) {
    RPFATAL(res, "Unable to request new process from fork server (OOM?)");

  }

  if ((res = read(fsrvStFd, &childPid, 4)) != 4) {

    RPFATAL(res, "Unable to request new process from fork server (OOM?)");

  }
  SAYF("child pid %d",childPid);
  if (childPid <= 0) FATAL("Fork server is misbehaving (OOM?)");


  /* Configure timeout, as requested by user, then wait for child to terminate. */

  it.it_value.tv_sec = EXEC_TIMEOUT;
  it.it_value.tv_usec = 0;
  it.it_interval.tv_sec = 0;
  it.it_interval.tv_usec = 0;

  setitimer(ITIMER_REAL, &it, NULL);

  /* The SIGALRM handler simply kills the child_pid and sets childTimedOut. */


  if ((res = read(fsrvStFd, &status, 4)) != 4) {
    RPFATAL(res, "Unable to communicate with fork server (OOM?)");
  }

  // clear timer, clear childPid
  it.it_value.tv_sec = 0;
  it.it_value.tv_usec = 0;
  it.it_interval.tv_sec = 0;
  it.it_interval.tv_usec = 0;

  setitimer(ITIMER_REAL, &it, NULL);
  childPid = 0;
  totalExcs++;


  /* Report outcome to caller. */

  if (WIFSIGNALED(status)) {

    BADF("child process terminated by signal %d \n", status);
    if (childTimedOut) return FAULT_TMOUT;
    return FAULT_CRASH;
  }

  if (WEXITSTATUS(status) == 0x0f) {
    return SHM_FULL; 
  }

  return FAULT_NONE;

}
void analyzerRti::handleStopSignal(int sig) {


  analyzerRti* anPtr = analyzerRti::getInstance();

  if (enableGraph) {
    anPtr->trgraph->generateDotGraph();
    anPtr->exec(GRAPH_VISUAL_CMD);
  }

  fifoActonExit();

  if (anPtr->childPid > 0) kill(anPtr->childPid, SIGKILL);
  if (anPtr->forksrvPid > 0) kill(anPtr->forksrvPid, SIGKILL);

  ABORT("Control + C pressed, exiting ... \n");
}

template<typename T>
void analyzerRti::runTest(T* mt) {

  runTarget();

  postDataProcessing();
  
  string filePath = mt->analysisStart(cmpNodeInfoList, cmpInfoListSize, aflTestfile);
  if (enableGraph == 1) {
    trgraph->updateGraphCore(); 
  }
  writeShmToFile();
  SAYF("generating graph\n");
  if (enableGraph){
    trgraph->generateDotGraph();
    exec(GRAPH_VISUAL_CMD);
  }
  
}


void analyzerRti::handleTimeout(int sig) {


  analyzerRti* anPtr = analyzerRti::getInstance();

  if (anPtr->childPid > 0) {
  
    anPtr->childTimedOut = 1;
    kill(anPtr->childPid, SIGKILL);
  } else if (anPtr->childPid == -1 && anPtr->forksrvPid > 0) {
    anPtr->childTimedOut = 1;
    kill(anPtr->forksrvPid, SIGKILL);
  }
}
void analyzerRti::setupSignalHandler() {

  struct sigaction sa;

  sa.sa_handler   = NULL;
  sa.sa_flags     = SA_RESTART;
  sa.sa_sigaction = NULL;

  sigemptyset(&sa.sa_mask);

  /* Various ways of saying "stop". */

  sa.sa_handler = &(this->handleStopSignal);
  sigaction(SIGHUP, &sa, NULL);
  sigaction(SIGINT, &sa, NULL);
  sigaction(SIGTERM, &sa, NULL);

  /* Exec timeout notifications. */

  sa.sa_handler = &(this->handleTimeout);
  sigaction(SIGALRM, &sa, NULL);

  /* Things we don't care about. */

  sa.sa_handler = SIG_IGN;
  sigaction(SIGTSTP, &sa, NULL);
  sigaction(SIGPIPE, &sa, NULL);
}

void analyzerRti::removeShm() {
  
  
  analyzerRti* anPtr = analyzerRti::getInstance();

  shmctl(anPtr->shmIdCmp, IPC_RMID, NULL);
  shmctl(anPtr->shmIdEdge, IPC_RMID, NULL);
  shmctl(anPtr->shmIdgCnt, IPC_RMID, NULL);
}

int analyzerRti::setupSharedMemory() {
  
  char shmIdCmpStr[11];
  char shmIdEdgeStr[11];
  char shmIdgCntStr[11];
  
  shmIdCmp = shmget(IPC_PRIVATE, MAP_SIZE, IPC_CREAT | IPC_EXCL | 0600);

  shmIdEdge = shmget(IPC_PRIVATE, MAP_SIZE, IPC_CREAT | IPC_EXCL | 0600);

  shmIdgCnt = shmget(IPC_PRIVATE, 64, IPC_CREAT | IPC_EXCL | 0600);
  
  if (shmIdCmp < 0 || shmIdEdge < 0 || shmIdgCnt < 0) {
    return ALLOC_SHM_FAIL;
  }

  atexit(&(this->removeShm));
  
  sprintf(shmIdCmpStr, "%d", shmIdCmp);
  sprintf(shmIdEdgeStr, "%d", shmIdEdge);
  sprintf(shmIdgCntStr, "%d", shmIdgCnt);
  
  int ret;
  ret = setenv(SHM_ENV_CMP, shmIdCmpStr, 1);
  if (ret < 0) return SET_ENV_FAIL;

  ret = setenv(SHM_ENV_EDGE, shmIdEdgeStr, 1);
  if (ret < 0) return SET_ENV_FAIL;

  
  ret = setenv(SHM_ENV_GCNT, shmIdgCntStr, 1);
  if (ret < 0) return SET_ENV_FAIL;
  

  traceBitsCmp = (char*)shmat(shmIdCmp, NULL, 0);
  traceBitsEdge =(char*)shmat(shmIdEdge, NULL, 0);
  traceBitsgCnt = (char*)shmat(shmIdgCnt, NULL, 0);

  if (traceBitsCmp == (char*)-1 || traceBitsEdge == (char*)-1
      || traceBitsgCnt == (char*)-1) {
    return ALLOC_SHM_FAIL;
  }
  return 0;
}

int analyzerRti::initializeServer() {

  
  struct itimerval it;
  int stPipe[2], ctlPipe[2];
  int status;
  int32_t rlen;

  ACTF("Spinning up the fork server...");

  if (pipe(stPipe) || pipe(ctlPipe)) PFATAL("pipe() failed");

  forksrvPid = fork();

  if ( forksrvPid < 0) PFATAL("fork() failed");

  if (!forksrvPid) {

    struct rlimit r;

    if (!getrlimit(RLIMIT_NOFILE, &r) && r.rlim_cur < FORKSRV_FD + 2) {
      r.rlim_cur = FORKSRV_FD + 2;
      setrlimit(RLIMIT_NOFILE, &r); /* Ignore errors */
    }

    r.rlim_max = r.rlim_cur = ((rlim_t)MEM_LIMIT) << 20;
    setrlimit(RLIMIT_AS, &r); /* Ignore errors */

    r.rlim_max = r.rlim_cur = 0;
    setrlimit(RLIMIT_CORE, &r); /* Ignore errors */

    /* Don't mess up the stdin stdout stderr from child process*/

    setsid();
    
    devnullFd = open("/dev/null", O_RDWR);
    dup2(devnullFd, 1);
    dup2(devnullFd, 2);
    dup2(devnullFd, 0);

    /* Set up control and status pipes, close the unneeded original fds. */

    if (dup2(ctlPipe[0], FORKSRV_FD) < 0) PFATAL("dup2() failed");
    if (dup2(stPipe [1], FORKSRV_FD + 1) < 0) PFATAL("dup2() failed");

    close(ctlPipe[0]);
    close(ctlPipe[1]);
    close(stPipe[0]);
    close(stPipe[1]);

    close(devnullFd);

    /* This should improve performance a bit, since it stops the linker from
       doing extra work post-fork(). */

    if (!getenv("LD_BIND_LAZY")) setenv("LD_BIND_NOW", "1", 0);
    
    strncpy(argv[0], targetPath, MAX_BUF_SIZE);
    int ret = execv(targetPath, argv);
    
    if (ret == -1 ) {
      
      SAYP("Test Binary Info: %s\n", targetPath);
      SAYP("execv error: %s \n", strerror(errno));
      uint8_t cnt = 0;
      do {
        SAYP("argv[%d]: %s \n", cnt, argv[cnt]);
        cnt++;
      }while(argv[cnt] != 0);
    }

    /* Use a distinctive bitmap signature to tell the parent about execv()
       falling through. */

    *(u32*)traceBitsCmp = EXEC_FAIL_SIG;
    *(u32*)traceBitsEdge = EXEC_FAIL_SIG;
    exit(0);

  }

  /* Close the unneeded endpoints. */

  close(ctlPipe[0]);
  close(stPipe[1]);

  fsrvCtlFd = ctlPipe[1];
  fsrvStFd  = stPipe[0];

  /* Wait for the fork server to come up, but don't wait too long. */

  it.it_value.tv_sec = ((EXEC_TIMEOUT * FORK_WAIT_MULT) / 1000);
  it.it_value.tv_usec = ((EXEC_TIMEOUT * FORK_WAIT_MULT) % 1000) * 1000;

  setitimer(ITIMER_REAL, &it, NULL);

  rlen = read(fsrvStFd, &status, 4);

  it.it_value.tv_sec = 0;
  it.it_value.tv_usec = 0;

  setitimer(ITIMER_REAL, &it, NULL);

  /* If we have a four-byte "hello" message from the server, we're all set.
     Otherwise, try to figure out what went wrong. */

  if (rlen == 4) {
    OKF("All right - fork server is up.");
    return 0;
  }
  // server has problems, identify the problem:

  if (childTimedOut)
    FATAL("Timeout while initializing fork server (adjusting -t may help)");
  
  if (waitpid(forksrvPid, &status, 0) <= 0)
    PFATAL("waitpid() failed");
  
  
  if (WIFSIGNALED(status)) {
    SAYF("\n" cLRD "[-] " cRST
         "Whoops, the target binary crashed suddenly, before receiving any input\n"
         "from the fuzzer!\n\n");
    FATAL("Fork server crashed with signal %d", WTERMSIG(status));

  }

  if (*(u32*)traceBitsCmp == EXEC_FAIL_SIG ||
      *(u32*)traceBitsEdge == EXEC_FAIL_SIG ) {
    FATAL("Unable to execute target application ('%s')", targetPath);
  }
  
  FATAL("Fork server handshake failed");
}

string analyzerRti::exec(const string cmd) {
  char buffer[128];
  std::string result = "";
  FILE* pipe = popen(cmd.c_str(), "r");
  if (!pipe) throw std::runtime_error("popen() failed");
  try {
    while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
      result +=buffer;
    }
  }
  catch (...) {
    pclose(pipe);
    throw;
  }
  pclose(pipe);
  return result;
}

/********************************************************************
 * edgehash represents the exercises path until this cmp node
 * it is hash(edgehash,edgehash...).
 * cmpid << 16 | depth represents this cmpnode
 * edgehash is 32-bit wide, cmpid is 16-bit wide.
 * signature:  edgehash << 32 | depth << 16 | cmpid
 * cmpid, data-width, opdest_value, opsrc_value
 * output: cmpNodeInfoList, cmpInfoListSize
 *********************************************************************/

void analyzerRti::postDataProcessing() {
  
  uint16_t cnt = 0;
  uint64_t gcntShm = *(uint64_t*)traceBitsgCnt;
  uint64_t edgehash;  // 32-bits
  uint64_t cmpData; 
  
  if ((gcntShm) > (uint64_t)MAP_SIZE) {
    SAYG("number of cmps is %lu, whereas number of allowed cmps is %d\n, abort!\n",
        gcntShm, MAP_SIZE);
    ABORT("MAX_DATA_RECORD is not big enough, program abort, see debug files for details.\n");
  }

  cmpInfoListSize = gcntShm / 6 * 4;
  uint64_t n = 0;
  uint64_t signature;

  while(cnt < gcntShm) {

    cmpData = *((uint64_t*)traceBitsCmp + cnt);
    
    if (cnt % 6 == 0) {
      edgehash = *((uint64_t*)traceBitsEdge + cnt / 6);
      signature = static_cast<uint64_t>(edgehash) << 32 
        | static_cast<uint64_t>(cnt / 6 + 1) << 16 | cmpData;
    }
    
    if (cnt % 6 == 3 || cnt % 6 == 5) {
      cmpNodeInfoList[cnt - n - 1] = 
        (cmpData == 1) ? ((cmpNodeInfoList[cnt - n - 1] >> 8) & 0xff) :
        (cmpData == 2) ? (cmpNodeInfoList[cnt - n - 1] & 0xff) :
                       cmpNodeInfoList[cnt - n - 1];
      n++;
    }
    else if (cnt % 6 == 0){
      cmpNodeInfoList[cnt - n] = signature;
    }
    else {
      cmpNodeInfoList[cnt - n] = cmpData;
    }
    
    cnt++;
  }

  SAYF(cYEL "gcntShm: %lu \n", gcntShm);
}
#endif
