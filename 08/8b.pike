#!/usr/bin/pike
#pike 7.8

import .escape;

int main(int argc, array(string) argv) {
	if (argc != 2) return 64;

	array(string) lines = argv[1] / "\n";
	int count = 0;

	foreach (lines, string line) {
		/* guard against accidental \n\n */
		if ( sizeof(line) < 2 ) {
			continue;
		}
		string escaped = "";
		for (int i = 0; i < sizeof(line); i++) {
			string curr = line[i..i];
			// surely there is a better way
			if (curr == "\\") {
				curr = "\\\\";
			} else if (curr == "\"") {
				curr = "\\\"";
			}
			escaped += curr;
		}
		escaped = "\"" + escaped + "\"";

		//write("Original: [" + (int)sizeof(line) + "] " + line+ "\n");
		//write("Escaped : [" + (int)sizeof(escaped) + "] " + escaped + "\n");

		count += sizeof(escaped) - sizeof(line);

	}

	write(count+"\n");

}
