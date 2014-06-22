
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
		union() {
			mega_ramps14_body();
			translate([d1+d2, d1+d2, d1]) {
				separadores();
			}
		}
		translate([d1+d2, d1+d2, -1]) {
			hueco_separadores();
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
	
		//translate([d1/2, 14.28+d1+d2, h1/2+d1+h2]) {
		//	cube(size=[d1+1, 8.89+2*d2, h1], center=true);
		//}
		translate([d1/2, 14.28+d1+d2, h1/2+d1+h2]) {
			cube(size=[d1+1, 18+2*d2, h1], center=true);
		}
		translate([d1/2, 44.76+d1+d2, h1/2+d1+h2]) {
			cube(size=[d1+1, 11.43+2*d2, h1], center=true);
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
	}	
}

module separadores() {
	translate([13.97, 9.2, 0]) {
		cylinder(r=r1+r2, h=h2, $fn=60, center=false);	
	}
	translate([15.24, 57.4, 0]) {
		cylinder(r=r1+r2, h=h2, $fn=60, center=false);	
	}
	translate([66.04, 14.28, 0]) {
		cylinder(r=r1+r2, h=h2, $fn=60, center=false);
	}
	translate([66.04, 42.22, 0]) {
		cylinder(r=r1+r2, h=h2, $fn=60, center=false);	
	}	
	translate([90.17, 57.46, 0]) {
		cylinder(r=r1+r2, h=h2, $fn=60, center=false);
	}
	translate([96.52, 9.2, 0]) {
		cylinder(r=r1+r2, h=h2, $fn=60, center=false);
	}	
}

module hueco_separadores() {
	translate([13.97, 9.2, 0]) {
		cylinder(r=r1, h=h2+d1+2, $fn=60, center=false);	
	}
	translate([15.24, 57.4, 0]) {
		cylinder(r=r1, h=h2+d1+2, $fn=60, center=false);	
	}
	translate([66.04, 14.28, 0]) {
		cylinder(r=r1, h=h2+d1+2, $fn=60, center=false);
	}
	translate([66.04, 42.22, 0]) {
		cylinder(r=r1, h=h2+d1+2, $fn=60, center=false);	
	}	
	translate([90.17, 57.46, 0]) {
		cylinder(r=r1, h=h2+d1+2, $fn=60, center=false);
	}
	translate([96.52, 9.2, 0]) {
		cylinder(r=r1, h=h2+d1+2, $fn=60, center=false);
	}	
}

caja_mega_ramps14();
