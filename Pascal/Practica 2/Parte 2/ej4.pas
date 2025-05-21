{4. El siguiente programa intenta resolver un enunciado.
Sin embargo, el código posee 5 errores. 
Indicar en qué línea se encuentra cada error y en qué consiste el error. 

Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa.
De cada programador se lee el número de legajo y el salario actual. 
El programa debe imprimir el total del dinero destinado por mes al pago de salarios, y el salario del empleado mayor legajo.}

program programadores;
procedure leerdatos(var legajo: integer; salario: real);
begin
	writeln('Ingrese el nro de legajo y el salario');
	readln(legajo);
	readln(salario);
end;
procedure actualizarmaximo(nuevolegajo: integer ; nuevosalario: real; var maxlegajo: integer);
var
	maxsalario: real; {no puede ser la variable local}
begin
	if (nuevolegajo > maxlegajo) then begin {tiene que preguntar por el salario}
		maxlegajo:= nuevolegajo;
		maxsalario:= nuevosalario
	end;
end;
var
	legajo, maxlegajo, i: integer;
	salario, maxsalario: real;
begin
	sumasalarios:= 0; {error 1 sumasalarios no existe}
	for i:= 1 to 130 do begin
		leerdatos(salario, legajo); {error 2 orden de las variables segun el proceso}
		actualizarmaximo(legajo, salario, maxlegajo);
		sumasalarios:= sumasalarios + salario; {error 3y4 sumasalarios no existe}
	end;
	writeln('en todo el mes se gastan ', sumasalarios, ' pesos'); {error 5 sumasalarios no existe}
	writeln('el salario del empleado mas nuevo es ', maxsalario); {va a imprimir basura}
end.
{este programa tiene 5 errores}
