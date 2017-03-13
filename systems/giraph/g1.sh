/opt/hadoop-1.2.1/bin/hadoop fs -rmr /giraph/ou*

#-ca giraph.zkList=bdp-10:21281 \

/opt/hadoop-1.2.1/bin/hadoop \
jar /opt/giraph/giraph-examples/target/giraph-examples-1.3.0-SNAPSHOT-for-hadoop-1.2.1-jar-with-dependencies.jar \
org.apache.giraph.GiraphRunner org.apache.giraph.examples.SimplePageRankComputation \
-ca giraph.waitTaskDoneTimeoutMs=900000000 \
-ca giraph.zKMinSessionTimeout=800000000 \
-ca giraph.zKMaxSessionTimeout=900000000 \
-ca useOutOfCoreGraph=true \
-ca enableFlowControlInput=true \
-ca waitForPerWorkerRequests=true \
-ca useOutOfCoreMessages=true \
-ca giraph.useBigDataIOForMessages=true \
-ca giraph.maxPartitionsInMemory=0 \
-ca giraph.isStaticGraph=true \
-ca giraph.maxNumberOfSupersteps=200 \
-ca giraph.maxMasterSuperstepWaitMsecs=60000000 \
-vif org.apache.giraph.io.formats.JsonLongDoubleFloatDoubleVertexInputFormat \
-vip  /giraph/twitter-2010.giraph \
-vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat \
-op /giraph/out15 \
-w 50 \
-mc org.apache.giraph.examples.SimplePageRankComputation\$SimplePageRankMasterCompute
