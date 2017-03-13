MPI_PRE=/opt/mpich
CCOMPILE=$(MPI_PRE)/bin/mpic++
PLATFORM=Linux-amd64-64
CPPFLAGS= -I$(HADOOP_PREFIX)/src/c++/libhdfs -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -I$(MPI_PRE)/include
LIB = -L$(HADOOP_PREFIX)/c++/$(PLATFORM)/lib -L$(MPI_PRE)/lib
LDFLAGS = -lhdfs -Wno-deprecated -O2

all: run

run: put.cpp
	$(CCOMPILE) put.cpp $(CPPFLAGS) $(LIB) $(LDFLAGS)  -o put

clean:
	-rm put
