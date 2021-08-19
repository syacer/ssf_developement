#ifndef HMYRANDOM_H
#define HMYRANDOM_H

#include <random>
#include <string>
#include <iostream>
#include <vector>
#include <unordered_set>
using namespace std;

//Random Number Generator
class myRandom {
private:
  myRandom()=default;
  static mt19937 generator;
public:
  static myRandom *rand;
  static myRandom* getObject(){
     if (rand == nullptr) {
       rand = new myRandom();
      return rand;
     }
     return rand;
  }
  double genUniformRnd(double start, double end) {
    uniform_real_distribution<double> dist(start, end);
    return dist(generator);
  }
  int64_t genUniformRnd(int64_t start, int64_t end) {
    uniform_int_distribution<uint64_t> dist(start, end);
    return dist(generator);
  }
  void getRandvect(vector<double>* vec , double total, uint64_t cnt);
  void getRandvect(vector<uint8_t>* vec , uint8_t total, uint64_t cnt);
  
};

#endif
