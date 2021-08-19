#include "../sjyfifo.h"


int main() {

  setfifoType(I_AM_CLIENT);
  setupCommunication();
  
  char** argv;
  argv = (char**)malloc(100);
  for (int i = 0; i < 10; i++) {
    argv[i] = (char*)malloc(100);
  }

  passargvtoclient(argv, -1);
  
  for (int i = 0; i < 10; i++) {
    printf("Y: %s", &argv[i][0]);
  }
  

 /* printf("AAAAAAA\n");
  int fd;
  printf("open fifo file \n");
  fd = open("/home/ubuntu/sjy_client.fifo", O_WRONLY);
  char a;
  printf("sending data ... \n");
  getchar();
  write(fd, &a, 1);
  write(fd, &a, 1);
  close(fd);
  printf("end \n");*/
}
