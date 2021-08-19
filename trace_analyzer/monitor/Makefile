#
# instrumentation - makefile
# -----------------------------
#
# Written and maintained by Michal Zalewski <lcamtuf@google.com>
# 
# Copyright 2013, 2014, 2015, 2016, 2017 Google Inc. All rights reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
# 
#   http://www.apache.org/licenses/LICENSE-2.0
#

PROGNAME    = search-based_statistical_structural_fuzzing_analyzer
VERSION     = 0.1

COM_DIR_NAME  = connect_lib
CC          = g++
PROG        = ssf_analyzer

FLAGS   	= -O0 -funroll-loops -g -no-pie -m64 \
			  -Wall -Werror -D_FORTIFY_SOURCE=2 -D C_PROJ

LDFLAGS     = -linter-comm

LDPATH      = -L../connect_lib

INC	 = -I../../include -I../connect_lib

SRCX = $(wildcard *.cpp) 

OBJS = $(patsubst %.cpp, %.o, $(SRCX))


.PHONY: clean all

all: $(PROG) 

$(PROG): $(OBJS)
	$(CC) $(LDPATH) $^ -o $@ $(LDFLAGS)

%.o:%.cpp
	$(CC) $(INC) $(FLAGS) -c $< -o $@

clean: 
	rm -rvf $(OBJS) $(PROG) debug

echo:
	echo $(OBJS)
	echo $(INCXX)
