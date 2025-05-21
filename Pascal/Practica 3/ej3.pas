{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As, con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año 2015 (1 docente cada 23,435 alumnos). 
Para ello, se cuenta con información de: CUE (código único de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. 
Se pide implementar un programa que procese la información y determine: 

● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos. 

El programa debe utilizar: 
a. Un módulo para la lectura de la información de la escuela. 
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad de alumnos y la cantidad de docentes).}

program tres;
type
	str20 = string[20];
	escuela = record
		cue: integer;
		nombrelugar: str20;
		cantdoc: integer;
		cantalu: integer;
		localidad: str20;
	end;
procedure leerdatos(var cole: escuela);
begin
	readln(cole.cue);
	readln(cole.nombrelugar);
	readln(cole.cantdoc);
	readln(cole.cantalu);
	readln(cole.localidad);
end;

function relacioncantaludocentes(escue: escuela): integer;
begin
	relacioncantaludocentes:= escue.cantalu div escue.cantdoc;
end;


var
	i, cantescuela, maxcue1, maxcue2: integer;
	c: escuela;
	maxnom1, maxnom2: string;
begin
	cantescuela:= 0;
	maxcue1:= -1;
	maxcue2:= -1;
	maxnom1:= '';
	maxnom2:= '';
	for i:= 1 to 2400 do begin
		leerdatos(c);
		relacioncantaludocentes(c);
		if (relacioncantaludocentes(c) > 23435) and (c.localidad = 'la plata') then
			cantescuela:= cantescuela + 1;
		
		if (relacioncantaludocentes(c) > maxcue1) then begin
			maxcue2:= maxcue1;
			maxcue1:= c.cue;
			maxnom2:= maxnom1;
			maxnom1:= c.nombrelugar;
		end
		else
			if(relacioncantaludocentes(c) > maxcue2) then begin
				maxcue2:= c.cue;
				maxnom2:= c.nombrelugar;
			end;
			
	writeln('La cantidad de escuelas de la plata con mejor relacion por la unesco es ', cantescuela);
	writeln('el primer cue y nombre de las escuelas con mejor relacion es:  ', maxcue1, ' y ', maxnom1);
	writeln('el segundo cue y nombre de las escuelas con mejor relacion es:  ', maxcue2, ' y ', maxnom2);
end.
