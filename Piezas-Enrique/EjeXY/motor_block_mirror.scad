
x=76;
y=45;

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
r8 = 3.2;		// Radio cabeza tornillo M3
L1 = 15;		// Longitud varilla lisa 8mm

module motor_block_corexy()
{
		union() {
			difference() {
				//Cuerpo principal
				cube([x, y, h1]);
				
				//Hueco Perfil vertical
				translate([0, (y - 20), 0]) cube([20, 20, h1]);
				
				//Hueco varilla lisa
				translate([10, L1, (h1 - 10)]) rotate(([90, 0, 0])) cylinder(h = (L1 + 1), r = r1, $fn=60);
				
				translate([20, 0, -h2]) cube([37, 24.5, h1]);
				
				//Motor
				translate([52, 25, 0]) rotate([0, 0, 0]) hueco_motor();
				
				// Tornillos acople perfiles
				//translate([10, 30, -1])	cylinder(h = h3, r = r4, $fn=60);
				//translate([10, 20, -1])	cylinder(h = h3, r = r4, $fn=60);
				
				translate([30, 35, -1])	cylinder(h = h3, r = r4, $fn=60);
				translate([72, 35, -1])	cylinder(h = h3, r = r4, $fn=60);

				// Huecos tornillos poleas
				translate([32, 6, -1]) cylinder(h = h3, r = r7, $fn=60);
				translate([29, 19, -1]) cylinder(h = h3, r = r7, $fn=60);

				translate([32, 6, 0])	 cylinder(h = (h1-h2), r = 7, $fn=60);
				translate([29, 19, 0]) cylinder(h = (h1-h2), r = 7, $fn=60);

				translate([28, 17.6, 0]) rotate([0, 0, 35]) cube([22, 8,(h1-h2)]);
			}
			translate([17.5, 20, 0]) rotate([0, 0, 35]) cube([10, 2.5,(h1-h2)]);
			
			//translate([32, 6, -1])	cylinder(h = h3, r = 6, $fn=60);
			//translate([29, 19, -1])	cylinder(h = h3, r = 6, $fn=60);
		}
}

module hueco_motor()
{
		translate([0, 0, -1]) cylinder(h = h3, r = r3, $fn=60);

		translate([15.5, 15.5, -1])	cylinder(h = h3, r = r2, $fn=60);
		translate([15.5, -15.5, -1]) cylinder(h = h3, r = r2, $fn=60);
		translate([-15.5, 15.5, -1]) cylinder(h = h3, r = r2, $fn=60);
		translate([-15.5, -15.5, -1]) cylinder(h = h3, r = r2, $fn=60);

		translate([15.5, 15.5, (h1-3)]) cylinder(h = 3, r = r8, $fn=60);
		translate([15.5, -15.5, (h1-3)]) cylinder(h = 3, r = r8, $fn=60);
		translate([-15.5, 15.5, (h1-3)]) cylinder(h = 3, r = r8, $fn=60);
		translate([-15.5, -15.5, (h1-3)]) cylinder(h = 3, r = r8, $fn=60);

		translate([15.5, 15.5, 0]) cylinder(h = 3, r = r8, $fn=60);
		translate([15.5, -15.5, 0]) cylinder(h = 3, r = r8, $fn=60);
		translate([-15.5, 15.5, 0]) cylinder(h = 3, r = r8, $fn=60);
		translate([-15.5, -15.5, 0]) cylinder(h = 3, r = r8, $fn=60);

		translate([0, 0, -h2]) cylinder(h = h1, r = 16, $fn=60);
}

motor_block_corexy();

