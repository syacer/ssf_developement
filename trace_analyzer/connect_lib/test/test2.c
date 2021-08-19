
#include "../sjyfifo.h"


int main() {


  
  char** argv;
  argv = (char**)malloc(100);
  for (int i = 0; i < 5; i++) {
    argv[i] = (char*)malloc(100);
    argv[i][0] = 's';
    printf("\nA: %c", argv[i][0]);
  }

  printf("\naaaaaaaaa \n");

  setfifoType(I_AM_SERVER);
  setupCommunication();
  passargvtoclient(argv, 5);

  /*
  int fd;
  printf("open fifo file \n");
  fd = open("/home/ubuntu/sjy_client.fifo", O_RDONLY);
  char a;
  printf("recving data ... \n");
  getchar();
  read(fd, &a, 1);
*/
  printf("end \n");

}
