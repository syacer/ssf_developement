#ifndef HANALYZERCORE
#define HANALYZERCORE

#include <unordered_map>
#include <utility>
#include <string>
#include <vector>
#include "analyzer_rti.h"
#include "random.h"
#include <math.h>
#include <chrono>
#include <regex>
#include "data.h"
using namespace std;





template <typename T, typename S>
class analyzerCore {

  private:
    void getJumpTable();
    uint64_t totalDistance;
    uint64_t noNewEntryCnts;
    uint64_t calculateDistances(uint64_t, uint64_t, uint64_t, uint64_t);
    unordered_map<uint32_t, int32_t> jmpDict;
    S* engptr;
    myRandom* myrnd;

    
  public:
    unordered_map<uint64_t, dictval<T>*> cmplist;
    string analysisStart(uint64_t*, uint64_t, char*);
    bool updateList(uint64_t*, uint64_t, char*);
    ~analyzerCore();
    string constructATest(vector<uint64_t>, dictval<T>*);
    uint8_t branchType(uint64_t cmpid, uint64_t opSrc, uint64_t opDst);
    
    explicit analyzerCore(S*);
    analyzerCore();
};

template <typename T, typename S>
string analyzerCore<T,S>::analysisStart(uint64_t* infoList, uint64_t size, char* aflTestPath)  {
  
  vector<uint64_t> taints;
  bool isnewEntry;

  isnewEntry = updateList(infoList, size, aflTestPath);
  
  if (!isnewEntry) {
    noNewEntryCnts++;
    if (noNewEntryCnts > MAX_NO_NEW_ENTRY_CNT) {
      noNewEntryCnts = MAX_NO_NEW_ENTRY_CNT;
    }
  }
  
  if (noNewEntryCnts == MAX_NO_NEW_ENTRY_CNT && engptr != nullptr) {
    // Random picking up an entry
    uint64_t d = myrnd->genUniformRnd(0, static_cast<int64_t>(totalDistance));
    uint64_t t = 0;
    for (auto it = cmplist.begin(); it != cmplist.end(); it++) {
      t += it->second->distance;
      if (d <= t) {
        vector<uint64_t> taintBytes = engptr->produceATaintBytes(it->second);
        string file = constructATest(taintBytes, it->second);
        return file;
      }
    }
  } else {

    noNewEntryCnts = 0;
  }
  
  return "";
}

template<typename T, typename S>
string analyzerCore<T,S>::constructATest(vector<uint64_t> taints, dictval<T>* valptr) {

  string filePath = valptr->samplefile;

  ifstream src(filePath, ios::binary);
  filebuf* pbuf = src.rdbuf();

  size_t size = pbuf->pubseekoff(0, src.end, src.in);
  pbuf->pubseekpos(0, src.in);

  char* buffer = new char[size];

  pbuf->sgetn(buffer, size);

  src.close();

  for (size_t i = 0; i < valptr->taints.size(); i++) {
    buffer[valptr->taints[i]] = taints[i];
  }
  
  uint64_t stamps = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now()
      .time_since_epoch()).count();
  
  ofstream dst;
  string newfile = "afl_test/" + to_string(valptr->signature) + "_" + to_string(stamps);
  dst.open(newfile);
  dst << buffer;
  dst.close();

  delete[] buffer;

  return newfile;
}


template<typename T, typename S>
uint64_t analyzerCore<T,S>::calculateDistances(uint64_t td, uint64_t ntd, uint64_t tc, uint64_t ntc) {

  double pt = td / (td + ntd);
  double pnt = ntd / (td + ntd);

  double pta = tc / (tc + ntc);
  double pnta = ntc / (tc + ntc);

  double eentropy = -pt * log2(pt) - pnt * log2(pnt);
  double aentropy = -pta * log2(pta) - pnta * log2(pnta);

  return abs(eentropy - aentropy);

}

/*******************************************************
 *
 * return 1 if taken, 0 if non-taken
 *
 * *****************************************************/

template<typename T, typename S>
uint8_t analyzerCore<T,S>::branchType(uint64_t cmpid, uint64_t opSrc, uint64_t opDst) {
 
  auto it = jmpDict.find(cmpid);
  
  if (it == jmpDict.end()) ABORT("cmpid is not in the jmpDict! \n");

  int32_t typeNum = it->second;
  
  uint8_t ret;
  
  if (typeNum == 1) {
    ret = opSrc == opDst ? 1 : 0;
  }
  if (typeNum == 2) {
    ret = opSrc == opDst ? 0 : 1;
  } 
  if (typeNum == 3) {
    ret = opSrc < opDst ? 1 : 0;
  }
  if (typeNum == 4) {
    ret = opSrc < opDst ? 0 : 1;
  }
  if (typeNum == 5) {
    ret = opSrc <= opDst ? 1 : 0;
  }
  if (typeNum == 6) {
    ret = opSrc <= opDst ? 0 : 1;
  }
  if (typeNum == 7) {
    ret = static_cast<int64_t>(opSrc) < static_cast<int64_t>(opDst) ? 1 : 0;
  }
  if (typeNum == 8) {
    ret = static_cast<int64_t>(opSrc) < static_cast<int64_t>(opDst) ? 0 : 1;
  }
  if (typeNum == 9) {
    ret = static_cast<int64_t>(opSrc) <= static_cast<int64_t>(opDst) ? 1 : 0;
  }
  if (typeNum == 10) {
    ret = static_cast<int64_t>(opSrc) <= static_cast<int64_t>(opDst) ? 0 : 1;
  }
  if (typeNum == 12) {
    ret = (static_cast<int64_t>(opSrc) - static_cast<int64_t>(opDst)) < 0 ? 1 : 0;
  }
  if (typeNum == 13) {
    ret = (static_cast<int64_t>(opSrc) - static_cast<int64_t>(opDst)) < 0 ? 0 : 1;
  }

  if (typeNum == 11) ret = 2;

  return ret;
}
/*******************************************************************
 *
 * update entry
 * update total distance
 * If it is a new entry, get taints.
 * clear ready bit if max depth value increases beyound a target
 *
 * *****************************************************************/

template<typename T, typename S>
bool analyzerCore<T,S>::updateList(uint64_t* infoList, uint64_t size, char* aflTestPath) {
 
  uint64_t cnt = 0;
  bool newEntry = false;
  dictval<T>* dvptr = nullptr;
  bool isCopied = false;
  string filePath;
  unordered_map<uint64_t, vector<uint64_t>> taintDict;
  vector<uint64_t> tmpVect;

  while (cnt < size) {

    uint64_t signature = infoList[cnt++];
    cnt++; //bypass suffix data
    uint64_t opSrc = infoList[cnt++];
    uint64_t opDst = infoList[cnt++];
    
    if (cmplist.find(signature) == cmplist.end()) {
      
      newEntry = true;
      dvptr = new dictval<T>();
      cmplist.insert({signature, dvptr});
      if (isCopied == false) {
        fstream src(aflTestPath, ios::binary);
        filePath = "sample_test/" + to_string(signature) + "_sampletest" ;
        ofstream dst(filePath, ios::binary);
        dst << src.rdbuf();
        isCopied = true;
        
        //gettaint.sh 1.execute libdft 2.copy result to project directory
        int ret = system(("bash gettaints.sh " + filePath).c_str());
        
        if (ret != 0) FATAL("run dft encountered an error\n");

        regex rgx(".?\\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} \\{([0-9]*)} .* ([0-9][0-9][0-9]*)");
        
        string line;
        smatch matches;
        ifstream myfile ("cmp.out");
        
        if (myfile.is_open()) {
          while ( getline (myfile,line) ) {
            tmpVect.clear();
            if (regex_search(line, matches, rgx))  {
              for (size_t i = 1; i < matches.size(); i++) {
                if (matches[i].str().size() != 0) {
                  uint64_t num = stoull(matches[i].str());
                  if (i < 17) {
                    tmpVect.push_back(num);
                  } else {
                    taintDict.insert({num, tmpVect});
                  }
                }
              }
            }
          }
        } else {
          FATAL("dft: can't open cmp.out \n");
        }
        
        myfile.close();
      } 
      
      dvptr->samplefile = filePath;
      
      if (taintDict.find(signature) == taintDict.end()) 
        FATAL("taintDict does not have the signatuere \n");
      
      dvptr->taints = taintDict[signature];
    }
    else {
      
      dvptr = cmplist[signature];
    }

    uint8_t type = branchType(signature & 0xFFFFFFFF, opSrc, opDst);
    uint64_t depth = (size - cnt) / 4;
    double pold = static_cast<double>(dvptr->tmaxDepth) / (dvptr->tmaxDepth + dvptr->ntmaxDepth);

    if (type == 0) { 
      dvptr->ntCnts += 1; 
      dvptr->ntmaxDepth = depth > dvptr->ntmaxDepth ? depth : dvptr->ntmaxDepth; 
    }

    if (type == 1) {
      dvptr->tCnts += 1;
      dvptr->tmaxDepth = depth > dvptr->tmaxDepth ? depth : dvptr->tmaxDepth; 
    }

    if (type == 2) WARNF("Unsupported jmpType \n");
     
    dvptr->distance = calculateDistances(dvptr->tmaxDepth, 
        dvptr->ntmaxDepth, 
        dvptr->tCnts, 
        dvptr->ntCnts
    );

    double pnew = static_cast<double>(dvptr->tmaxDepth) / (dvptr->tmaxDepth + dvptr->ntmaxDepth);

    if (abs(pold - pnew) > REFINE_THRESHOLD) {
      dvptr->dist.ready = false;  
      cout << "clear ready bit \n" << endl;
    }
    
  }

  return newEntry;
  
}

template<typename T, typename S>
void analyzerCore<T,S>::getJumpTable() {
  
  struct stat buffer;
  if (stat(JUMP_TABLE_FILE_NAME, &buffer)) {
    FATAL("Can't find jump table file, please check with instrumentation module \n");
  }
  
  string line;
  ifstream infile(JUMP_TABLE_FILE_NAME);
  uint32_t cnt = 0;
  while (getline(infile, line)) {


    istringstream iss(line);
    uint32_t cmpid;
    int32_t  jmpType;

    cnt++;
    if (!(iss >> cmpid >> jmpType)) {
      FATAL("Parse jump table file encountered an error on line %d", cnt);
    }

    jmpDict.insert({cmpid, jmpType});
  }

  for (auto it = jmpDict.begin(); it != jmpDict.end(); it++) {
    cout << it->first << " " << it->second << endl;
  }
}

template<typename T, typename S>
analyzerCore<T,S>::~analyzerCore() {

}

template<typename T, typename S>
analyzerCore<T, S>::analyzerCore(S* _engptr) {
  
  engptr = _engptr;
  myrnd = myrnd->getObject();
  getJumpTable();

  system("rm -d sample_test");
  system("mkdir sample_test");
  system("rm -d afl_test");
  system("mkdir afl_test");

}


template<typename T, typename S>
analyzerCore<T,S>::analyzerCore() {

  engptr = nullptr;
  getJumpTable();
  system("rm -d sample_test");
  system("mkdir sample_test");
  system("rm -d afl_test");
  system("mkdir afl_test");
}
#endif
