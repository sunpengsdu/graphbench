package org.apache.spark.examples.graphx.sat

import org.apache.spark.graphx.GraphLoader
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
import org.apache.spark.storage.StorageLevel
import org.apache.spark.graphx.{Graph, VertexId}

object SSSP {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf().setAppName("SSSP")
    val sc = new SparkContext(conf)
    // val graph = GraphLoader.edgeListFile(sc, "hdfs://bdp-10:9000/tsv/twitter-2010.tsv", edgeStorageLevel = StorageLevel.MEMORY_AND_DISK, vertexStorageLevel = StorageLevel.MEMORY_AND_DISK)
    val graph = GraphLoader.edgeListFile(sc, "hdfs://bdp-10:9000/tsv/uk-2014.tsv", edgeStorageLevel = StorageLevel.DISK_ONLY, vertexStorageLevel = StorageLevel.DISK_ONLY)
    val sourceId: VertexId = 42 // The ultimate source
    // Initialize the graph such that all vertices except the root have distance infinity.
    val initialGraph = graph.mapVertices((id, _) =>
        if (id == sourceId) 0.0 else Double.PositiveInfinity)
    val sssp = initialGraph.pregel(Double.PositiveInfinity)(
      (id, dist, newDist) => math.min(dist, newDist), // Vertex Program
      triplet => {  // Send Message
        if (triplet.srcAttr + triplet.attr < triplet.dstAttr) {
          Iterator((triplet.dstId, triplet.srcAttr + triplet.attr))
        } else {
          Iterator.empty
        }
      },
      (a, b) => math.min(a, b) // Merge Message
    )
  //  println(sssp.vertices.collect.mkString("\n"))
  }
}
