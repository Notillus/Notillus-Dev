
h1 = 20;		// Height body
h2 = 5;		// Height base
h3 = h1+2;	// Height cylinders
r1 = 4.15;		// Radio varilla lisa
r2 = 2.3;		// Radio tornillo M3
r3 = 11.2;	// Radio centro motor
r4 = 3;		// Radio tornillo M5
r5 = 7.6;		// Radio rodamiento lineal
r6 = 4.62;	// Radio tuerca M5
r7 = 2.3;		// Radio poleas
r8 = 3.7;		// Radio cabeza tornillo M3
L1 = 15;		// Longitud varilla lisa 8mm

module idler_hbot()
{
		union() {
			difference() {
				//Cuerpo principal
				cube([55, 30, h1]);
				
				//Hueco Perfil vertical
				translate([0, 10, 0]) cube([20, 20, h1]);
				
				//Hueco varilla lisa
				translate([10, L1, 10]) rotate(([90, 0, 0])) cylinder(h = (L1 + 1), r = r1, $fn=60);
				
				translate([22, 0, h2]) cube([14, 6, h1]);
				
				
				// Tornillos acople perfiles
				//translate([10, 30, -1])	cylinder(h = h3, r = r4, $fn=60);
				translate([10, 20, -1])	cylinder(h = h3, r = r4, $fn=60);
				
				translate([30, 20, -1])	cylinder(h = h3, r = r4, $fn=60);
				translate([48, 20, -1])	cylinder(h = h3, r = r4, $fn=60);
				translate([48, 5, -1])	cylinder(h = h3, r = r2, $fn=60);

				// Hueco tornillo polea
				translate([29, 6, -1]) cylinder(h = h3, r = r7, $fn=60);
				translate([29, 6, h2]) cylinder(h = h1, r = 7, $fn=60);

				translate([16, 5, -1]) cylinder(h = h3, r = r2, $fn=60);
				translate([16, 5, 0]) cylinder(h = 2, r = r8, $fn=60);
				translate([16, 5, (h1 - 2)]) cylinder(h = 2, r = r8, $fn=60);
			}
			//translate([20, 25, h2]) cube([10, 5,(h1-h2)]);

		}
}


idler_hbot();

