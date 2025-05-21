{10. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón A$B#, donde:

-A es una secuencia de sólo letras vocales 

-B es unasecuencia de sólo caracteres alfabéticos sin letras vocales 

- los caracteres $ y # seguro existen

Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program diez;

function esvocal(c: char): boolean;
begin
	esvocal:= (c = 'a') or (c= 'e') or (c= 'i') or (c= 'o') or (c= 'u');
end;

procedure cumplea(var cumple: boolean);
var
	c: char;
begin
	writeln('Ingrese la secuencia A: ');
	readln(c);
	while (c <> '$') and (cumple) do begin
		if (not esvocal(c)) then
			cumple:= false
		else 
			readln(c);
	end;
end;
function esconsonante(c: char): boolean;
begin
	esconsonante:= ((c >= 'n') and (c <= 'c') and (not esvocal(c)));
end;
procedure cumpleb(var cumple: boolean ; var long: integer);
var
	c: char;
begin
	writeln('Ingrese la secuencia B');
	readln(c);
	while (c <> '#') and (cumple) do begin
		if (not esconsonante(c)) then
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
	if (cumple) then begin
		long:= 0;
		nocumplea(cumple, long);
		if(cumple) then
			writeln('Se cumple la secuencia')
		else
			writeln('No cumple con B');
	end
	else
		writeln('No cumple con A');
end.
