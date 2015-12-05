#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	if ( argc != 2 ) return 64;

	array(string) lines = argv[1] / "\n";

	int total = 0;
	foreach(lines, string line) {
		total += compute(line);
	}
	write(total+"\n");
	return 0;
}

int compute(string str) {
	array(string) blacklist = ({ "ab", "cd", "pq", "xy" });
	foreach(blacklist, string badstr) {
		if ( sizeof(str - badstr) < sizeof(str) ) return 0;
	}

	string vowels = "aeiou";
	int i = 0;
	foreach(vowels / 1, string vowel) {
		i += sizeof(str) - sizeof(str - vowel);
	}
	if (i < 3) return 0;

	int j = -1;
	int double = 0;
	foreach(str / 1, string char) {
		j++;
		if ( str[j..j] - str[j+1..j+1] == "" ) { // this is silly
			double = 1;
			continue;
		}
	}
	if (double == 0) return 0;

	return 1;
}





