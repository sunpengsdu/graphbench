#include "pregel_app_sssp.h"

int main(int argc, char* argv[]){
	init_workers();
	pregel_sssp(1, "/pregel/webuk", "/pregel/out_2", true);
	//pregel_sssp(1, "/pregel/uk-2014", "/pregel/out_2", true);
	worker_finalize();
	return 0;
}
