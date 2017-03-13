sbt package

/opt/spark-1.6.1-bin-hadoop1/bin/spark-submit \
--class org.apache.spark.examples.graphx.sat.SSSP \
--master spark://bdp-10:7077 \
/home/mapred/share/graphx/target/scala-2.10/satgraphpro_2.10-1.0.jar
