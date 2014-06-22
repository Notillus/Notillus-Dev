
h1 = 18;	// Height body
h2 = 5;		// Height base
h3 = h1+2;	// Height cylinders
r1 = 4.15;	// Radio varilla lisa
r2 = 2.3;	// Radio tornillo M3
r3 = 11.2;	// Radio centro motor
r4 = 3;		// Radio tornillo M5
r5 = 7.7;	// Radio rodamiento lineal
r6 = 4.62;	// Radio tuerca M5
r7 = 2.3;	// Radio poleas
r8 = 3.7;	// Radio cabeza tornillo M3
L1 = 15;	// Longitud varilla lisa 8mm

module xy_block_corexy()
{
		union() {
			difference() {
				//Cuerpo principal
				cube([40, 55, h1]);
				
				//Hueco rodamientos lineales varilla lisa eje y
				translate([10, 57, h1]) rotate(([90, 90, 0])) cylinder(h = 60, r = r5);
				translate([16.1, 13.7, -2]) cylinder(h = 30, r = r2, $fn=60);
				translate([3.9, 13.7, -2]) cylinder(h = 30, r = r2, $fn=60);
				translate([16.1, 41.3, -2]) cylinder(h = 30, r = r2, $fn=60);
				translate([3.9, 41.3, -2]) cylinder(h = 30, r = r2, $fn=60);
				
				//Hueco correas
				translate([20, -1, h2]) cube([6, 57, h1]);
				translate([24, (13.5 - 6), h2]) cube([16, 13, h1]);
				translate([24, (41.5 - 7), h2]) cube([16, 13, h1]);

				translate([20, 0, h2]) cube([10, 7.5, h1]);
				translate([20, 47.5, h2]) cube([10, 7.5, h1]);
				
				translate([32, 13.5, -2]) cylinder(h = 50, r = r7, $fn=60);
				translate([32, 41.5, -2]) cylinder(h = 50, r = r7, $fn=60);

				//Huecos varillas lisa eje x
				translate([30, 27.5, 6]) rotate(([0, 90, 0])) cylinder(h = 12, r = r1, $fn=60);
				translate([35, 4, -2]) cylinder(h = 20, r = r2, $fn=60);
				translate([35, 51, -2]) cylinder(h = 20, r = r2, $fn=60);
			}
			//translate([32, 13.5, -2]) 	cylinder(h = 30, r = 5, $fn=60);
			//translate([32, 41.5, -2])	cylinder(h = 30, r = 5, $fn=60);

		}
}

xy_block_corexy();

