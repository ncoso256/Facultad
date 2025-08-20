program cuatro;
type
	rangorubro = 1..8;
	producto = record
		codprod: integer;
		codrubro: rangorubro;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	vector = array [1..30] of lista; {Realmente no se como se hace esto}

procedure leerproducto(var p: producto);
begin
	readln(p.codprod);
	readln(p.codrubro);
	readln(p.precio);
end;

procedure insertarordenado(var l: lista; p: producto);
var
	nue,ant,act: lista;
begin
	new(nue);
	nue^.dato:= p;
	act:= l;
	while(act <> nil) and (act^.dato.codprod < p.prod) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = l) then 
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarlista(var l: lista);
var
	p: producto;
begin
	repeat
		leerproducto(p);
		insertarordenado(l,p);
	until(p.precio = 0);
end;

procedure recorrerlista(l: lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato.codprod);
		l:= l^.sig;
	end;
end;

var
	l: lista;
begin
	l:= nil;
	cargarlista(l);
	recorrerlista(l);
end.
