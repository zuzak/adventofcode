#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	if ( argc != 2 ) return 64;

	int x = 0;
	int y = 0;

	array steps = argv[1] / 1;

	multiset(string) houses = (< "0,0" >);

	foreach (steps, string step) {
		if ( step == "^" ) x++;
		if ( step == "v" ) x--;
		if ( step == ">" ) y++;
		if ( step == "<" ) y--;

		houses |= (< (string)x + "," + (string)y >);
	}

	write((array)houses);
	write("\n"+sizeof(houses) + "\n");

}
