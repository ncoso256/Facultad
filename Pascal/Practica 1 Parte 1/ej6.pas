// 6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
// lectura finaliza cuando se ingresa el legajo-1, que no debe procesarse.
// Por ejemplo, se lee la siguiente secuencia:
// 33423
// 8.40
// 19003
// 6.43-1
// En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
// 19003, cuyo promedio fue 6.43, y finalmente el legajo-1 (para el cual no es necesario leer un
// promedio).
// Al finalizar la lectura, informar:
// a. Lacantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
// b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
// 1).
// c.
// El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
// menor al valor 2500 (en el ejemplo anterior se debería informar 0%)

program holamundi;
var
	legajo, cantalum , cantaluprom, cantaludes : integer;
	promedio, porcentaje: real;
begin
	cantalum:= 0;
	cantaluprom:= 0;
	cantaludes:= 0;
	writeln('Escriba su numero de legajo: '); readln(legajo);
	while (legajo <> -1) do
	begin
		cantalum:= cantalum + 1;
		writeln('Escriba su promedio: ');
		readln(promedio);
		writeln('su legajo: ',legajo);
		if (promedio > 6.5) then
			cantaluprom:= cantaluprom + 1;
		if (promedio > 8.5) and (legajo < 2500) then
			cantaludes:= cantaludes + 1;
		writeln('su promedio: ', promedio:0:2);
		writeln('Ingrese un nuevo numero de legajo: '); readln(legajo); 
	end;
	porcentaje:= cantaludes / cantalum * 100;
	writeln('la cantidad de alumnos leida es de: ' , cantalum);
	writeln('la cantidad de alumnos la cual cuyo promedio supera 6.5: ' , cantaluprom);
	writeln('el porcentaje de los alumnos destacados y cuyo legajo es menor a 2500 es de: ', porcentaje:0:2 , '%' );
end.
