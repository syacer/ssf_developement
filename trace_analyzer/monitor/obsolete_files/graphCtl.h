#include <vector>
#include <cstdint>
#include <stdio.h>
#include <sys/stat.h>
#include "config.h"
#include <fstream>
#include "graphcore.h"
#include "config.h"

using namespace std;

class graphCtl {
  
  private:
    traceGraph trgraph;

  public:
    void updateGraph();
    string exec(const string cmd);
    void debugProcedure1();
    void visualizeTree();
};
