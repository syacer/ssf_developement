
#include <vector>
#include <unordered_map>
using namespace std;
/*****************************************************
 * key:cmpid
 * value: positions in memory that hold the cmpid
 ****************************************************/

unordered_map<uint64_t, uint64_t> cmpidMap;


extern uint64_t* shmptr_gcnt;
extern uint64_t* shmptr_cmp;
extern uint64_t* shmptr_edge;
extern uint64_t* shmptr2Cnt;

extern "C" 
void removeRepeatedCycle(uint64_t cmpid) {

  int notDelete = 0;

  auto it = cmpidMap.find(cmpid);
    
  if (it != cmpidMap.end()) {
   
    uint64_t pos = it->second;
    
    for ( uint64_t i = 0; i * 6 < *shmptr_gcnt - pos ; i++) {
      
      if (*(shmptr_cmp + *(shmptr_gcnt) - (i + 1) * 6) 
          != *(shmptr_cmp + (pos - (i + 1) * 6))) {
        
        notDelete = 1;
        break;
      }
    }
    *shmptr_gcnt = notDelete == 1 ? *shmptr_gcnt : pos;
    cmpidMap[cmpid] = notDelete == 1 ? *shmptr_gcnt : pos;
    *shmptr2Cnt = notDelete == 1 ? *shmptr2Cnt : pos / 6;
  }
  else {
    cmpidMap.insert({cmpid, *shmptr_gcnt});
  }

  printf("%lu \n", *shmptr_gcnt);

}
