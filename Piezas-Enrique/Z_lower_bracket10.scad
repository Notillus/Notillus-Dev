
module z_lower_bracket_tantillus()
{
	difference() {
		union() {
			difference() {
				cube([42, 95, 10], center = true);
				cylinder(h = 10, r = 11.2, $fn=60, center = true);
				translate([15.5, 15.5, 0])
					cylinder(h = 10, r = 2.3, $fn=60, center = true);
				translate([15.5, -15.5, 0])
					cylinder(h = 10, r = 2.3, $fn=60, center = true);
				translate([-15.5, 15.5, 0])
					cylinder(h = 10, r = 2.3, $fn=60, center = true);
				translate([-15.5, -15.5, 0])
					cylinder(h = 10, r = 2.3, $fn=60, center = true);

				translate([36, 36, 0])
					rotate(45, 0)
						cube([42, 46, 10], center = true);
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
				translate([36, -36, 0])
					rotate(-45, 0)
						cube([42, 46, 10], center = true);
				translate([5, -48, -5])
					cube([20, 11, 10], center = false);
			}
			translate([0, 35, 0])
				cylinder(h = 10, r = 7, $fn=60, center = true);
			translate([0, -35, 0])
				cylinder(h = 10, r = 7, $fn=60, center = true);


		}
		translate([0, 35, 0])
			cylinder(h = 10, r = 4.2, $fn=60, center = true);
		translate([0, -35, 0])
			cylinder(h = 10, r = 4.2, $fn=60, center = true);

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

