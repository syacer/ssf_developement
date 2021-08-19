#include "graphCtl.h"



int Npow10(int N, int n){
    N <<= n;
      while(n--) N += N << 2;
        return N;
}
/***********************************
 * readTraces
 * input: cmpInfo file shm.data
 *        edgesId file shm2.data
 * output: vector of trace data
 * ********************************/
 
void graphCtl::updateGraph() {

  // First, read cmp traces.
  // trace format:
  // cmpid suffix op1 HBytes op2 HBytes
  // HBytes: For AH, AL types of registes.If it is AH, Hbytes = 1

  vector<uint64_t> cmpInfo;

  string delimiter = " ";
  ifstream ifs (cmpTraceFile, ifstream::in);
  for (string line; getline(ifs, line);) {
    size_t pos = 0;
    int cnt = 0;
    string token;
    while ((pos = line.find(delimiter)) != string::npos) {
      
      token = line.substr(0, pos);
      line.erase(0, pos + delimiter.length());
      
      uint64_t num = 0;
      for (uint64_t i = 0; i < token.size(); i++) {
          num += (token[i] - 48) * (Npow10(1, token.size() - i - 1));    
      }  
      if (cnt == 3 || cnt == 5) {
        if (num == 2) {
          // it is AL  type of register
          cmpInfo[cmpInfo.size() - 1] = cmpInfo[cmpInfo.size() - 1] & 0xff;
        }
        else if (num == 1) {
          // it is AH type of registers
          cmpInfo[cmpInfo.size() - 1] = (cmpInfo[cmpInfo.size() - 1] >> 8) & 0xff;
        }
        cnt++;
        continue;
      }
      cout << num << " ";
      cmpInfo.push_back(num);
      cnt++;
    }
    cout << endl;
  }
  
  vector<uint64_t> trace;
  //Second, readEdgeTrace
  //output: cmp1 edge1 cmp2 edge2 ....

  ifstream ifs2(edgeTraceFile, ifstream::in);
  int cnt = 0;
  for (string line; getline(ifs2, line);) {
    trace.push_back(cmpInfo[cnt * 4]);
    trace.push_back(stoll(line));
    cnt++;
  }
  
  trgraph.updateGraphCore(trace, cmpInfo);
  

  if (remove(cmpTraceFile.c_str()) != 0) {
    
    chmod(cmpTraceFile.c_str(), S_IRWXU);
    
    if (remove(cmpTraceFile.c_str()) != 0) {
    
      ERROR("remove trace file error \n");
    }
  }
 
  if (remove(edgeTraceFile.c_str()) != 0) {
    
    chmod(edgeTraceFile.c_str(), S_IRWXU);
    
    if (remove(edgeTraceFile.c_str()) != 0) {
    
      ERROR("remove trace file error \n");
    }
  }

}

void graphCtl::visualizeTree() {
 trgraph.generateDotGraph();
 //exec("dot -Tjpg " + traceGraphFile + " -o " + traceGraphFile + ".jpg"); 
}


void graphCtl::debugProcedure1() {
  //exec("./test");
  updateGraph();
  visualizeTree();
}


string graphCtl::exec(const string cmd) {
  char buffer[128];
  std::string result = "";
  FILE* pipe = popen(cmd.c_str(), "r");
  if (!pipe) throw std::runtime_error("popen() failed");
  try {
    while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
      result +=buffer;
    }
  }
  catch (...) {
    pclose(pipe);
    throw;
  }
  cout << result << endl;
  pclose(pipe);
  return result;
}
