#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	if (argc != 2) return 64;

	array(string) lines = argv[1] / "\n";
	mapping atlas = parseCities(lines);
	array cities = indices(atlas);

	foreach(indices(atlas), string city) {
		write(city+"\n");
	}

}

mapping parseCities(array(string) lines) {
	/** load array of "A to B = T" strings into a mapping */
	mapping o = ([]);
	foreach (lines, string line) {
		// 0      1  2      3 4
		// London to Dublin = 464
		array str = line / " ";
		string a = str[0];
		string b = str[2];
		int t = (int)str[4];
		if (!o[a]) o[a] = ([]);
		if (!o[b]) o[b] = ([]);

		o[a][b] = t;
		o[b][a] = t;
	}
	return o;
}
