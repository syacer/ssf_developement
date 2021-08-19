
#include "random.h"

void myRandom::getRandvect(vector<double>* vec , double total, uint64_t cnt)  {
  
  uniform_int_distribution<uint16_t> orderDist(0, cnt-1);
  unordered_set<uint16_t> iset;
  double remain = total;
  while(iset.size() != cnt) {
    uint16_t randIndex = orderDist(generator);
    if (iset.find(randIndex) != iset.end()) {
       continue; 
    }
    if (iset.size() == cnt - 1) {
      vec->at(randIndex) = remain;
      break;
    }
    uniform_real_distribution<double> dist(0, remain);
    double rndNum = dist(generator);
    vec->at(randIndex) = rndNum;
    remain -= rndNum;
    iset.insert(randIndex);
  }
}
void myRandom::getRandvect(vector<uint8_t>* vec , uint8_t total, uint64_t cnt)  {
  uniform_int_distribution<uint16_t> orderDist(0, cnt-1);
  unordered_set<uint16_t> iset;
  uint8_t remain = total;
  while(iset.size() != cnt) {
    uint16_t randIndex = orderDist(generator);
    if (iset.find(randIndex) != iset.end()) {
       continue; 
    }
    if (iset.size() == cnt - 1) {
      vec->at(randIndex) = remain;
      break;
    }
    uniform_int_distribution<uint8_t> dist(0, remain);
    uint8_t rndNum = dist(generator);
    vec->at(randIndex) = rndNum;
    remain -= rndNum;
    iset.insert(randIndex);
  }
}

myRandom *myRandom::rand = nullptr; 
//mt19937 myRandom::generator{0};
mt19937 myRandom::generator{random_device{}()};
