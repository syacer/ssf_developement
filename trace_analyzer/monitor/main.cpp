#include "analyzer_rti.h"
#include "analyzer_core.h"
#include "engine.h"

 //../../../trace_analyzer/monitor/ssf_analyzer -t /home/ubuntu/research/sjyfuzz/suts/base64/afl/base64_analyzer -d ../src/inputs/utmp-fuzzed-1.b64



analyzerRti* analyzerRti::instPtr = nullptr;
int  analyzerRti::enableGraph = 1;

int main(int argc, char** argv) {
  
  if (argc < 2) {
   ACTF("Please set instrumented binary path \n");
    return -1;
  }
 
  engine eng;
  analyzerCore<fada, engine> acore(&eng);

  if (argc == 2) {
    //COOP MODE
    analyzerRti* analyzer;
    analyzer = analyzer->getInstance();
    int ret =analyzer->setup(argv, argc, COOP);
    if (ret == -1) return -1;
    analyzer->startMonitoring<analyzerCore<fada, engine>>(&acore);
  }
  if (argc >= 3 && strstr(argv[1], "-t")) {
    // SINGLE_RUN MODE
    analyzerRti* analyzer;
    analyzer = analyzer->getInstance();
    int ret =analyzer->setup(argv, argc, SINGLE_RUN);
    if (ret == -1) return -1;
    analyzer->runTest<analyzerCore<fada, engine>>(&acore);
  }
  return 0;
}

