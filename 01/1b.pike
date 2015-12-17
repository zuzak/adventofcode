#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	if (argc != 2) return 64;

	array(string) stairs = argv[1] / 1;
	int count = 0;
	int i = 0;
	foreach (stairs, string stair) {
		stair == "(" ? count++ : count--;
		i++;
		if (count < 0) break;
	}
	write((string)i+"\n");
}
