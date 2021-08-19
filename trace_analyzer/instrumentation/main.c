#include <pruneMemory.cpp>


#define NUM_OF_CMP 5

uint64_t* shmptr_cmp = new uint64_t[NUM_OF_CMP * 6];
uint64_t* shmptr_edge = new uint64_t[NUM_OF_CMP * 2];
uint64_t* shmptr_gcnt = new uint64_t;;
int main() {
   

  
  *(shmptr_cmp++) = 1;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
 
  *shmptr_gcnt += 6;
  removeRepeatedCycle(1);
  
  *(shmptr_cmp++) = 1;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 2;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;

  *shmptr_gcnt += 6;
  removeRepeatedCycle(1);
  
  *(shmptr_cmp++) = 2;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 3;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  
  *shmptr_gcnt += 6;
  removeRepeatedCycle(2);
  
  *(shmptr_cmp++) = 1;
  *(shmptr_cmp++) = 4;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;

  *shmptr_gcnt += 6;
  removeRepeatedCycle(1);
  *(shmptr_cmp++) = 1;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 6;
  *(shmptr_cmp++) = 9;
  *(shmptr_cmp++) = 9;
  
  *shmptr_gcnt += 6;
  removeRepeatedCycle(1);
}
