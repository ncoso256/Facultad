program ej1p7;
const
	corte = 33555444;
type
	rangogenero = 1..5;
	persona = record
		dni: integer;
		apeynombre: string;
		edad: integer;
		genero: rangogenero;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: persona;
		sig: lista;
	end;
	
	vectorcontador = array [rangogenero] of integer;
	
procedure leerpersona(var p: persona);
begin
	readln(p.dni);
	readln(p.apeynombre);
	readln(p.edad);
	readln(p.genero);
end;

procedure agregaradelante(var l: lista; p: persona);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l:= nue;
end;

procedure inicializarvector(var v: vectorcontador);
var
	i: rangogenero;
begin
	for i:= 1 to 5 do begin
		v[i]:= 0;
	end;
end;

procedure cargarlista(var l: lista);
var
	p: persona;
begin
	repeat
		leerpersona(p);
		agregaradelante(l,p);
	until p.dni = corte;
end;


function cumple(x: integer): boolean;
var
	dig,pares,impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while (x <> 0) do begin
		dig:= x mod 10;
		if (dig mod 2 = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		x:= x div 10;
	end;
	cumple:= (pares > impares);
end;

procedure maximo (cod,cant: rangogenero; var maxgen1,maxgen2,cod1,cod2: rangogenero);
begin
	if (cant > maxgen1) then begin
		maxgen2:= maxgen1;
		cod2:= cod1;
		maxgen1:= cant;
		cod1:= cod;
	end
	else begin if(cant > maxgen2)then 
		maxgen2:= cant;
		cod2:= cod;
	end;
end;

procedure max (v: vectorcontador);
var
	i: rangogenero;
	maxgenero1,maxgenero2,cod1,cod2: rangogenero;
begin
	maxgenero1:= 1;
	maxgenero2:= 1;
	for i:= 1 to 5 do begin
		maximo(i,v[i],maxgenero1,maxgenero2,cod1,cod2);
	end;
	writeln (cod1 , cod2); // b
end;

procedure recorrerlista(l: lista; var cant: integer; var v:vectorcontador);
begin
	cant:= 0;
	while (l<> nil) do begin
		if (cumple(l^.dato.dni)) then
			cant:= cant + 1;
		v[l^.dato.genero]:= v[l^.dato.genero] + 1; 
		l:= l^.sig;
	end;
	max(v);
end;

procedure eliminar(var l: lista; dni: integer);
var
	ant,actual: lista;
begin
	actual:= l;
	while (actual <> nil) and (actual^.dato.dni <> dni) do begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	if (actual <> nil) then
		if (actual = l) then
			l:= l^.sig
		else
			ant^.sig:= actual^.sig;
		dispose(actual);
end;

var
	l: lista;
	cantidad: integer;
	dni: integer;
	v: vectorcontador;
begin
	l:= nil;
	inicializarvector(v);
	cargarlista(l);
	recorrerlista(l,cantidad,v);
	writeln(cantidad);  // a
	readln(dni);
	eliminar(l,dni);
end.
