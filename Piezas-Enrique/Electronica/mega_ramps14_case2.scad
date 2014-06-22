
d1 = 3.6;	// grosor caja
d2 = 4;	// distancia entre paredes caja y electronica
h1 = 27;	// altura caja
h2 = 7;		// altura sujeciones
r1 = 2.3;	// radio agujero sujeciones
r2 = 1.6;	// grosor sujeciones

x = 101.6;	// largo electronica
y = 60;		// ancho electronica

module caja_mega_ramps14() {
	difference() {
		mega_ramps14_body();
		translate([d1+d2, d1+d2, d1]) {
			fan();
		}
	}
}

module mega_ramps14_body() {
	difference() {
		union() {
			cube(size=[x + 2*d1+2*d2, y + 2*d1 + 2*d2, h1+d1], center=false);
			translate([20, 0, (h1 - 8)])  rotate([45, 0, 0]) {
				cube(size=[16, 16, 16], center=false);
			}
			translate([(x - 20), 0, (h1 - 8)])  rotate([45, 0, 0]) {
				cube(size=[16, 16, 16], center=false);
			}
			translate([20, (y + 15), (h1 - 8)])  rotate([45, 0, 0]) {
				cube(size=[16, 16, 16], center=false);
			}
			translate([(x - 20), (y + 15), (h1 - 8)])  rotate([45, 0, 0]) {
				cube(size=[16, 16, 16], center=false);
			}
			
			translate([20, -10, 0]) {
				cube(size=[16, 10, d1], center=false);
			}
			translate([(x - 20), -10, 0]) {
				cube(size=[16, 10, d1], center=false);
			}
			translate([20, (y + 15), 0]) {
				cube(size=[16, 10, d1], center=false);
			}
			translate([(x - 20), (y + 15), 0]) {
				cube(size=[16, 10, d1], center=false);
			}
		}
		translate([d1, d1, d1]) {
			cube(size=[x + 2*d2, y+2*d2, h1+1], center=false);
		}
		translate([0, -12, h1+d1]) {
			cube(size=[x + 2*d1+2*d2, y + 2*d1 + 2*d2 + 24, h1], center=false);
		}
		
		translate([28, -4, 0]) {
			cylinder(r=r1, h=(h1+d1+1), $fn=60, center=false);
		}
		translate([(x - 12), -4, 0]) {
			cylinder(r=r1, h=(h1+d1+1), $fn=60, center=false);
		}
		translate([28, (y + 2*d1 + 2*d2 + 4), 0]) {
			cylinder(r=r1, h=(h1+d1+1), $fn=60, center=false);
		}
		translate([(x - 12), (y + 2*d1 + 2*d2 + 4), 0]) {
			cylinder(r=r1, h=(h1+d1+1), $fn=60, center=false);
		}
		
		translate([28, -4, d1]) {
			cylinder(r=3.5, h=(h1-d1), $fn=60, center=false);
		}
		translate([(x - 12), -4, d1]) {
			cylinder(r=3.5, h=(h1-d1), $fn=60, center=false);
		}
		translate([28, (y + 2*d1 + 2*d2 + 4), d1]) {
			cylinder(r=3.5, h=(h1-d1), $fn=60, center=false);
		}
		translate([(x - 12), (y + 2*d1 + 2*d2 + 4), d1]) {
			cylinder(r=3.5, h=(h1-d1), $fn=60, center=false);
		}
		
		
		// Hueco cables
		translate([d1/2, (y/2)+d1+d2, h1/2+d1+h2]) {
			cube(size=[d1+1, 15, h1], center=true);
		}

	}	
}

module fan() {
	translate([(x/2), (y/2), 0]) {
		cylinder(r=20, h=h1, $fn=60, center=true);
	}
	translate([((x/2) - 19), ((y/2) - 19), 0]) {
		cylinder(r=r1, h=h1, $fn=60, center=true);
	}
	translate([((x/2) + 19), ((y/2) - 19), 0]) {
		cylinder(r=r1, h=h1, $fn=60, center=true);
	}
	translate([((x/2) - 19), ((y/2) + 19), 0]) {
		cylinder(r=r1, h=h1, $fn=60, center=true);
	}
	translate([((x/2) + 19), ((y/2) + 19), 0]) {
		cylinder(r=r1, h=h1, $fn=60, center=true);
	}
	
	translate([((x/2) - 30), (y/2), -1]) {
		cube(size=[4, 38, (d1+2)], center=true);
	}

	translate([((x/2) - 38), (y/2), -1]) {
		cube(size=[4, 38, (d1+2)], center=true);
	}
	
	translate([((x/2) - 46), (y/2), -1]) {
		cube(size=[4, 38, (d1+2)], center=true);
	}
	
	translate([((x/2) + 30), (y/2), -1]) {
		cube(size=[4, 38, (d1+2)], center=true);
	}

	translate([((x/2) + 38), (y/2), -1]) {
		cube(size=[4, 38, (d1+2)], center=true);
	}
	
	translate([((x/2) + 46), (y/2), -1]) {
		cube(size=[4, 38, (d1+2)], center=true);
	}
	
}

caja_mega_ramps14();
