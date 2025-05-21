{11. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón A%B*, donde:

- A es una secuencia de caracteres en la que no existe el carácter ‘$’. 
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo 3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen 

Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program once;

function escaracter(c:char): boolean;
begin
	escaracter:= not(c = '$');
end;

procedure cumplea(var cumple: boolean);
var
	c: char;
begin
	writeln('Ingrese la secuencia de A ');
	readln(c);
	while (c <> '%') and (cumple) do begin
		if (escaracter(c)) then
			cumple:= true
		else
			readln(c);
	end;
end;

function escaracter2(c: char): boolean;
begin
	escaracter2:= ((escaracter(c)) and (c = '@'))
end;

procedure cumpleb(var cumple: boolean; var long: integer);
var
	c: char;
begin
	writeln('Escriba la secuencia B ');
	readln(c);
	while (c <> '*') and (cumple) do begin
		if (not escaracter2(c)) then
			cumple:= false
		else begin
			long:= long + 1;
			readln(c);
		end;
	end;
end;
var
	long: integer;
	cumple: boolean;
begin
	cumple:= true;
	cumplea(cumple);
	if(cumple) then begin
		long:= 0;
		cumpleb(cumple, long);
		if(cumple) then
			writeln('Se cumple la secuencia')
		else
			writeln('No cumple con B');
	end
	else
		writeln('No cumple con A');
end.
