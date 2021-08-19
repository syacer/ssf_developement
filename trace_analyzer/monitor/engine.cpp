#include "engine.h"


/*********************************
 * Default version. Random generate 
 *
 * tainted bytes.
 *
 * *********************************/
vector<uint64_t> engine::produceATaintBytes(const void* dl) {
  
  const dictval<fakeData>* dlc = static_cast<const dictval<fakeData>*>(dl);
  return genRandTaintBytes(dlc->taints.size());

}



vector<uint64_t> engine::genRandTaintBytes(uint64_t n) {
 
 vector <uint64_t> result;
 
 for (uint64_t i = 0; i < n; i++) {
  
   int val = static_cast<int>(rnd->genUniformRnd(0.0, 255.0));
   result.push_back(val);
   
 }
 
 return result;
}

engine::engine() {

  rnd = myRandom::getObject();
  
}

