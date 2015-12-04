#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	array(string) files = get_dir(".");
	int code = 0;

	write("Running test suite...");
	foreach(files, string file) {
		if ( sizeof(file) > 2 ) continue;
		code += test(file + "a");
		code += test(file + "b");
	}

	write("\n" + (int)code + " errors.\n");
	return code;
}

int test(string id) {
	write("\n" + id + " ");
	string part = id[(sizeof(id)-1)..];
	string number = id[..(sizeof(id)-2)];

	string dir = number;

	string corpus = Stdio.File(dir + "/dat" + part + ".txt")->read();

	array(string) data = corpus / "\n";

	int code = 0;
	foreach(data, string datum) {
		array(string) str = datum / " ";
		if ( sizeof(str) != 2 ) continue;
		string answer = str[0];
		string question = str[1];

		mapping res = Process.run("pike " + dir + "/" + id + ".pike " + question);

		string response = res["stdout"];
		if ( response == (answer+"\n") ) {
			write(".");
		} else {
			code = 1;
			write("X");
		}
	}
	if ( code == 0 ) {
		write("OK");
	} else {
		write("NO");
	}
	return code;
}
