program alcance4a;
var
	a, b: integer;
procedure uno;
begin
	a:= 1;
	writeln(a);
end;
begin
	a:= 1;
	b:= 2;
	uno; // imprime 1 
	writeln(b, a); // imprime 21
end.

program alcance4b;
procedure uno; // a no existe en el procedimiento
begin
	a:= 1; //error1
	writeln(a); //error2
end;
var 
	a,b: integer; // variables locales al programappal
begin
	a:= 1;
	b:= 2;
	uno;
	writeln(b, a);
end.

