CCOMPILE=/opt/mpich/bin/mpic++
PLATFORM=Linux-amd64-64
CPPFLAGS= -I$(HADOOP_PREFIX)/src/c++/libhdfs -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux
LIB = -L$(HADOOP_PREFIX)/c++/$(PLATFORM)/lib
LDFLAGS = -lhdfs -Wno-deprecated -O2

all: run

run:  PageRank.cpp
	$(CCOMPILE) -std=c++11  PageRank.cpp $(CPPFLAGS) $(LIB) $(LDFLAGS)  -o run_basic
	$(CCOMPILE) -std=c++11  PageRank_recoding.cpp $(CPPFLAGS) $(LIB) $(LDFLAGS)  -o run_recoding
	$(CCOMPILE) -std=c++11  PageRank_recoded.cpp $(CPPFLAGS) $(LIB) $(LDFLAGS)  -o run_recoded

clean:
	-rm run_basic
	-rm run_recoding
	-rm run_recoded
