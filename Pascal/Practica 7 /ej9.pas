program ej9p7;
type
	rangogenero = 1..8;
	pelicula = record
		codpeli: integer;
		titulo: string;
		codgenero: rangogenero;
		puntajeprom: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	critica = record
		dni: integer;
		apeynom: string;
		codigo: integer;
		puntaje: real;
	end;
	vectorcontador = array[rangogenero] of real;
procedure cargarlista(var l: lista); // se dispone


function descomponer(dni: integer): boolean;
var
	dig,pares,impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while (dni <> 0) do begin
		dig:= dni mod 10;
		if (dig mod 2 = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		dni:= dni div 10;
	end;
	descomponer:= (pares = impares)
end;

procedure leercritica(var c: critica);
begin
	readln(c.dni);
	readln(c.apeynom);
	readln(c.codigo);
	readln(c.puntaje);
end;

procedure actualizar(var l: lista);
var
	c: critica;
	aux: lista;
	actual,cant: integer;
	puntajetot: real;
begin
	leercritica(c);
	while(c.codigo <> -1) do begin
		actual:= c.codigo; 
		cant:= 0;
		puntajetot:= 0;
		while(c.codigo <> -1)and(actual = c.codigo) do begin
			cant:= cant + 1;
			puntajetot:= puntajetot + c.puntaje;
			if(descomponer(c.dni)) then
				writeln(c.apeynom); // inciso c
			leercritica(c);
		end;
		aux:= l;
		while (aux^.dato.codpeli <> c.codigo) do
			aux:= aux^.sig;
		l^.dato.puntajeprom:= puntajetot / cant; // inciso a
	end;
	
end;	

procedure inicializarvc(var v: vectorcontador);
var
	i: integer;
begin
	for i:= 1 to 8 do
		v[i]:= 0;
end;

procedure recorrerlista(l: lista; vc: vectorcontador);
var
	i,max: integer;
	maxpuntaje: real;
begin
	inicializarvc(vc);
	maxpuntaje:= -1;
	max:= 0;
	while (l <> nil) do begin
		vc[l^.dato.codgenero]:= vc[l^.dato.codgenero] + l^.dato.puntajeprom;
		l:= l^.sig;
	end;
	for i:= 1 to 8 do begin
		if (v[i] > maxpuntaje) then begin
			maxpuntaje:= v[i];
			max:= i;
		end;
	end;
	writeln('El codigo que mas puntaje obtuvo fue', max, 'con puntaje', maxpuntaje); // inciso b
end;

procedure borrarelemento(var l: lista; codigo: integer);
var
	ant,act: lista;
begin
	ant:= l;
	act:= l;
	while (act <> nil) and (act^.dato.codpeli <> codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act <> nil) then begin
		if (act = l) then 
			l:= l^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

var
	l: lista;
	v: vectorcontador;
	cod: integer;
begin
	cargarlista(l); // se dispone
	actualizar(l);
	recorrerlista(l,v);
	readln(cod);
	borrarelemento(l,cod); // inciso d
end.
