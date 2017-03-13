/opt/hadoop-1.2.1/bin/hadoop fs -rmr /pregel/out
/opt/mpich/bin/mpirun -n 198  -f ../hosts sh pagerank.sh
