


PROGNAME = inter-process-comm-library
VERSION  = 0.1

CC = gcc
PROG = inter-comm

FIFO_LOC = /home/$(USER)/

FLAGS = -O0 -g -fpic -m64 -Wall -D_FORTIFY_SOURCE=2 -Werror -D FIFO_LOC='"$(FIFO_LOC)"'
LDFLAGS += -ldl -shared -lpthread -lrt

SRC = $(wildcard *.c)
INC = -I../../include
OBJS = $(patsubst %.c, %.o, $(SRC))


.PHONY: clean all

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $^ -o lib$@.so $(LDFLAGS)

%.o:%.c
	$(CC) $(FLAGS) $(INC) -c $< -o $@

clean:
	rm -rfv $(OBJS) *$(PROG)*
