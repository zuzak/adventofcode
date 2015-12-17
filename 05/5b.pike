#!/usr/bin/pike
#pike 7.8
/**
 * This code doesn't quite work properly.
 * It works with the test cases, but doesn't seem to give the right answer
 * when it should -- but the "naughty" strings look nice when parsed manually.
 *
 * ("correct" answer to corpus: 51)
 */

int main(int argc, array(string) argv) {
	if (argc != 2) return 64;
array(string) lines = argv[1] / "\n"; 
	int total = 0;
	foreach(lines, string line) {
		total += compute(line);
	}
	write(total+"\n");
	return 0;
}

int compute(string str) {
	int j = -1;
	int a = 0; int b = 0;
	foreach(str / 1, string char) {
		j++;
		if (sizeof(str - str[j..j+1]) < (sizeof(str) - 3)) { // this is silly
			a = 1;
		}
		string current = str[j..j+2];
		if (sizeof(current) == 3) {
			if (sizeof((current[2..2]-(current - current[1..])))==0) {
				b = 1;
			}
		}
	}
	// write(str + " " + (string)a + " " + (string)b + (a+b==2?" valid\n":"\n"));
	if (a+b == 2) return 1;

	return 0;
}
