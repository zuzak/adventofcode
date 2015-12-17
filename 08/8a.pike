#!/usr/bin/pike
#pike 7.8
/**
 * http://adventofcode.com/day/8
 *
 * Over=escape \\, \" and \x, then return the difference in string length
 */

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
		count += countEscaped(line);

	}

	write(count+"\n");

}
