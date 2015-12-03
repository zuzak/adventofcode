#!/usr/bin/pike
#pike 7.8
import String;

int main(int argc, array(string) argv) {
	if (argc != 2) return 64;
	int a = count(argv[1], "(");
	int b = count(argv[1], ")");
	write((string)(a - b)+"\n");
}
