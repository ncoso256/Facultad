{3. Dado el siguiente programa, indicar cuál es el error y su causa.}

program alcance3;
var
	a: integer; // no encuentra b en el programa principal por lo cual rompe todo en el  writeln(a, b);
procedure uno;
var
	b: integer; 
begin
	b:= 2;
	writeln(b);
end;
begin
	a:= 1;
	uno; 
	writeln(a, b); // b no es una variable en el programa ppal
end.

// este programa tiene un error
