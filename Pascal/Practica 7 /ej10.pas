program ej10p7;
type
	rangocultivo = 1..20;
	vector = array[rangocultivo] of string;
	empresa = record
		cod: integer;
		nombre: string;
		esestatal: string;
		nombreciudad: string;
		cultivo: rangocultivo;
		tipocultivo: vector;
		canthectareas: real;
		cantmeses: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: empresa;
		sig: lista;
	end;

procedure cargarvector(var v: vector; var diml: rangocultivo);
var
	i: integer;
begin
	for i:= 1 to diml do
		readln(v[i]);
end;

procedure leerempresa(var e: empresa);
var
	v: vector;
begin
	readln(e.cod);
	if (e.cod <> -1) then begin 
		readln(e.nombre);
		readln(e.esestatal);
		if (e.esestatal = 'estatal') or (e.esestatal = 'privada') then begin
			readln(e.cultivo);
			cargarvector(v,e.cultivo);
			readln(e.canthectareas);
			if (e.canthectareas <> 0) then 
				readln(e.cantmeses);
		end;
	end;
end;

procedure agregaradelante(var l: lista; e: empresa);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= e;
	nue^.sig:= l;
	l:= nue;
end;	

procedure cargarlista(var l: lista);
var
	e: empresa;
begin
	leerempresa(e);
	while (e.cod <> -1) and (e.canthectareas <> -1) do begin
		agregaradelante(l,e);
		leerempresa(e);
	end;
end;

function almenosdosceros(cod: integer): boolean;
var
	dig: integer;
	cantcero: integer;
begin
	cantcero:= 0;
	while (cod <> 0) do begin
		dig:= cod mod 10;
		if (dig = 0) then
			cantcero:= cantcero + 1;
		cod:= cod div 10;
	end;
	almenosdosceros:= (cantcero >= 2);
end;
procedure maximo(tiempomaiz: integer; var max: integer; var nommax: string; nombre: string);
begin
	max:= -1;
	if (tiempomaiz > max) then begin
		max:= tiempomaiz;
		nommax:= nombre;
	end;
end;

procedure recorrerlista(l: lista);
var
	tiempomaiz,inc,max: integer;
	canthe,canttotalhe: real;
	maxnom: string;
begin
	canthe:= 0;
	canttotalhe:= 0;
	tiempomaiz:= 0;
	inc:= 0;
	while (l<> nil) do begin
		if (l^.dato.nombre = 'San Miguel del Monte') and (l^.dato.tipocultivo[l^.dato.cultivo] = 'trigo') and (almenosdosceros(l^.dato.cod))then
			writeln(l^.dato.nombre);
		if (l^.dato.tipocultivo[l^.dato.cultivo] = 'soja') then 
			canthe:= canthe + l^.dato.canthectareas;
		canttotalhe:= canttotalhe + l^.dato.canthectareas;
		if (l^.dato.tipocultivo[l^.dato.cultivo] = 'maiz') then
			tiempomaiz:= tiempomaiz + l^.dato.cantmeses; 
		maximo(tiempomaiz,max,maxnom, l^.dato.nombre);
		if (l^.dato.tipocultivo[l^.dato.cultivo] = 'girasol') and (l^.dato.canthectareas < 5) and (l^.dato.esestatal = 'privada') then
			inc:= inc + (l^.dato.cantmeses + 1);
		writeln(inc);
		l:= l^.sig;
	end;
	writeln(canthe, (canthe*100 / canttotalhe):0:2);
	writeln(maxnom);
end;

var
	l: lista;
begin
	l:= nil;
	cargarlista(l);
	recorrerlista(l);
end.
