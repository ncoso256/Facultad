program Registros;
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
		writeln('Ingrese el nombre del alumno'); read(alu.nombre);
		writeln('Ingrese el promedio del alumno'); read(alu.promedio);
	end;
end;
{declaracion de variables del programa ppal}
var
	a: alumno;
	cantalu: integer;
	prommax: real;
	nommax: str20;
{cuerpo del programa ppal}
begin
	cantalu:= 0;
	prommax:= -1;
	nommax:= '';
	leer(a);
	while (a.codigo <> 0) do begin
		cantalu:= cantalu + 1;
		if (a.promedio > prommax) then begin
			prommax:= a.promedio;
			nommax:= a.nombre;
		end;
		leer(a);
	end;
	writeln('La cantidad de alumnos leidos es de: ', cantalu);
	writeln('El nombre del alumno con mayor promedio es: ', nommax);
end.