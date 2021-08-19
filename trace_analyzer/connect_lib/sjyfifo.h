#include <stdbool.h>
#include <stdio.h>
#include <errno.h>
#include <error.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/time.h>
#include <signal.h>
#include <string.h>
#include <stdlib.h>
#include <debug.h>
#include <time.h>
#include <wait.h>

#ifdef C_PROJ
 #define EXTERN extern "C"
#else
 #define EXTERN
#endif

#ifdef FIFO_LOC
    #define FIFO_CLIENT FIFO_LOC"sjy_client.fifo"
    #define FIFO_SERVER FIFO_LOC"sjy_server.fifo"
#else
    #define FIFO_CLIENT "sjy_client.fifo"
    #define FIFO_SERVER "sjy_server.fifo"
#endif


#define MAX_ALLOWED_TIME 30
#define MAX_BUF_SIZE 256
#define I_AM_CLIENT 1
#define I_AM_SERVER 0
#define SETUP_FAIL -1
#define FIFO_FILE_NAME_SIZE 30
#define REST "$@endofline@$"

typedef struct pids {
  pid_t serverId;
  pid_t childId;
  pid_t mainId;
} pids;

EXTERN  void removefifo();
EXTERN  void setfifoType(int);
EXTERN  void setupCommunication();
EXTERN  int recvnbytes(char*, int);
EXTERN  int sendnbytes(const char*, int);
EXTERN  int passargvtoclient(char**, int*);
EXTERN  int passpidstoserver(pids*);
EXTERN  void fifoActonExit();
