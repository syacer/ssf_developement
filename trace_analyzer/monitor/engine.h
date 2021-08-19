#include "data.h"
#include "random.h"
#include "thread_pool.h"

class engine {

  private:
 //   testdb *tdbptr;
    uint32_t jobCnts;
    myRandom* rnd;
  public:
    engine();
    
    virtual vector<uint64_t> produceATaintBytes(const void* dl);
    vector<uint64_t> genRandTaintBytes(uint64_t numOfBytes);
   // thread operations.
};
