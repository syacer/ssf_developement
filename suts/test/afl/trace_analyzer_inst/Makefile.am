AM_CXXFLAGS=-Wall -Werror -O0 -g -Wabi-tag -D_GLIBCXX_USE_CXX11_ABI=0
AUTOMAKE_OPTIONS=foreign
bin_PROGRAMS=test
test_SOURCES=test.cpp test2.cpp
all:
	cp test ../test_analyzer_inst
clean-local:
	rm -rfv log*
