{2. Responda la pregunta en relación al siguiente programa:}

program ej4;
procedure digparesimpares (num: integer; var par, impar: integer);
var
	dig: integer;
begin
	while (num <> 0) do begin
		dig:= num mod 10;
		if ((dig mod 2)= 0)then
			par:= par + 1
		else
			impar:= impar + 1;
		num:= num div 10;
	end;
end;
var
	dato, par, impar, total, cant: integer;
begin
	par:= 0;
	impar:= 0;
	repeat
		readln(dato);
		digparesimpares(dato,par,impar);
	until(dato = 100);
	writeln('pares: ',par, 'impares: ', impar);
end.

{a. ¿Qué imprime si se lee la siguiente secuencia de valores? 250, 35, 100}
// a) imprime que hay 4 pares y 4 impares con 250, 35, 100
