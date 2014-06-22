
x = 24;		// Height body
y = 20;		// Height body
z = 48;		// Height body
s1x = 5;	// Height body
s1z = 9;	// Height body

r1 = 4.2;	// Radio varilla lisa
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

module fija_correa_block_corexy()
{
	union() {
		fijacion1();
		translate([10, 0, 1]) fijacion2();
	}
}

module fijacion1()
{
		difference() {
			union() {
				//Hueco piezas sujecion correa
				cube([5.5, y, s1z]);

				// Guias fijacion correa
				translate([3, 0, (s1z-2)]) rotate([0, -45, 0]) cube([L1, y, L1]);
				translate([3, 0, -2]) rotate([0, -45, 0]) cube([L1, y, L1]);
			}			
			translate([3, 0, 1]) cube([5, ((y/2) + 3), (s1z - 2)]);
			translate([-1, ((y/2)-1), (s1z/2)]) rotate([0, 90, 0]) cylinder(h = 7, r = r2, $fn=60);
			translate([1, ((y/2)-1), (s1z/2)]) rotate([0, 90, 0]) cylinder(h = hTM3, r = rTM3, $fn=6);

			translate([-1, ((y/2)+6), (s1z/2)]) rotate([0, 90, 0]) cylinder(h = 7, r = r2, $fn=60);	
				
		}
}

module fijacion2()
{
	difference() {
		cube([2, ((y/2) + 3), (s1z - 2)]);
		translate([-1, ((y/2)-1), ((s1z - 2)/2)]) rotate([0, 90, 0]) cylinder(h = 4, r = r2, $fn=60);
	}
}

fija_correa_block_corexy();

