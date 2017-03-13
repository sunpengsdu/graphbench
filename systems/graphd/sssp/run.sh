/opt/hadoop-1.2.1/bin/hadoop fs -rmr /pregel/out
/opt/mpich/bin/mpiexec -n 180 -f ../hosts sh /home/mapred/share/graphd/sssp/sssp.sh
