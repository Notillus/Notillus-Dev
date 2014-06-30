
h1 = 10;	// Height body
h3 = h1+2;	// Height cylinders
r1 = 4.15;	// Radio varilla lisa
r2 = 2.3;	// Radio tornillo M3
r3 = 11.2;	// Radio centro motor
r4 = 3;		// Radio tornillo M5
r5 = 7.65;	// Radio rodamiento lineal
r6 = 4.65;	// Radio tuerca M5
r7 = 2.9;	// Radio poleas
r8 = 3.7;	// Radio cabeza tornillo M3
L1 = 15;	// Longitud varilla lisa 8mm

module z_upper_bracket_tantillus()
{
	union() {
		difference() {
			translate([6, 0, 0])
				cube([30, 84, 14], center = true);
			translate([0, 0, 4])
				cylinder(h = 10, r = r4, $fn=60, center = true);
			translate([0, 35, 4])
				cylinder(h = 10, r = r1, $fn=60, center = true);
			translate([0, -35, 4])
				cylinder(h = 10, r = r1, $fn=60, center = true);
		}
		translate([18, 0, 8])
			difference() {
				cube([6, 84, 30], center = true);
				translate([-4, 12, 7])
					rotate([0, 90, 0])
						cylinder(h = 10, r = r4, $fn=60);
				translate([-4, -12, 7])
					rotate([0, 90, 0])
						cylinder(h = 10, r = r4, $fn=60);
				translate([-4, 25, 7])
					rotate([0, 90, 0])
						cylinder(h = 10, r = r4, $fn=60);
				translate([-4, -25, 7])
					rotate([0, 90, 0])
						cylinder(h = 10, r = r4, $fn=60);
			}
	}
}

z_upper_bracket_tantillus();

