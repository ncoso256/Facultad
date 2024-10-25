//4c
program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
	pun^:= 'Otro texto';
end;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'Un texto'; 
	writeln(pc^); // imprime Un texto
	cambiarTexto(pc); // cambia al puntero
	writeln(pc^); // imprime Otro texto
end.
