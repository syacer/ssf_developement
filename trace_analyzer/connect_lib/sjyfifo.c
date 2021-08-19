/************************************************************************
 * (with blocking)
 * 1. Receiver creates a fifo
 * 2. Sender open the fifo. If fifo does not exist,
 *    sender is blocked in open function until fifo is created
 * 3. Receiver opens the fifo. Receiver is blocked in open() until 
 *    sender opens the fifo.
 * 4. Sender writes data into fifo
 * 5. Receiver waits in read until sender finishes sending data in fifo.
 * ***********************************************************************/

#include "sjyfifo.h"



static int isClient = -1;
static int setupReady = 0;
static timer_t timeridFifo;
static timer_t timeridTo;
static int rdFd = -1;
static int wrFd = -1;



void setfifoType(int myType) {
  isClient = myType;
}

void removefifo() {
  
  close(rdFd);
  if (isClient) {
    SAYF("client fifo removed \n");
    unlink(FIFO_CLIENT);
  }
  else {
    SAYF("server fifo removed \n");
    unlink(FIFO_SERVER);
  }
}

static void setTimer(time_t sec, time_t int_sec, timer_t tid) {

  struct itimerspec it; 
  it.it_value.tv_sec = sec;  
  it.it_value.tv_nsec = 0;
  it.it_interval.tv_sec = int_sec;
  it.it_interval.tv_nsec = 0;

  if (timer_settime(tid, 0, &it, NULL) == -1)
    ABORT("Failed to start timer: %s \n", strerror(errno));

}

static void connectTimeout(int sig, siginfo_t *si, void *uc) {
  
  removefifo();
  ABORT("connection timed out\n");
}

static void openWriteFifo(int sig, siginfo_t *si, void *uc) {
  
  char filePath[FIFO_FILE_NAME_SIZE];
  if(isClient) {strcpy(filePath, FIFO_SERVER);}
  else {strcpy(filePath, FIFO_CLIENT);} 
  
  setTimer(MAX_ALLOWED_TIME, 0, timeridTo);
  wrFd = open(filePath,O_WRONLY);
  
  setTimer(0, 0, timeridTo);
  
  if (wrFd < 0 && errno != ENOENT)
    ABORT("Open write fifo failed error: %s", strerror(errno));
  
  if (wrFd > 0) {
    setTimer(0, 0, timeridFifo);
  } else {
    ACTF("Connection to the other endpoint fifo failed, retry  after two seconds \n");
  }
}

int sendnbytes(const char* buf, int n) {
  
  if (n > MAX_BUF_SIZE) {
    return -1;
  }
  
  int ret = write(wrFd, buf, n);
  
  if (ret < 0) return SETUP_FAIL;
  
  return 0;
}

int recvnbytes(char* buf, int n) {
  
  if (n > MAX_BUF_SIZE) {
    return -1;
  }

  
  /*************************************
   * read is blocked when fifo is empty
   * ***********************************/

  int ret = read(rdFd, buf, n);
  
  if (ret < 0) return SETUP_FAIL;
  
  return 0;
}

void setupCommunication() {
  
  if (isClient == -1) {
   SAYF("Please indicate fifo type, client or server\n");
  }
  
  char filePath[FIFO_FILE_NAME_SIZE];

  if(isClient) {
    strcpy(filePath, FIFO_CLIENT);
  }
  else {
    strcpy(filePath, FIFO_SERVER);
  } 

  if (!access(filePath, F_OK)) {
    ABORT("remove old .fifo file failed, please remove *.fifo files: %s", filePath);
  }
  
  if (mkfifo(filePath, 0777) < 0) {
    ABORT("make fifo failed: error: %s\n", strerror(errno));
  }
  
  struct sigevent sev;
  struct sigaction sa;
  
  sa.sa_flags = SA_SIGINFO | SA_NODEFER;
  sa.sa_sigaction = openWriteFifo;
  if (sigaction(SIGRTMIN + 2, &sa, NULL) == -1)
    ABORT("Failed to add sigaction to SIGRTMIN \n");

  sev.sigev_notify = SIGEV_SIGNAL;
  sev.sigev_signo = SIGRTMIN + 2;
  sev.sigev_value.sival_ptr = &timeridFifo;
  
  if (timer_create(CLOCK_REALTIME, &sev, &timeridFifo) == -1) {
    ABORT("Failed to create timer %s \n",strerror(errno));
  }

  ACTF("scan_write_fifo_timer created: %#jx\n",(__uintmax_t)timeridFifo);
  

  sa.sa_flags = SA_SIGINFO;
  sa.sa_sigaction = connectTimeout;

  if (sigaction(SIGRTMIN + 1, &sa, NULL) == -1)
    ABORT("Failed to add sigaction to SIGRTMIN \n");

  sev.sigev_notify = SIGEV_SIGNAL;
  sev.sigev_signo = SIGRTMIN + 1;
  sev.sigev_value.sival_ptr = &timeridTo;
  
  if (timer_create(CLOCK_REALTIME, &sev, &timeridTo) == -1) {
    ABORT("Failed to create timer %s \n",strerror(errno));
  }

  ACTF("timeout_timer created: %#jx\n",(__uintmax_t)timeridTo);

  setTimer(2, 2, timeridFifo);
  
  /*************************************
   * open() blocks until the other 
   * endpoint initiate open for write.
   * so, lets wait.......
   * ***********************************/
  
  do {
    
    rdFd = open(filePath, O_RDONLY);
  
  }while(rdFd < 0 && errno == EINTR);
 
  if (rdFd == -1)
    ABORT("open fifo for writing failed: %s\n",strerror(errno));

  while (wrFd < 0);
  
  setupReady = 1;
}

#ifdef DIRECT_KILL

  static pids pidataG;

#endif
  
void fifoActonExit() {

  if (!isClient) {

#ifndef DIRECT_KILL
    char fakebyte;
    sendnbytes("$", 1);
    recvnbytes(&fakebyte, 1);
#else 
    if (pidataG.serverId != 0) {
      kill(pidataG.serverId,SIGKILL);
    }
    if (pidataG.childId != 0) {
      kill(pidataG.childId,SIGKILL);
    }
    if (pidataG.mainId != 0) {
      kill(pidataG.mainId,SIGKILL);
    }
#endif
  }

  removefifo();
}

#ifdef DIRECT_KILL
  
  int passpidstoserver(pids* pidata) {
     //every pid gives 10 bytes.
  
     char pidStr[10];
     int ret;
     
     ACTF("Passing pid to server ... \n");
     if (isClient) {
      
      sprintf(pidStr, "%d", pidata->serverId);
      ret = sendnbytes(pidStr, 10);
      if (ret < 0) return ret;
      
      memset(pidStr, 0, 10); 
      sprintf(pidStr, "%d", pidata->childId);
      ret = sendnbytes(pidStr, 10);
      if (ret < 0) return ret;
      
      
      memset(pidStr, 0, 10); 
      sprintf(pidStr, "%d", pidata->mainId);
      ret = sendnbytes(pidStr, 10);
      if (ret < 0) return ret;
  
      
      char tmpStr[FIFO_FILE_NAME_SIZE];
      memset(tmpStr, 0, FIFO_FILE_NAME_SIZE); 
      sprintf(tmpStr, "%s", REST);
      ret = sendnbytes(tmpStr, FIFO_FILE_NAME_SIZE);
      
      if (ret < 0) return ret;
  
     } else {
      
      ret = recvnbytes(pidStr, 10);
      if (ret < 0) return ret;
      
      pidataG.serverId =  atoi(pidStr);
      memset(pidStr, 0, 10);
      
      ret = recvnbytes(pidStr, 10);
      if (ret < 0) return ret;
      
      pidataG.childId =  atoi(pidStr);
      memset(pidStr, 0, 10);
      
      ret = recvnbytes(pidStr, 10);
      if (ret < 0) return ret;
      
      pidataG.mainId =  atoi(pidStr);
      memset(pidStr, 0, 10);
      
      char tmpStr[FIFO_FILE_NAME_SIZE];
      ret = recvnbytes(tmpStr, FIFO_FILE_NAME_SIZE);
      if (ret < 0) return ret;
      
      if (!strstr(tmpStr, REST))  return -1;
    }
  
    ACTF("Passing pid to server finished... \n");
    return 0;
  }
#endif

int passargvtoclient(char **argv, int* argc) {
 
  // first data: argc 4 bytes
  // second data: argv0  256 bytes
  // .....
  
  ACTF("Passing argv to client \n");
  char tmpArgStr[MAX_BUF_SIZE];
  int ret;
  
  if (!setupReady || !argv) return -1;
  
  if (isClient) {
    
    int cnt = 0;
    char *head= NULL;;

    while (!head || !strstr(head, REST)) {
      
      head = argv[cnt++];
      ret = recvnbytes(head, MAX_BUF_SIZE);

      if (ret < 0) {
        BADF("recvnbytes returns %d \n", ret);
        return -1;
      }
    }
    *argc = cnt - 1;
    memset(head, 0, MAX_BUF_SIZE);
  }
  else {
    //send argv
    for (int i = 0; i < *argc; i++) {
    
      ret = sendnbytes(argv[i], MAX_BUF_SIZE);
      if (ret < 0) {
        BADF("sendnbytes returns %d %s\n", ret, strerror(errno));
        return -1;
      }
    }
    memset(tmpArgStr,0,MAX_BUF_SIZE);
    sprintf(tmpArgStr, "%s", REST);
    sendnbytes(tmpArgStr, 13);
  }
  return 0;
}
