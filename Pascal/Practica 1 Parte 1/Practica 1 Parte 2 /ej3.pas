//3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en
//TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
//La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura
//informar:
//● La cantidad de alumnos aprobados (nota 8 o mayor).
//● La cantidad de alumnos que obtuvieron un 7 como nota
program ejercicio3;
type
	nota = 1..10;
var
	nombre: string;
	alumno7,alumno8: integer;
	notas: nota;
begin
	alumno7:= 0;
	alumno8:= 0;  
	repeat
		writeln('Escriba un nombre de un alumno: '); readln(nombre);
		writeln('Escriba una nota obtenida en el modulo EPA: '); readln(notas);
		if (notas >= 8) then
			alumno8 := alumno8 + 1
		else
		if (notas = 7) then
			alumno7:= alumno7 + 1;
	until (nombre = 'Zidane Zinedine');
	writeln('La cantidad de alumnos aprobados con 8 o mas son : ', alumno8);
	writeln('La cantidad de alumnos que obtuvieron un 7 como nota son: ', alumno7);
end.
