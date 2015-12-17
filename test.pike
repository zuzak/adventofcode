#!/usr/bin/pike
#pike 7.8
/**
 * Test script for Advent of Code.
 * To use, add inputs for each question into a text file; e.g.:
 *     4/data.txt
 *     7/datb.txt
 *
 * Each line should have the correct answer, followed by a space,
 * and then the input; multi-line input can be specified by -.
 * You can use # as start-of-line comments.
 */

import Stdio;

int main(int argc, array(string) argv) {
	array(string) files = get_dir(".");
	sort(files);
	int code = 0;

	write("Running test suite...");
	foreach(files, string file) {
		if ( sizeof(file) > 2 ) continue;
		code += test(file + "a");
		code += test(file + "b");
	}

	write("\n" + (int)code + " errors.");
	if ((int)code == 0) {
		write(" Well done!\n");
	} else {
		write(" :'(\n");
	}
	return code;
}

int test(string id) {
	write("\n" + id + " ");
	string part = id[(sizeof(id)-1)..];
	string number = id[..(sizeof(id)-2)];

	string dir = number;

	if ( number[0..0] == "0" ) {
		number = number[1..];
	}
	id = number + part;
	string suffix = "";

	if (!exist(dir + "/dat" + part + ".txt")) {
		// probably haven't done part B yet
		write("SKIPPED");
		return 0; // pretend to succeed
	}

	string corpus = Stdio.File(dir + "/dat" + part + ".txt")->read();

	array(string) data = corpus / "\n";

	int code = 0;
	string overflow = ""; int of = 0;
	foreach(data, string datum) {
		/* parse next line */
		array(string) str = datum / " ";
		if ( sizeof(str) != 2 ) continue; /* something went wrong! */
		string answer = str[0];
		string question = str[1];

		if ( answer == "-" ) {
			/* multi-line input */
			of = 1;
			overflow += question + "\n";
		} else if ( answer == "#" ) {
			// comment
			continue;
		} else if ( of == 1 ) {
			question = question + "\n" + overflow;
			overflow = "";
			of = 0;
		}

		mapping res;
		if ( exist(dir + "/" + id + ".pike") ) {
			res = Process.run("pike " + dir + "/" + id + ".pike '" + question + "'");
		} else if ( exist( dir + "/" + id + ".py" ) ) {
			res = Process.run("./" + dir + "/" + id + ".py '" + question + "'");
			suffix = " (python)";
		} else {
			write("!"); // test suite can't cope :(
			code = 1;
		}


		string response = res["stdout"];
		if ( res["exitcode"] != 0 ) {
			// error
			code = 1;
			write("!");
		} else if ( response == (answer+"\n") ) {
			// correct
			write(".");
		} else {
			// wrong
			code = 1;
			write("X");
		}
	}
	if ( code == 0 ) {
		write("OK" + suffix);
	} else {
		write("NO" + suffix);
	}
	return code;
}
