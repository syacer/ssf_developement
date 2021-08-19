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

PROGNAME    = search-based_statistical_structural_fuzzing_instrument
VERSION     = 0.1

HDR_FOLDER    ?= ../../include
CC          = gcc
PROGS       = ssf_instrument

CFLAGS     ?= -O0 -funroll-loops -g -no-pie -m64
CFLAGS     += -Wall -D_FORTIFY_SOURCE=2 -g -Wno-pointer-sign \
			  -DSSF_INST_PATH=\"$(PWD)\"

INC			=-I$(HDR_FOLDER)

LDFLAGS  += -ldl

COMM_HDR    = alloc-inl.h  $(HDR_FOLDER)/types.h $(HDR_FOLDER)/config.h $(HDR_FOLDER)/debug.h 

all: compile_wrap as_wrap

compile_wrap: compile_wrap.c $(COMM_HDR) 
	$(CC) $(CFLAGS) $(INC) $@.c -o $@ $(LDFLAGS)
	ln -sf compile_wrap compile_wrap++

as_wrap: as_wrap.c as_wrap.h $(COMM_HDR)
	$(CC) $(CFLAGS) $(INC) $@.c -o $@ $(LDFLAGS) 
	ln -sf as_wrap as

clean: 
	rm -rvf compile_wrap as_wrap as	astmp compile_wrap++

