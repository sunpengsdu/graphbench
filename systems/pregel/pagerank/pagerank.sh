export LD_LIBRARY_PATH=:/opt/jdk1.8/jre/lib/amd64/server:/opt/hadoop-1.2.1/c++/Linux-amd64-64/lib:/opt/jdk1.8/jre/lib/amd64/server:/opt/jdk1.8/jre/lib/amd64

export HADOOP_HOME=/opt/hadoop-1.2.1
export JAVA_HOME=/opt/jdk1.8
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:/opt/giraph/giraph-core/target:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export PATH=":/opt/intel/intelpython27/bin:/opt/apache-maven-3.3.9/bin:$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_LIB:/opt/intel/intelpython27/lib:/usr/local/lib:$HADOOP_HOME/c++/Linux-amd64-64/lib:$JAVA_HOME/jre/lib/amd64/server:$JAVA_HOME/jre/lib/amd64
for i in $HADOOP_HOME/*.jar
do
    CLASSPATH=$CLASSPATH:$i
done
for i in $HADOOP_HOME/lib/*.jar
do
    CLASSPATH=$CLASSPATH:$i
done
export CLASSPATH

/home/mapred/share/pregel/pagerank/run
