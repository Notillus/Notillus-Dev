
h1 = 10;	// Height body
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

module z_lower_bracket_tantillus()
{
	difference() {
		union() {
			difference() {
				cube([42, 95, 10], center = true);
				cylinder(h = 10, r = r3, $fn=60, center = true);
				translate([15.5, 15.5, 0])
					cylinder(h = 10, r = r2, $fn=60, center = true);
				translate([15.5, -15.5, 0])
					cylinder(h = 10, r = r2, $fn=60, center = true);
				translate([-15.5, 15.5, 0])
					cylinder(h = 10, r = r2, $fn=60, center = true);
				translate([-15.5, -15.5, 0])
					cylinder(h = 10, r = r2, $fn=60, center = true);

				translate([5, 37, -5])
					cube([20, 11, 10], center = false);
				translate([-36, -36, 0])
					rotate(45, 0)
						cube([42, 46, 10], center = true);
				translate([-25, -48, -5])
					cube([20, 11, 10], center = false);
				translate([-36, 36, 0])
					rotate(-45, 0)
						cube([42, 46, 10], center = true);
				translate([-25, 37, -5])
					cube([20, 11, 10], center = false);
				translate([5, -48, -5])
					cube([20, 11, 10], center = false);
			}
			translate([0, 35, 0])
				cylinder(h = 10, r = 7, $fn=60, center = true);
			translate([0, -35, 0])
				cylinder(h = 10, r = 7, $fn=60, center = true);


			translate([18, 29, 15])
				difference() {
					cube([6, 16, 40], center = true);
					translate([-4, 0, 14])
						rotate([0, 90, 0])
							cylinder(h = 8, r = 3, $fn=60);
				}
			translate([18, -29, 15])
				difference() {
					cube([6, 16, 40], center = true);
					translate([-4, 0, 14])
						rotate([0, 90, 0])
							cylinder(h = 8, r = 3, $fn=60);
				}
			translate([10, 24, 15])
				cube([20, 6, 20], center = true);
			translate([10, -24, 15])
				cube([20, 6, 20], center = true);

		}
		translate([0, 35, 0])
			cylinder(h = 10, r = r1, $fn=60, center = true);
		translate([0, -35, 0])
			cylinder(h = 10, r = r1, $fn=60, center = true);

		translate([0, 43, 0])
			cube([3.5, 12, 10], center = true);
		translate([0, -43, 0])
			cube([3.5, 12, 10], center = true);

		translate([0, 44, 0])
			rotate([0, 90, 0])
				cylinder(h = 16, r = 2, $fn=60, center = true);
		translate([0, -44, 0])
			rotate([0, 90, 0])
				cylinder(h = 16, r = 2, $fn=60, center = true);


	}
}

z_lower_bracket_tantillus();



