#include "pregel_app_pagerank.h"

int main(int argc, char* argv[]){
	init_workers();
	//pregel_pagerank("/pregel/twitter-2010", "/pregel/out", true);
	pregel_pagerank("/pregel/webuk", "/pregel/out", true);
	//pregel_pagerank("/pregel/uk-2014", "/pregel/out", true);
	worker_finalize();
	return 0;
}
