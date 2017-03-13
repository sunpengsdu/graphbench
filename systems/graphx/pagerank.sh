sbt package

/opt/spark-1.6.1-bin-hadoop1/bin/spark-submit \
--class org.apache.spark.examples.graphx.sat.Analytics \
--master spark://bdp-10:7077 \
/home/mapred/share/graphx/target/scala-2.10/satgraphpro_2.10-1.0.jar \
pagerank hdfs://bdp-10:9000/tsv/webuk.tsv \
--numEPart=2500 \
--numIter=20 
#--edgeStorageLevel=DISK_ONLY \
#--vertexStorageLevel=DISK_ONLY 
