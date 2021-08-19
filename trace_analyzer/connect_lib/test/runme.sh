export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ubuntu/research/sjyfuzz/trace_analyzer/connect_lib 
gcc test.c -I../../../include -L../. -g -o client -linter-comm
gcc test2.c -I../../../include -L../. -g -o server -linter-comm
