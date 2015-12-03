#!/usr/bin/pike
#pike 7.8

int main(int argc, array(string) argv) {
	if ( argc != 2 ) return 64;

	int sx = 0;
	int sy = 0;
	int rx = 0;
	int ry = 0;

	array steps = argv[1] / 1;

	multiset(string) houses = (< "0,0" >);

	int i = 0;
	foreach (steps, string step) {
		i++;
		int x = 0; int y = 0;
		if ( step == "^" ) x++;
		if ( step == "v" ) x--;
		if ( step == ">" ) y++;
		if ( step == "<" ) y--;

		if ( i % 2 == 0) {
			sx += x, sy += y;
		} else {
			rx += x, ry += y;
		}

		houses |= (< (string)sx + "," + (string)sy >);
		houses |= (< (string)rx + "," + (string)ry >);
	}

	write(sizeof(houses) + "\n");

}
