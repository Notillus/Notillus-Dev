
x = 24;		// Height body
y = 30;		// Height body
z = 48;		// Height body
s1x = 5;	// Height body
s1z = 9;	// Height body

s2z = 12;

r1 = 4.15;	// Radio varilla lisa
r2 = 2.3;	// Radio tornillo M3
r3 = 11.2;	// Radio centro motor
r4 = 3;		// Radio tornillo M5
r5 = 7.6;	// Radio rodamiento lineal
r6 = 4.62;	// Radio tuerca M5
h6 = 4;		// Altura tuerca M5
r7 = 2.3;	// Radio poleas
r8 = 3.7;	// Radio cabeza tornillo M3
r9 = 6.1;	// Radio casquillo bronze
rM4 = 2.7;	// Radio tornillo M4
rTM5 = 4.62;	// Radio tuerca M5
hTM5 = 4;		// Altura tuerca M5
rTM4 = 4;	// Radio tuerca M4
hTM4 = 3.3;		// Altura tuerca M4
rTM3 = 3.3;	// Radio tuerca M3
hTM3 = 2.3;		// Altura tuerca M3

L1 = 3;		// Tamaño guia fijacion bloques hotend

module hotend_block_corexy()
{
	difference() {
		union() {
			// Guias fijacion bloques hotend
			translate([(x-5.2), 0, 0]) rotate([0, 45, 0]) cube([L1, y, L1]);
			translate([(x-5.2), 0, z]) rotate([0, 45, 0]) cube([L1, y, L1]);

			translate([(x-7), 0, z]) cube([11, y, 5]);
			translate([(x-7), 0, -5]) cube([11, y, 5]);
			translate([7, 0, z]) cube([(x - 14), (y/2), 5]);
			translate([7, 0, -5]) cube([(x - 14), (y/2), 5]);
			translate([x, 0, 0]) cube([4, y, z]);

			translate([(x+4), 0, ((z/2) - 10)]) cube([18, y, 20]);			
		
		}
		// Tornillos M4 fijacion bloques hotend
		translate([(x/2), ((y/2) - 5.8), z]) cylinder(h = 5, r = rM4, $fn=60);
		translate([(x/2), ((y/2) - 5.8), -5]) cylinder(h = 5, r = rM4, $fn=60);
		
		translate([(x + 13), (y/2), ((z/2) - 10)]) cylinder(h = 20, r = r1, $fn=60);
		translate([(x + 13), (y/2), ((z/2) + 4)]) cylinder(h = 8, r = 8, $fn=60);
	}
}

hotend_block_corexy();

