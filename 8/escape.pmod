#!/usr/bin/pike
#pike 7.8
/**
 * http://adventofcode.com/day/8
 *
 * Over=escape \\, \" and \x, then return the difference in string length
 */

int countEscaped(string line) {
	string parsed = line;

	// remove outside ""
	//parsed = parsed[1..(sizeof(parsed)-2)];

	// backslash and quotes
	parsed = parsed - "\\\\"; // \\
	parsed = parsed - "\\\""; // \"


	int escapeCount = (sizeof(line) - sizeof(parsed))/2;

	string hexesc = parsed - "\\x"; // \x
	escapeCount += sizeof(parsed) - sizeof(hexesc);
	escapeCount += ((sizeof(parsed) - sizeof(hexesc))/2);

	return escapeCount + 2;
}
