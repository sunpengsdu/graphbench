#include "../system/RecodeVertex.h"
#include "../system/RecodeComper.h"
#include "../system/RecodeRunner.h"
#include "../system/Combiner.h"

#define PAGERANK_ROUND 10

class PRCombiner:public Combiner<double>
{
	public:
		virtual void combine(double& old, const double& new_msg)
		{
			old += new_msg;
		}
};

class PRVertex:public RecodeVertex<VertexID, double, VertexID, double, PRCombiner> //RecodeVertex must specify combiner
{
	public:
		virtual void compute(double agg_msg, vector<VertexID> & edges)
		{
			if(step_num()==1) value = 1.0;
			else value = 0.15 + 0.85 * agg_msg;
			//---
			if(step_num() < PAGERANK_ROUND)
			{
				double msg = value / degree; //value is double, so division gives double
				for(int i=0; i<edges.size(); i++) send_message(edges[i], msg);
			}
			else vote_to_halt();
		}
};

class PRComper:public RecodeComper<PRVertex>
{
	char buf[100];

	public:
		virtual double get_zero() //RecodeComper must specify "identity element"
		{
			return 0;
		}

		virtual void to_line(PRVertex& v, ofstream& fout)
		{
			fout<<v.id<<'\t'<<v.value<<endl; //report: vid \t pagerank
		}

		virtual void to_line(PRVertex& v, BufferedWriter& fout)
		{
			sprintf(buf, "%d\t%lf\n", v.id, v.value);
			fout.write(buf);
		}
};

int main(int argc, char* argv[])
{
	RecodeRunner<PRVertex, PRComper> runner;
	string hdfs_inpath = argv[1];
	string hdfs_outpath = argv[2];
	string local_root = "/home/mapred/tmp/iopregel";
	bool dump_with_edges = false;
	bool sender_combine = false; //may try both options here !!!
	runner.runLH(hdfs_outpath, local_root, dump_with_edges, sender_combine, argc, argv); //HDFS Load, HDFS Dump
    return 0;
}
