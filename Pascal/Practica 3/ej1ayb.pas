program registros; // ejercicio 1a y 1b
type
	str20 = string[20];
	alumno = record
		codigo: integer;
		nombre: str20;
		promedio: real;
	end;
procedure leer(var alu: alumno);
begin
	writeln('Ingrese el codigo del alumno');
	readln(alu.codigo);
	if (alu.codigo <> 0) then begin
		writeln('Ingrese el nombre del alumno '); readln(alu.nombre);
		writeln('Ingrese el promedio del alumno '); readln(alu.promedio);
	end;
end;
{declaracion de variables del programa ppal}
var
	a: alumno;
	cant: integer;
	maxnombre: string;
	maxprom: real;
{cuerpo del programa ppal}
begin
	leer(a); 
	cant:= 0;
	maxprom:= -1;
	if (a.promedio > maxprom) then begin
		maxprom:= a.promedio;
		maxnombre:= a.nombre;
	end;
	while (a.codigo <> 0) do begin 
		leer(a);
		cant:= cant + 1;
		if (a.promedio > maxprom) then begin
			maxprom:= a.promedio;
			maxnombre:= a.nombre;
		end;
	end;
	writeln('la cantidad de alumnos leidos es de: ' ,cant);
	writeln('el mejor promedio es: ', maxnombre);
end.
