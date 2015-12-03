#!/usr/bin/pike
#pike 7.8

import Array;
int main(int argc, array(string) argv) {
	if (argc != 2) return 64;

	array(string) lines = argv[1] / "\n";

	int count;
	foreach (lines, string line) {
		array(string) arg = line / "x";
		array(int) args = (array(int))arg; // what is this

		count += (Array.sum(args) - max(args[0], args[1], args[2]))*2;
		count += args[0] * args[1] * args[2];
	}

	write(count + "\n");
}
