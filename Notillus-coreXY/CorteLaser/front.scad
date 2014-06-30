/**
El volumen interno de los chasis(descontando los salientes de las pestañas de encaje) es de 25x25cm, con 30cm de altura.

Las carcasas de metracrilato se suelen hacer con metracrilato de 6mm de grosor,
*/

//Variables de parametrización
h = 300; //alto
w = 250; //ancho
t = 6;	//Grosor


difference() {  

union(){
	cube([w,t,h],center=true);//Frente
	anclaje();//Pestañas de anclaje

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

module anclaje(){
	n = (h/50)/2; 	//Calculo del numero de pestañas
	for (i=[0:n-1]) {  
		translate([w/2,0,-w/2+i*100])  
			cube([20,6,50],center=true);
	
		translate([-w/2,0,-w/2+i*100])  
			cube([20,6,50],center=true);
	}
}