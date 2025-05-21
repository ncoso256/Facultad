{1. Dado el siguiente programa, indicar qué imprime.}

program alcance1;
var
	a, b: integer;
procedure uno;
var 
	b: integer;
begin
	b:= 3;
	writeln(b);
end;
begin
	a:= 1;
	b:= 2;
	uno; {escribe 3}
	writeln(b,a); {escribe todo en uno b:= 2 y a:= 1 writeln(b,a) escribe 21}
end.
