/**
El volumen interno de los chasis(descontando los salientes de las pestañas de encaje) es de 25x25cm, con 30cm de altura.

Las carcasas de metracrilato se suelen hacer con metracrilato de 6mm de grosor,
*/




difference() {  

union(){
//Frente
cube([250,6,300],center=true);

//Pestañas de encaje
for (i=[0:2]) {  
	translate([125,0,-125+i*100])  
		cube([20,6,50],center=true);
	
	translate([-125,0,-125+i*100])  
		cube([20,6,50],center=true);
}

}
//Display

rotate([90,0,0])  
	translate([40,-120,-10])
		cylinder(r=4, h=20, $fn=100); 

translate([0,0,-120])
	cube([50,60,20],center=true);

translate([40,0,-130])
	cube([5,10,5],center=true);


//Ventana
translate([0,0,50])
	cube([150,60,150],center=true);
}

