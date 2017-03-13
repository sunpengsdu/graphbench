CCOMPILE=/opt/mpich/bin/mpic++
PLATFORM=Linux-amd64-64
CPPFLAGS= -I$(HADOOP_PREFIX)/src/c++/libhdfs -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux
LIB = -L$(HADOOP_PREFIX)/c++/$(PLATFORM)/lib
LDFLAGS = -lhdfs -Wno-deprecated -O2

all: run

run:  sssp.cpp
	$(CCOMPILE) -std=c++11  sssp.cpp $(CPPFLAGS) $(LIB) $(LDFLAGS)  -o run_basic

clean:
	-rm run_basic
