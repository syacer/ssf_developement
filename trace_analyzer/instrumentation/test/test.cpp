#include <iostream>
#include "test2.h"
#include <string.h>
#include <fstream>
#include <sstream>
using namespace std;

int main(int argc, char** argv) {
  
  

  char* path = argv[1];

  ifstream t(path);
  string line;

  getline(t, line);

  cout << line << endl;
  if (line[12] == 'a') {
    cout << "AAA" << endl;
  }
  istringstream iss(line);
  string token;
  string token2;
  int val1;
  int val2;
  getline(iss, token, ' ');
  getline(iss, token2, ' ');
  istringstream isstoken(token);
  istringstream isstoken2(token2);
  isstoken >> val1;
  isstoken2 >> val2;
  cout << val1  << " " << val2 << endl;
  if (val1 == 65535) {
    if (val2 == 65535) {
     printf("mystr \n");
    }
  }
}

