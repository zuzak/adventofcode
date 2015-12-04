#!/usr/bin/pike
#pike 7.8

int crack(string needle, string prefix) {
	string current;
	int i = -1;

	do {
		i++;
		current = needle + (string)i;
	} while (md5(current)[..(sizeof(prefix)-1)] != prefix);
	return i;

}

string md5(string input) {
	return String.string2hex(Crypto.MD5.hash(input));
}
