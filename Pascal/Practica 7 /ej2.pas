program ej2p7;
const
	corte = 1122;
type
	rangopoliza = 1..6;
	cliente = record
		codcliente,dni: integer;
		ape,nombre: string;
		codpoliza: rangopoliza;
		monto: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: cliente;
		sig: lista;
	end;
	
	vector = array [rangopoliza] of real; 

procedure leercliente(var c: cliente);
begin
	readln(c.codcliente);
	readln(c.dni);
	readln(c.ape);
	readln(c.nombre);
	readln(c.codpoliza);
	readln(c.monto);
end;

procedure agregaradelante(var l: lista; c: cliente);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= c;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarlista(var l: lista);
var
	c: cliente;
begin
	repeat
		leercliente(c);
		agregaradelante(l,c);
	until(c.codcliente = corte);
end;

procedure cargarvector(var v: vector); // se dispone
var
	i: rangopoliza;
	monto: real;
begin
	for i:= 1 to 6 do begin
		readln(monto);
		v[i]:= monto;
	end;
end;

function cumple (x: integer): boolean;
var
	cant: integer;
begin
	cant:= 0;
	while (x <> 0) do begin
		if (x mod 10 = 9) then
			cant:= cant + 1;
		x:= x div 10;
	end;
	cumple:= (cant >= 2);
end;

procedure recorrer(l: lista; v: vector);
var
	montocompleto: real;
	i: rangopoliza;
begin
	montocompleto:= 0;
	i:= l^.dato.codpoliza;
	while (l<> nil) do begin
		montocompleto:= l^.dato.monto + v[i]; 
		writeln(l^.dato.dni , l^.dato.ape , l^.dato.nombre , montocompleto);
		if (cumple(l^.dato.dni)) then
			writeln(l^.dato.ape , l^.dato.nombre);
		l:= l^.sig;
	end;
end;


procedure eliminar(var l: lista; codigocliente: integer);
var
	actual,ant: lista;
begin
	actual:= l;
	while(actual <> nil) and (actual^.dato.codcliente <> codigocliente) do begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	if (actual <> nil) then 
		if (actual = l) then
			l:=l^.sig
		else
			ant^.sig:= actual^.sig;
		dispose(actual);
end;

var
	l: lista;
	v: vector;
	codcli: integer;
begin
	l:= nil;
	cargarlista(l);
	cargarvector(v); // se dispone
	recorrer(l,v); 
	readln(codcli);
	eliminar(l,codcli);
end.
