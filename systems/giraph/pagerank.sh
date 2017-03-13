/opt/hadoop-1.2.1/bin/hadoop fs -rmr /giraph/ou*


#-ca giraph.isStaticGraph=true \
#-ca giraph.maxMessagesInMemory=200000 \


/opt/hadoop-1.2.1/bin/hadoop \
jar /opt/giraph_1.2/giraph-examples/target/giraph-examples-1.3.0-SNAPSHOT-for-hadoop-1.2.1-jar-with-dependencies.jar \
org.apache.giraph.GiraphRunner org.apache.giraph.examples.SimplePageRankComputation \
-ca giraph.zkList=192.168.1.21:2181 \
-ca giraph.waitTaskDoneTimeoutMs=900000000 \
-ca giraph.zKMinSessionTimeout=800000000 \
-ca giraph.zKMaxSessionTimeout=900000000 \
-ca giraph.useOutOfCoreGraph=true \
-ca giraph.maxPartitionsInMemory=1 \
-ca giraph.useOutOfCoreMessages=true \
-ca giraph.nettyCompressionAlgorithm=SNAPPY \
-ca giraph.useInputSplitLocality=true \
-ca giraph.enableFlowControlInput=true \
-ca giraph.waitForPerWorkerRequests=true \
-ca giraph.useBigDataIOForMessages=true \
-ca giraph.maxNumberOfSupersteps=20 \
-ca giraph.maxMasterSuperstepWaitMsecs=60000000 \
-ca giraph.nettyServerThreads=4 \
-ca giraph.nettyServerExecutionThreads=2 \
-ca giraph.nettyClientExecutionThreads=4 \
-ca giraph.nettyClientThreads=2 \
-vif org.apache.giraph.io.formats.JsonLongDoubleFloatDoubleVertexInputFormat \
-vip  /giraph/webuk.giraph \
-vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat \
-op /giraph/out15 \
-w 100 \
-mc org.apache.giraph.examples.SimplePageRankComputation\$SimplePageRankMasterCompute
