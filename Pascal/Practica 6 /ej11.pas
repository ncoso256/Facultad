program ej11p6;
type
	egresado = record
		nro: integer;
		apellido: string;
		promedio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: egresado;
		sig: lista;
	end;

procedure leeregresado(var e: egresado);
begin
	writeln('Ingrese el numero del egresado');
	readln(e.nro);
	if (e.nro <> 0) then begin
		writeln('Ingrese el apellido del egresado');
		readln(e.apellido);
		writeln('Ingrese el promedio del egresado');
		readln(e.promedio);
	end;
end;

procedure insertarordenado(var l: lista; e: egresado);
var
	nue: lista;
	ant,act: lista;
begin
	new(nue);
	nue^.dato:= e;
	nue^.sig:= nil;
	ant:= l;
	act:= l;
	while(act <> nil) and (e.promedio > l^.dato.promedio) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarlista(var l:lista; e: egresado);
begin
	leeregresado(e);
	while (e.nro <> 0) do begin
		insertarordenado(l,e);
		leeregresado(e);
	end;
end;

procedure informarlista(l: lista);
begin
	while (l<> nil) do begin
		writeln(l^.dato.apellido,l^.dato.nro);
		l:= l^.sig;
	end;
end;

var
	l: lista;
begin
	l:= nil;
	cargarlista(l);
	informarlista(l);
end.
