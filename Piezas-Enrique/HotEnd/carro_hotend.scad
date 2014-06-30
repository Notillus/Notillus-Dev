
x = 24;		// Height body
y = 30;		// Height body
z = 48;		// Height body
s1x = 5;	// Height body
s1z = 9;	// Height body

s2z = 12;

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

module carro_hotend()
{
		union() {
			difference() {
				//Cuerpo principal
				cube([x, y, z]);
			
				//Huecos Rodamientos lineales
				translate([(x/2), (y + 1), ((z/2) + s2z)]) rotate(([90, 0, 0])) cylinder(h = (y + 2), r = r5, $fn=60);
				translate([(x/2), (y + 1), ((z/2) - s2z)]) rotate(([90, 0, 0])) cylinder(h = (y + 2), r = r5, $fn=60);

				// Tornillos M4 fijacion bloques hotend
				translate([(x/2), ((y/2) + 5.8), -1]) cylinder(h = ((z/2) - s2z), r = rM4, $fn=60);
				translate([(x/2), ((y/2) - 5.8), -1]) cylinder(h = ((z/2) - s2z), r = rM4, $fn=60);
				translate([(x/2), ((y/2) + 5.8), ((z/2) + s2z)]) cylinder(h = ((z/2) - s2z), r = rM4, $fn=60);
				translate([(x/2), ((y/2) - 5.8), ((z/2) + s2z)]) cylinder(h = ((z/2) - s2z), r = rM4, $fn=60);
				//Hueco tuercas M4
				translate([(x/2), ((y/2)-5.8), (z-hTM4)]) rotate([0, 0, 30]) cylinder(h = hTM4, r = rTM4, $fn=6);
				translate([(x/2), ((y/2)+5.8), (z-hTM4)]) rotate([0, 0, 30]) cylinder(h = hTM4, r = rTM4, $fn=6);
				translate([(x/2), ((y/2)-5.8), 0]) rotate([0, 0, 30]) cylinder(h = h6, r = r6, $fn=6);
				translate([(x/2), ((y/2)+5.8), 0]) rotate([0, 0, 30]) cylinder(h = h6, r = r6, $fn=6);

				// Guias fijacion bloques hotend
				translate([3, -1, -2]) rotate([0, -45, 0]) cube([L1, (y + 2), L1]);
				translate([(x-5.2), -1, 0]) rotate([0, 45, 0]) cube([L1, (y + 2), L1]);
				translate([3, -1, z - 2]) rotate([0, -45, 0]) cube([L1, (y + 2), L1]);
				translate([(x-5.2), -1, z]) rotate([0, 45, 0]) cube([L1, (y + 2), L1]);

				//Hueco piezas sujecion correa
				translate([(0), -1, ((z/2) - (s1z/2))]) cube([5.5, (y + 2), s1z]);
				translate([(x-5.5), -1, ((z/2) - (s1z/2))]) cube([5.5, (y + 2), s1z]);

				// Guias fijacion correa
				translate([3, -1, ((z/2)+(s1z/2)-2)]) rotate([0, -45, 0]) cube([L1, (y + 2), L1]);
				translate([3, -1, ((z/2)-(s1z/2)-2)]) rotate([0, -45, 0]) cube([L1, (y + 2), L1]);
				translate([(x-5.2), -1, ((z/2)+(s1z/2))]) rotate([0, 45, 0]) cube([L1, (y + 2), L1]);
				translate([(x-5.2), -1, ((z/2)-(s1z/2))]) rotate([0, 45, 0]) cube([L1, (y + 2), L1]);

				translate([0, ((y/2)-2), (z/2)]) rotate([0, 90, 0]) cylinder(h = (x +2), r = r2, $fn=60);
				translate([0, ((y/2)-6), (z/2)]) rotate([0, 90, 0]) cylinder(h = (x +2), r = r2, $fn=60);
				translate([0, ((y/2)-6), ((z/2) - r2)]) rotate([0, 0, 0]) cube([(x+2), 4, (r2*2)]);

				translate([0, ((y/2)+4), (z/2)]) rotate([0, 90, 0]) cylinder(h = (x + 2), r = r2, $fn=60);	

				
			}
			//translate([((x/2) - 15.5), (y + 8), ((z/2) - (s1z/2))]) fijador_correa();
			//translate([((x/2) - 15.5), -16, ((z/2) - (s1z/2))]) fijador_correa();

				//translate([0, ((y/2)-7), (z/2)]) rotate([0, 0, 0]) cube([(x+2), 4, (r2*2)]);
		
		}
}

module fijador_correa()
{
	difference() {
		cube([31, 8, s1z]);
		translate([15.5, 9, 4]) rotate([90, 0, 0]) cylinder(h = 10, r = 2, $fn=60);
	}
}


carro_hotend();

