#!/usr/bin/pike
#pike 7.8

/**
 * This code works fine if you replace all the \ with /.
 * I don't think I understand how Pike deals with \x
 */
int main(int argc, array(string) argv) {
	if (argc != 2) return 64;

	array(string) lines = argv[1] / "\n";
	int count = 0;

	foreach (lines, string line) {
		/* guard against accidental \n\n */
		if ( sizeof(line) < 2 ) {
			continue;
		}
		string parsed = line;

		// remove outside ""
		//parsed = parsed[1..(sizeof(parsed)-2)];

		// backslash and quotes
		parsed = parsed - "\\"; // \\
		parsed = parsed - "\\\""; // \"


		int escapeCount = (sizeof(line) - sizeof(parsed))/2;

		string hexesc = parsed - "\\x"; // \x
		escapeCount += sizeof(parsed) - sizeof(hexesc);
		escapeCount += ((sizeof(parsed) - sizeof(hexesc))/2);

		count += escapeCount + 2;

	}

	write(count+"\n");

}
