#include "stdio.h"

int main() {

  FILE* fl = fopen("test.data", "r");
  char buf[64];
  int cnt = 0;
  while (fgets(buf, 64, fl)) {
    
    if (buf[1] == 'a' 
        && buf[2] == 'b' 
        && buf[3] == 'c') {
      
      printf("yes!\n");
    }
    cnt++;
  }
  return 0;
}
