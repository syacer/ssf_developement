#ifndef GRAPHCORE_H
#define GRAPHCORE_H

#include <cstdint>
#include <string>
#include <vector>
#include <sstream>
#include <unordered_map>
#include <deque>
#include <algorithm>
#include <iostream>
#include "config.h"
#include <fstream>
#include <debug.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unordered_set>
using namespace std;

// cmpId is 32-bit wise
// edgeId is 64-bit wise
/*
class cmpNode {
 public:
   uint32_t id;
   uint8_t operandSuffix;
   deque<pair<uint64_t, uint64_t>> operandDB;
   cmpNode(uint64_t idx, uint64_t os, uint64_t op1, uint64_t op2)
     :id(idx),
     operandSuffix(os) {
      operandDB.push_back({op1, op2});
     }
   cmpNode() = delete;
};
*/
/******************************************************
 *
 *traceGraph:
 *  digraphDb is a adjancency list that stores edgeId.
 *  unordered_map<cmpId, vector<pair<cmpId, count_of_cmpid>>>
 *
 *  edgeId dictionary for debugging purpose
 *   key: cmpId
 *   value: cmpid
 *
 * Graph always starts from 0, a fake node. cmpId starts from 1.
 ******************************************************/


class traceGraph{
  private:
    unordered_map<uint64_t, vector<uint64_t>> digraphDb;
    uint64_t diGraphSize;
    uint64_t *cmpInfoListSize;
    uint64_t *cmpNodeInfoList;
  
  public:
    traceGraph(uint64_t*, uint64_t* );
    traceGraph() = delete;
    traceGraph(const traceGraph &obj) = delete;
    traceGraph(traceGraph &&obj) = delete;
    traceGraph& operator=(const traceGraph& other) = delete;
    traceGraph& operator=(traceGraph&& other) = delete;
    
    void updateGraphCore();
    void generateDotGraph();

};

#endif
