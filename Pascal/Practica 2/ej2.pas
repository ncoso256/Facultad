program alcance2;
var 
	a,b: integer;
procedure uno;
begin
	b := 3;
	writeln(b);
end;
begin
	a:= 1;
	b:= 2;
	uno; // b:= 3
	writeln(b, a); //31 imprime //este modifica el programa anterior porque no hay variables locales en el procedimiento por lo cual se modifica b
end.
