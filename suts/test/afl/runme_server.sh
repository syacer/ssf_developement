export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ubuntu/research/sjyfuzz/trace_analyzer/connect_lib
rm -rfv /home/ubuntu/*.fifo
../../../AFL-master/afl-fuzz -i testcase_dir -o findings_dir /home/ubuntu/research/sjyfuzz/suts/test/afl/test_afl_inst @@
