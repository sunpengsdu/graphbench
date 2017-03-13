#include "ghost_app_pagerank.h"

int main(int argc, char* argv[]){
	init_workers();
	set_ghost_threshold(200);//set to at least 100 for real large graphs
    ghost_pagerank("/pregel/webuk", "/pregel/out", true);
    //ghost_pagerank("/pregel/uk-2014", "/pregel/out", true);
    // ghost_pagerank("/pregel/twitter-2010", "/pregel/out", true);
	worker_finalize();
	return 0;
}
