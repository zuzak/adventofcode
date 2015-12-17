#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	array set = argv[1] / "\n";
	set = (array(int))set;

	array pset = powerset(set);

	int count = 0;

	for ( int i = 0; i < sizeof(pset); i++ ) {
		if (Array.sum(pset[i]) == 150) {
			count++;
		}
	}

	write((string)count+"\n");
}

array powerset(array in) {
	// courtesy of Martin Bähr
	return `+(@Array.combinations(in, enumerate(sizeof(in)+1)[*]));
}

