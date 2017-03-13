CCOMPILE=/opt/mpich/bin/mpic++
PLATFORM=Linux-amd64-64
CPPFLAGS= -I$(HADOOP_PREFIX)/src/c++/libhdfs -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux
LIB = -L$(HADOOP_PREFIX)/c++/$(PLATFORM)/lib
LDFLAGS = -lhdfs -Wno-deprecated -O2

all: run

run: run.cpp
	$(CCOMPILE)  run.cpp $(CPPFLAGS) $(LIB) $(LDFLAGS)  -o run

clean:
	-rm run
