export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ubuntu/research/sjyfuzz/trace_analyzer/connect_lib 

if [ "$1" = 'c' ];
then
    make clean
    rm -rfv debug
    make
elif [ "$1" = 'i' ];
then
  pushd ../instrumentation
  make clean
  make
  cd test
  make clean
  make
  popd
  make clean
  rm -rfv debug
  make
fi

if [ "$2" = 'g' ];
then
    gdb --args ./ssf_analyzer /home/ubuntu/research/sjyfuzz/trace_analyzer/instrumentation/test/test
else
    ./ssf_analyzer /home/ubuntu/research/sjyfuzz/trace_analyzer/instrumentation/test/test
fi
