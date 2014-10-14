// Airtripper's Bowden 3D Printer Extruder Revision 3 bsp
// by Airtripper May 2012
// Copyright © 2012 - 2013 Airtripper
// airtripper.com
// It is licensed under the Creative Commons - GNU GPL license. 
// Last edit: 05/09/2013





// What part do you want to view?

preview_part = 7; // [1:Extruder,2:Idler,3:Idler with brim,4:Strut,5:Axle,6:Tube Bracket,7:All Parts]


// *****************************************************

if (preview_part == 1) {
	translate([0,0,0]) rotate([0,0,270]) extruder_block();
}
if (preview_part == 2) {
	extruder_idler_608z();
} 
if (preview_part == 3) {
	idler_and_flange();
}
if (preview_part == 4) {
	support_strut();
} 
if (preview_part == 5) {
	axle_8mm();
}
if (preview_part == 6) {
	translate([15,-15,0]) rotate([0,0,90]) tube_bracket();
}
if (preview_part == 7) {
	translate([0,-20,0]) rotate([0,0,270]) extruder_block();
	translate([20,16,0]) rotate([0,0,90]) extruder_idler_608z(); //idler_and_flange();
	translate([22,35,0]) rotate([0,0,0]) support_strut();
	translate([-10,10,0]) rotate([0,0,0]) axle_8mm();
	translate([-36,8,0]) rotate([0,0,0]) tube_bracket();
} 
if (preview_part == 8) {
	translate([0,-10,0]) rotate([0,0,270]) extruder_block();
	translate([-0,22,0]) rotate([0,0,0]) axle_8mm();
}
if (preview_part == 9) {
	translate([0,-8,0]) rotate([0,0,90]) extruder_idler_608z(); //idler_and_flange();
	translate([0,10,0]) rotate([0,0,0]) support_strut();
} 



// ************** Idler with Flange ***********************

module idler_and_flange() {
	extruder_idler_608z();
	difference() {
		union() {
			difference() {
				translate([0,0,0.5]) color("red") cube([36,55,1], center=true);
				translate([0,0,-0.1]) scale([1.1,1.1,1.1]) extruder_idler_608z();
			}
			for(r=[1:5]) {
				translate([0,r*70/10-22,0.5]) cube([30,1,1], center=true);
				translate([r*64/10-19,0,0.5]) rotate([0,0,90]) cube([50,1,1], center=true);
			}
		}
		union() {
			translate([0,0,0.5]) color("red") cube([12,28,2], center=true);
			translate([0,0,0.5]) color("red") cube([18,10,2], center=true);
		}
	}


}



// ##########################################################

module axle_8mm() {
	cylinder(14.25,r=3.80, $fn=40);
	// Support flange while printing
//	translate([-5,-0.5,0]) cube([10,1,0.5]);
//	translate([-0.5,-5,0]) cube([1,10,0.5]);
//	difference() {
//		cylinder(0.5,r=10, $fn=40);
//		translate([0,0,-1]) cylinder(3,r=5, $fn=40);
//	}
}


// ##########################################################

//extruder_idler_608z();

module extruder_idler_608z() {
	difference() {
		union() {
			difference() {
				translate([0,0,7]) cube([22,42,14], center = true);
				// Bearing housing
				//#translate([-6,0,8]) cube([10,50,20], center = true);
				translate([0,0,1]) cube([10,24,10], center = true);
				translate([-5,0,6]) rotate([0,90,0]) cylinder(10,r=12, $fn=60);
			}
			// Axle spacer
			translate([-8,0,6]) rotate([0,90,0]) cylinder(16,r=6, $fn=40);
			translate([0,0,3]) cube([16,12,6], center = true);
		}
		union() {
			// Bearing axle cut-out
			translate([-7.75,0,6]) rotate([0,90,0]) cylinder(15.5,r=4.25, $fn=40);
			translate([0,0,2]) cube([14.2,8.5,8], center = true);
			translate([-4.5,0,0]) rotate([0,20,0]) cube([6,8.5,8], center = true);
			translate([4.5,0,0]) rotate([0,-20,0]) cube([6,8.5,8], center = true);
			translate([-3.7,0,6]) rotate([0,90,0]) cylinder(7.4,r=12, $fn=60);
			// hook
			translate([-12,-15.5,6]) rotate([0,90,0]) cylinder(24,r=2, $fn=25);
			translate([0,-18.5,11]) cube([24,10,10], center = true);
			translate([9.5,-17,1]) cube([4,16,16], center = true);
			translate([-9.5,-17,1]) cube([4,16,16], center = true);
			translate([0,-21,0]) rotate([45,0,0]) cube([24,6,10], center = true);
			translate([-11,-12,9.6]) rotate([0,135,0]) cube([4,6,6], center = true);
			translate([11,-12,9.6]) rotate([0,45,0]) cube([4,6,6], center = true);
			// Bolt slots
			translate([6,20,7]) cube([3.5,10,16], center = true);
			translate([-6,20,7]) cube([3.5,10,16], center = true);
			translate([0,24,7]) rotate([154,0,0]) cube([24,10,26], center = true);
			translate([0,26.5,25]) rotate([145,0,0]) cube([24,10,26], center = true);
			translate([0,25.5,7]) cube([22,10,16], center = true);
			//Padding
			//translate([-9,-17,7]) cube([6,10,16], center = true);
		}
	}

}


// #########################################################

// Revision 3b

module extruder_block() {
	difference() {
		union() {
			// Extruder base
			translate([0,0,1.5]) cube([42,42,3], center = true);

			// Bearing supports between screw columns and shaft bearing
			rotate([0,0,45]) translate([0,11,13]) cube([3,22,26], center = true);
			rotate([0,0,315]) translate([0,-11,13]) cube([3,22,26], center = true);
			difference() {
				translate([-3,0,22]) cylinder(8,r1=4, r2=4, $fn=50, center = true);
				rotate([0,90,0]) translate([-17,0,-10]) cylinder(8,r=4, $fn=50);
			}
			difference() {
				translate([0,0,3]) cylinder(22,r1=13.5, r2=6.3, $fn=100);	// rev. 3
				rotate([0,0,45]) translate([8,0,13]) cube([15,30,26.5], center = true);	// rev. 3
				rotate([0,0,315]) translate([8,0,13]) cube([15,30,26.5], center = true);	// rev. 3
			}
			// M3 Screw columns for stepper attachment
			translate([-15.5,15.5,0]) cylinder(26,r=4, $fn=50);	// rev. 3
			translate([-15.5,15.5,18]) cylinder(8,r1=4,r2=6, $fn=50);	// rev. 3
			translate([-15.5,-15.5,0]) cylinder(23.5,r=4, $fn=50);	// rev. 3
			translate([-15.5,-15.5,17.5]) cylinder(6,r1=4,r2=5, $fn=50);	// rev. 3
			translate([15.5,-15.5,3]) cylinder(1.5,r=3.5, $fn=50);	// rev. 3

			// fixing plate
			difference() {
				translate([-20,0,10]) cube([3,74,20], center = true);
				union() {

					// fixing plate cutout
					translate([-20,0,12]) cube([6,30,18], center = true);
					translate([-20,37,0]) rotate([45,0,0]) cube([6,16,7], center = true);
					translate([-20,-37,0]) rotate([135,0,0]) cube([6,16,7], center = true);
					translate([-20,37,20]) rotate([135,0,0]) cube([6,16,7], center = true);
					translate([-20,-37,20]) rotate([45,0,0]) cube([6,16,7], center = true);
					// M6 bolt holes
					translate([-23,30.5,10]) rotate([0,90,0]) cylinder(6, r=3.5, $fn=25);
					translate([-23,-30.5,10]) rotate([0,90,0]) cylinder(6, r=3.5, $fn=25);
				}
			} // End of fixing plate
		}
		union() {
			// Stepper shaft, gear insert and bearing cut-out
			translate([0,0,9.8]) cylinder(20,r1=13, r2=5, $fn=50, center = true);	// rev. 3
			translate([0,0,22]) cylinder(5,r=5, $fn=50, center = true);
			translate([0,0,27]) cylinder(8	,r=4, $fn=50, center = true);
			translate([0,0,25.5]) cylinder(2,r1=5, r2=4, $fn=50, center = true);
			translate([0,0,10.5]) cylinder(8	,r=7, $fn=100);	// rev. 2
			translate([0,0,18.5]) cylinder(3.5,r1=7, r2=3.5, $fn=50);	// rev. 2

			// Reduce wall and screw shaft for strut placement
			translate([-15.5,-15.5,23.5]) cylinder(5,r=3, $fn=30);
			translate([-12.5,-15.5,25.5]) cube([12,9,4], center = true);
			translate([-11.4,-11.4,27.9]) rotate([25,0,315]) cube([5,10,5], center = true);

			// M3 screw holes
			for(r=[1:4]) {
				rotate([0,0,r*360/4]) translate([15.5,15.5,-1]) cylinder(40,r=1.75, $fs=.1);
			}
			translate([-15.5,15.5,22.1]) cylinder(4,r=3.3, $fn=30);	// rev. 3
			translate([15.5,15.5,1.5]) cylinder(4,r=3.25, $fs=.1);	// rev. 3
		}
	}
	// Filament in-feed bracket
	difference() {
		union() {
			translate([8.75,-20,3]) rotate([0,0,90]) infeed_block();	// rev. 3
			translate([-12,-17,3]) rotate([0,0,-12]) cube([14,2,16]);	// rev. 3
		}
		//%translate([4.8,-8,15]) rotate([90,0,0]) cylinder(18, r=1.3, $fn=25);	// rev. 2, 3
		//%translate([4.8,-21,15]) rotate([90,0,0]) cylinder(8, r1=1.1, r2=4, $fn=25);	// rev. 3
		//#translate([0,0,10]) cylinder(20,r1=13, r2=5, $fn=50, center = true);
		// #translate([5,-10,13]) cube([10,6,20], center = true);	// rev. 2, 3
	}
	// Bowdon out-feed tube holder
	difference() {
		union() {
			translate([4.8,14,13]) cube([8,14,26], center = true);
			//translate([4.8,25,10]) cube([14,8,20], center = true);	// rev. 3, 3b
			translate([-5.5,12.5,13]) cube([13.5,3,26], center = true);	// rev. 3
			// translate([0,12.5,13]) cube([2,3,26], center = true);	// rev. 3
			// translate([-4.5,12.5,4]) cube([13.5,3,3], center = true);	// rev. 3
			// #translate([0,17,17]) cube([2,6,20], center = true);	// rev. 3
			translate([3.3,21,13]) cube([11,3,26], center = true);	// rev. 3
			translate([11.8,17.5,0]) rotate([0,0,90]) bsp_push_fit();
		}
		union() {
			// Tube and filament holes
			//#translate([4.8,36,15]) rotate([90,0,0]) cylinder(16, r=2.25, $fn=25);	// 3b
			translate([4.8,24,15]) rotate([90,0,0]) cylinder(20, r=1.15, $fn=25);	// rev. 2, 3
			translate([5.3,16,15]) rotate([90,0,5]) cylinder(10, r1=0.4, r2=3, $fn=25);	// rev. 3

			// Insert and idler clearance
			translate([0,0,9.9]) cylinder(20,r1=13, r2=5, $fn=50, center = true);	// rev. 3

			// M3 bolt holes for idler preloader
			translate([3,17,20.5]) rotate([0,90,12]) cylinder(10, r=2.75, $fn=25);	// rev. 3
			translate([3,17,9.5]) rotate([0,90,12]) cylinder(10, r=2.75, $fn=25);	// rev. 3
			translate([-0.5,17,20.5]) rotate([0,90,0]) cylinder(10, r=2, $fn=25);
			translate([-0.5,17,9.5]) rotate([0,90,0]) cylinder(10, r=2, $fn=25);

			// m4 nut slot
			//#translate([4.8,24.5,16]) cube([7.45,3.45,10.5], center = true);	// rev. 3, 3b
			//#translate([4.8,27.5,19.5]) cube([4.5,3.2,9.2], center = true);	// rev.	3, 3b

			// just a hole
			//translate([4.8,42,6]) rotate([90,0,0]) cylinder(16, r=4.5, $fn=25);	// rev. 3, 3.5b
			translate([-3.5,15.5,9.5]) rotate([90,0,0]) cylinder(6, r=3.5, $fn=25);	// rev. 3
			translate([-3.5,15.5,20.5]) rotate([90,0,0]) cylinder(6, r=3.5, $fn=25);	// rev. 3

			// Bowden filament guide in-feed Cut off
			translate([11,7.5,14]) rotate([0,0,35]) cube([8,4,28], center = true);	// rev. 3
			translate([4.5,8.5,25]) cube([10,4,10], center = true);	// rev. 3
		}
	}
	
}

// #########################################################


//bsp_push_fit();


module bsp_push_fit() {
	bsp = 10;
	x_nuj = 0;
	
	difference() {
		union() {
			//translate([0,3,0]) cube([3,11,26]);
			difference() {
				translate([3+x_nuj,7,15]) rotate([0,90,0]) cylinder(12, r=(bsp/2)+5, $fn=100);
				translate([11+x_nuj-3,7,19.5]) rotate([0,90,0]) cylinder(15+3, r=1.5, $fn=50);
				translate([-5+x_nuj,20,3]) rotate([0,0,-45]) cube([10,10,26]);
			}
			difference() {
				translate([3+x_nuj,0,0]) cube([12,14,15]);
				translate([2+x_nuj,-1,-7]) rotate([0,50,0]) cube([10,16,26]);
			}
		}
		translate([8+x_nuj,7,15]) rotate([0,90,0]) cylinder(8, r=(bsp/2), $fn=100);
		translate([-1,7,15]) rotate([0,90,0]) cylinder(19, r=1.15, $fn=30);
		translate([11.2+x_nuj,7,-1]) rotate([0,0,0]) cylinder(15, r=1.75, $fn=50);	// M3 Screw hole
		translate([11.2+x_nuj,7,7]) rotate([0,0,30]) cylinder(5, r=3.5, $fn=6);	// M3 Screw hex nut hole
		translate([11.2+x_nuj,5.3,-1]) cube([6,3.4,15]);
		translate([11.2+x_nuj,7,-1]) rotate([0,0,0]) cylinder(2, r=3.5, $fn=50);
		translate([11.2+x_nuj,7,0.99]) rotate([0,0,0]) cylinder(3, r1=3.5, r2=1.75, $fn=50);
		translate([-2+x_nuj,-9,3]) rotate([0,0,20]) cube([10,10,26]);
	}
}


// #########################################################

//support_strut();

module support_strut() {

	difference() {
		union() {
			translate([-15.5,0,0]) color("red") cylinder(6, r=5, $fn=30);
			translate([15.5,0,0]) color("red") cylinder(6, r=5, $fn=30);
			translate([-15.5,-3.5,0]) color("red") cube([31,7,6]);
		}
		union() {
			// Screw holes
			translate([-15.5,0,-1]) color("red") cylinder(5, r=1.75, $fn=30);
			translate([15.5,0,-1]) color("red") cylinder(5, r=1.75, $fn=30);
			translate([-15.5,0,3]) color("red") cylinder(5, r=3, $fn=30);
			translate([15.5,0,3]) color("red") cylinder(5, r=3, $fn=30);
		}
	}
}


// #########################################################



//infeed_block();

infeed_choice = 2;

module infeed_block() {

	if (infeed_choice == 1) {
		difference() {
			union() {
				 polyhedron(
				  points=[ [0,0,0],[0,8,0],[2,8,0],[2,0,0], // the six points at base
							[-5,0,8],[-5,8,8],[7,0,8],[7,8,8],
							[-5,0,16],[-5,8,16],[7,0,16],[7,8,16]
							],
							
				  triangles=[ [0,3,1],[2,1,3],
							[4,0,1],[1,5,4],[7,2,3],[7,3,6],
							[1,2,5],[2,7,5],[4,6,0],[6,3,0],
							[11,9,5],[5,7,11],[10,11,7],[7,6,10],
							[5,9,8],[8,4,5],[4,8,10],[10,6,4],[8,9,11],[11,10,8]
							]          // each triangle side
													 // two triangles for square base
				 );
			}
			translate([8,4,12]) rotate([0,-90,0]) cylinder(22, r=1.3, $fn=60);
			translate([-1,4,12]) rotate([0,-90,0]) cylinder(5, r1=1.3, r2=2.2, $fn=60);
			
		}
	}


	if (infeed_choice == 2) {
		difference() {
			union() {
				 polyhedron(
				  points=[ [-3,0,-3],[-3,8,-3],[2,8,-3],[2,0,-3], // the six points at base
							[-12,0,6],[-12,8,6],[7,0,8],[7,8,8],
							[-5,0,16],[-5,8,16],[7,0,16],[7,8,16]
							],
							
				  triangles=[ [0,3,1],[2,1,3],
							[4,0,1],[1,5,4],[7,2,3],[7,3,6],
							[1,2,5],[2,7,5],[4,6,0],[6,3,0],
							[11,9,5],[5,7,11],[10,11,7],[7,6,10],
							[5,9,8],[8,4,5],[4,8,10],[10,6,4],[8,9,11],[11,10,8]
							]          // each triangle side
													 // two triangles for square base
				 );
				translate([-2,4,12]) rotate([0,-90,0]) cylinder(10, r=5.9, $fn=100);
				translate([1,4,12]) rotate([0,-90,0]) cylinder(3, r1=4, r2=5.9, $fn=100);
			}
			translate([8,4,12]) rotate([0,-90,0]) cylinder(22, r=1.3, $fn=25);
			translate([-2.9,4,12]) rotate([0,-90,0]) cylinder(12, r=2.15, $fn=60);
			translate([0,4,12]) rotate([0,-90,0]) cylinder(3, r1=1.3, r2=2.15, $fn=60);
		}
	}

}

// #########################################################



//tube_bracket();


module tube_bracket() {
		difference() {
			union() {
				translate([0,10,0]) cube([30,10,10]);	// Pipe bracket
				difference() {
					translate([5,0,0]) cube([10,30,3]);	// Screw bracket
					difference() {
						translate([10,15,-1]) rotate([0,0,0]) cylinder(5, r=20, $fn=100);
						translate([10,15,-1]) rotate([0,0,0]) cylinder(5, r=15, $fn=100);
					}
				}
			}
			translate([-1,15,5]) rotate([0,90,0]) cylinder(32, r=1.15, $fn=60);	// filament tube hole
			translate([-0.95,15,5]) rotate([0,90,0]) cylinder(11, r=2.14, $fn=60);	// Pipe hole infeed
			translate([20,15,5]) rotate([0,90,0]) cylinder(11, r=2.11, $fn=60);	// Pipe hole outfeed
			translate([10,15,5]) rotate([0,90,0]) cylinder(5, r1=2.2, r2=1.3, $fn=60);	// Infeed hole taper
			translate([10,25,-1]) rotate([0,0,0]) cylinder(5, r=2.2, $fn=60);	// Screw holes
			translate([10,5,-1]) rotate([0,0,0]) cylinder(5, r=2.2, $fn=60);	// Screw holes
			translate([-7,4.4,9]) rotate([0,0,45]) cube([15,15,5]);	// Pipe bracket direction mark
			difference() {
				translate([10,4.4,9]) rotate([0,0,0]) cube([25,25,7]);	// Pipe bracket direction mark
				translate([19.4,4.4,9]) rotate([0,0,45]) cube([15,15,5]);	// Pipe bracket direction mark
				translate([0,4.4,9]) rotate([0,0,0]) cube([25,25,7]);	// Pipe bracket direction mark
			}
		}
}


