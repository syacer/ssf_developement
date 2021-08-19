#ifndef H_HEADER_DATA_H
#define H_HEADER_DATA_H

#include <unordered_map>
#include <utility>
#include <string>
#include <vector>
using namespace std;

typedef struct fakeData {
 
  bool ready;
} fada;

typedef struct distcomponent {
  
  vector<uint64_t> ddomain;
  vector<double>   dweight;
  bool     ready;

  bool validityCheck();
  vector<uint64_t> randomGenAtest();

} dist;

typedef struct weightedDT {
  vector<double> weights;
  //oc1dt
  vector<vector<uint64_t>> samples;
  bool ready;
} wdt;

template <typename T>
class dictval{
 
  public:
    uint64_t signature;
    uint64_t tCnts;
    uint64_t ntCnts;
    vector<uint64_t> taints;
    uint64_t tmaxDepth;
    uint64_t ntmaxDepth;
    string samplefile;
    uint64_t distance;
    
    T dist;

};

#endif
