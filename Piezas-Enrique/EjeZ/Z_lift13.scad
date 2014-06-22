
h1 = 24;	// Height body
h3 = h1+2;	// Height cylinders
r1 = 4.15;	// Radio varilla lisa
r2 = 2.3;	// Radio tornillo M3
r3 = 11.2;	// Radio centro motor
r4 = 3;		// Radio tornillo M5
r5 = 7.65;	// Radio rodamiento lineal
r6 = 4.62;	// Radio tuerca M5
r7 = 2.9;	// Radio poleas
r8 = 3.7;	// Radio cabeza tornillo M3
L1 = 15;	// Longitud varilla lisa 8mm

module Z_lift_tantillus()
{
	union() {
		difference() {
			union() {
				translate([0, 0, 10])
					cube([20.5, 75.5, h1], center = true);
				translate([0, 35, 10])
					cylinder(h = h1, r = 10.5, center = true);
				translate([0, -35, 10])
					cylinder(h = h1, r = 10.5, center = true);

				translate([0, 47, 10])	cube([11, 9, h1], center = true);
				translate([0, -47, 10])	cube([11, 9, h1], center = true);

				//Barras sustentacion cama
				translate([55, 20, 3]) cube([100, 20, 10], center = true);
				translate([55, -20, 3]) cube([100, 20, 10], center = true);
				
				translate([95, 0, 3]) cube([20, 20, 10], center = true);

				translate([13, 20, 10]) rotate([0,45,0]) cube([20, 20, 10], center = true);
				translate([13, -20, 10]) rotate([0,45,0]) cube([20, 20, 10], center = true);

			}
			//Hueco tuerca M5
			translate([0, 0, -2])
				rotate([0, 0, 30])
					cylinder(h = h1, r = r6, $fn=6);

			translate([0, 35, 10])
				cylinder(h = h1, r = r5, center = true);
			translate([0, -35, 10])
				cylinder(h = h1, r = r5, center = true);
			translate([0, 48, 10])
				cube([5, 13, h1], center = true);
			translate([0, -48, 10])
				cube([5, 13, h1], center = true);
			
			//Huecos tornillos horizontales exteriores
			translate([0, 47, 5])
				rotate([0, 90, 0])
					cylinder(h = 16, r = 2, $fn=60, center = true);
			translate([0, -47, 5])
				rotate([0, 90, 0])
					cylinder(h = 16, r = 2, $fn=60, center = true);
			translate([0, 47, 15])
				rotate([0, 90, 0])
					cylinder(h = 16, r = 2, $fn=60, center = true);
			translate([0, -47, 15])
				rotate([0, 90, 0])
					cylinder(h = 16, r = 2, $fn=60, center = true);

			//huecos tornillos cama
			translate([40, 20, -3]) cylinder(h = 12, r = r4, $fn=60);
			translate([90, 20, -3]) cylinder(h = 12, r = r4, $fn=60);
			translate([40, -20, -3]) cylinder(h = 12, r = r4, $fn=60);
			translate([90, -20, -3]) cylinder(h = 12, r = r4, $fn=60);

		}
		translate([5, 0, 10]) cube([4, 8, 16], center = true);
		translate([-5, 0, 10]) cube([4, 8, 16], center = true);

	}
}

Z_lift_tantillus();


