#include "graphcore.h"
#define DEBUG 1


/****************************
 * updateGraph
 * Input trace: <cmp1, edge1, cmp2, edge2...>
 * Output: updated diGraphDb,  
 * * Last edge always connect back to 0
 * **************************/

void traceGraph::updateGraphCore( ) {
  
  uint64_t sourceId;
  uint64_t destId;
  
  unordered_set<uint64_t> markedEdges;
  
  for (uint64_t t = 0; t < *cmpInfoListSize / 4; t++) {
    
    if (t == 0) {
      sourceId = 0;
      destId = cmpNodeInfoList[t*4];
    }
    else if ( t == *cmpInfoListSize / 4 - 1) {
      sourceId = cmpNodeInfoList[t * 4 - 4];
      destId = 0;
    }
    else {
      sourceId = cmpNodeInfoList[t * 4 - 4];
      destId = cmpNodeInfoList[t*4];
    }
    
    if (digraphDb.find(sourceId) == digraphDb.end()) {
      digraphDb.insert({sourceId, vector<uint64_t>()});
    }

    auto it = find_if(digraphDb[sourceId].begin(), digraphDb[sourceId].end(),
        [&destId](const uint64_t& element){
          return element == destId;
        });

    uint64_t code = ((uint64_t)destId << 32) | sourceId;
    
    if (it == digraphDb[sourceId].end()) {
     
      digraphDb[sourceId].push_back({destId});
      markedEdges.insert(code);  
    }
    else {
      if (markedEdges.find(code) == markedEdges.end()) {
        FATAL("An edge exercised more than once. Possible graph error or hashtable crash \n"); 
      }
    }
  }
/*
  for (uint64_t i = 0; i < cmpInfoListSize / 4; i++) {
    uint64_t j = i * 4;
    if (cmpNodeDb.find(cmpNodeInfoList[j]) == cmpNodeDb.end()) {
      cmpNodeDb.insert({cmpNodeInfoList[j],
          cmpNode(
            cmpNodeInfoList[j],
            cmpNodeInfoList[j+1],
            cmpNodeInfoList[j+2], 
            cmpNodeInfoList[j+3])}
     );
    }
    else {
      if (cmpNodeDb.at(cmpNodeInfoList[j]).operandDB.size() == MAX_OP_DATA_STORAGE) {
        cmpNodeDb.at(cmpNodeInfoList[j]).operandDB.pop_front();
      }
      if (cmpNodeDb.at(cmpNodeInfoList[j]).operandDB.size() < MAX_OP_DATA_STORAGE) {
        cmpNodeDb.at(cmpNodeInfoList[j]).operandDB.push_back({
            cmpNodeInfoList[j+2], 
            cmpNodeInfoList[j+3]
        });
      }
    }
  }
*/
  SAYF(cGRN "Number of cmps in the path: %lu \n", *cmpInfoListSize / 4);
  SAYF(cGRN"digraphDb size: %lu", digraphDb.size());
}


void traceGraph::generateDotGraph() {
  
  string dotfile = "strict digraph { \n";
  for (auto it = digraphDb.begin(); it != digraphDb.end(); it++) {
    string parentId = to_string(it->first);
    string parentlabel = to_string(it->first & 0xffff);
    dotfile += parentId + "[label=" + parentlabel + "]\n";
    for (auto it2 = it->second.begin(); it2 != it->second.end(); it2++) {
      string childId = to_string(*it2);
      string childLabel = to_string(*it2 & 0xffff);
      dotfile += childId + "[label=" + childLabel + "]\n";
      dotfile += parentId + "->" + childId + "\n";
    }
  }
  dotfile += "}";
  ofstream outFile;
  outFile.open(TRACE_GRAPH_FILE, ios::trunc);
  outFile << dotfile;
  outFile.close();
}

traceGraph::traceGraph(uint64_t *sizePtr, uint64_t *ptr) {
  cmpInfoListSize = sizePtr;
  cmpNodeInfoList = ptr;
}
