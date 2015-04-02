//Variables de parametrización
h = 300; //alto
w = 250; //ancho
t = 6;	//Grosor


union(){

	cube([w,t,h],center=true);//Frente
	anclaje();//Pestañas de anclaje

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