
#ifndef _HAVE_CONFIG_H
#define _HAVE_CONFIG_H

#define LFSRSTARTNUM 3
#define LFSRFULL -1

enum ERROR {
  ALLOC_SHM_FAIL = -999,
  SET_ENV_FAIL,
  GET_ENV_FAIL
};

enum FAULT {
  FAULT_CRASH,
  FAULT_TMOUT,
  FAULT_ERROR,
  FAULT_NONE,
  SHM_FULL
};


#define USE_COLOR

//maximum number of strs in a assembly code line
#define MAX_LINE 100

#define SHM_ENV_CMP "SHM_ENV_CMP"
#define SHM_ENV_EDGE "SHM_ENV_EDGE"
#define SHM_ENV_GCNT "SHM_ENV_GCNT"
/* Default timeout for fuzzed code (milliseconds). This is the upper bound,
   also used for detecting hangs; the actual value is auto-scaled: */

#define EXEC_TIMEOUT        99999999

/* Timeout rounding factor when auto-scaling (milliseconds): */

#define EXEC_TM_ROUND       20

/* Default memory limit for child process (MB): */

/* Maximum size of input file, in bytes (keep under 100MB): */

#define MAX_FILE            (1 * 1024 * 1024)

/* Distinctive bitmap signature used to indicate failed execution: */

#define EXEC_FAIL_SIG       0xfee1dead

/* Designated file descriptors for forkserver commands (the application will
   use FORKSRV_FD and FORKSRV_FD + 1): */
  #define FORKSRV_FD          196

/* Fork server init timeout multiplier: we'll wait the user-selected
   timeout plus this much for the fork server to spin up. */

#define FORK_WAIT_MULT      10

/* Map size for the traced binary (2^MAP_SIZE_POW2). Must be greater than
   2; you probably want to keep it under 18 or so for performance reasons
   (adjusting AFL_INST_RATIO when compiling is probably a better way to solve
   problems with complex programs). You need to recompile the target binary
   after changing this - otherwise, SEGVs may ensue. */

#define MAP_SIZE_STR        "1048576"
#define MAP_SIZE            atoi(MAP_SIZE_STR)
#define MEM_LIMIT           200

/* CMP_DICT_SIZE = (MAP_SIZE/6)*8 */
#define CMP_DICT_SIZE_STR   "1400000"   

#define MAX_ALLOC           100000  
#define MAX_CMP_STORAGE     65536

/*********************************************
 * This is for cmpNodeInfoList and trace array
 * cmpNodeInfoList: cmpid1, x, x, x cmpid2, x, x, x
 * trace: cmpid1 edge1 cmpid2 edge2...
 * only cmpid1 = 0 so we use value 0 to indicate the end of data.*/

/* Analyzer run mode */
#define SINGLE_RUN 0
#define COOP       1


/*PATH_MAP_SIZE MUST BE 2^32, 2^16, 2^10*/
#define PATH_MAP_SIZE 4294967296
/*This macro is used for as_wrap.h*/
#define PATH_MAP_SIZE_STR "0xFFFFFFFF"//"4294967295"

/**********************************************
 *
 * definitions in graphCtl
 * *******************************************/

#define MAX_OP_DATA_STORAGE 1
#define TRACE_GRAPH_FILE "trace_graph.dot"
#define JUMP_TABLE_FILE_NAME "jmpTable.log"

#define DEFAULT_MODE 0
#define SEARCH_MODE 1
#define ML_MODE 2

#define MAX_NO_NEW_ENTRY_CNT 200
#define REFINE_THRESHOLD 0.2

#endif /* ! _HAVE_CONFIG_H */
