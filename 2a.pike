#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	if (argc != 2) return 64;

	array(string) lines = argv[1] / "\n";

	int count;
	foreach (lines, string line) {
		array(string) arg = line / "x";
		array(int) args = (array(int))arg; // what is this

		int a = args[0] * args[1];
		int b = args[0] * args[2];
		int c = args[1] * args[2];

		count +=  2 * (a + b + c) + min(a, b, c);
	}

	write(count + "\n");
}
