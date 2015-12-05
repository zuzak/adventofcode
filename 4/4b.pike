#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	if (argc != 2) return 64;
	write((string).crack.crack(argv[1], "000000")+"\n");
}
