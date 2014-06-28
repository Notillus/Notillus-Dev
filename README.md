Notillus
========

Este repositorio intenta recopilar los trabajos de MakeSpace alrededor de la Tantillus.

Contenido de las carpetas:

*Kit-TantillusMks-TSLOT:
Coleccion de STL's para montar la tantillus. dentroo habra una lista detallando cuantas unidades de cada pieza hacen falta.

*Notillus-coreXY:
Archivos de desarrollo de la Version coreXY para las carcasas TSLOT y cortadas por laser/mecanizadas.

*Tantillus-Original:
Los archivos del repo de tantillus, contiene los ficheros para la carcasa de metracrilato y para la carcasa impresa. Casi todas mas piezas son de metrica inglesa y las tuercas bailan en los rebajes.

*Tantillus-TSLOT:
Los archivos del repo TSLOT. Esta version no tiene pieza para el 'Z' de varilla, solo cable.



Usando git:

Instrucciones para linux:

-Instalar:

	sudo apt-get install git

-Configurar

	git config --global user.name "TuNombre"

	git config --global user.email "tu@email.com"

-Primer clonado del repo:

	cd carpeta/donde/quieres/descargar

	git clone https://github.com/darkjavi/Notillus.git

-Actualizando el repo:

	cd carpeta/del/repo

	git pull

-Despues de haber modificado cosas en los ficheros:

	cd carpeta/del/repo

	git add .       (añade todos los archivos nuevos)

	git commit -a	(se abrira una ventana en la que obligatoriamente hay que escribir algo sobre los cambios hechos)

	git push origin (manda los cambios de vuelta a github, pedira nombre de usuario/pass)
