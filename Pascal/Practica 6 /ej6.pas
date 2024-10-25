program seis;

type
	sonda = record
		nombre: string;
		duracion: 0..1000;
		costoc: real;
		costom: real;
		estudio: 1..7; //categoria
	end;
	lista =^nodo;
	nodo = record
		dato: sonda;
		sig: lista;
	end;
	vecrango = array [1..7] of integer;
	
procedure leersonda(var s: sonda);
begin
	readln(s.nombre);
	readln(s.duracion);
	readln(s.costoc);
	readln(s.costom);
	readln(s.estudio);
end;

procedure agregaradelante(var l: lista; s: sonda);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= s;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarlista(var l: lista);
var
	s: sonda;
begin
	repeat
		leersonda(s);
		agregaradelante(l,s);
	until(s.nombre = 'GAIA');
end;

procedure sondamaxima(costocos: real;costoman:real;nombre: string; var max: real; var maxnom: string);
begin
	if (costocos > max) and (costoman > max) then
		maxnom:= nombre;
end;

function prom(l: lista; duracionmax: integer; cantsondas:integer): integer;
begin
	duracionmax := duracionmax + l^.dato.duracion;
	duracionmax:= duracionmax div cantsondas;
	prom:= duracionmax;
end;

function prom2(l: lista; costomax: real;cantsondas: integer):real;
begin
	costomax:= costomax + l^.dato.costoc;
	costomax:= costomax / cantsondas;
	prom2:= costomax;
end;

procedure recorrerlista(l: lista; vc: vecrango);
var 
	nommax,maxnom: string;
	max,costomax: real;
	duracionmax,cantsondas,cantduracion: integer;
begin
	max:= -1;
	duracionmax:= 0;
	cantduracion:= 0;
	cantsondas:= 0;
	costomax:= 0;
	nommax:= '';
	while (l <> nil) do begin
		cantsondas:= cantsondas + 1;
		sondamaxima(l^.dato.costoc,l^.dato.costom,l^.dato.nombre,max,maxnom); // a
		vc[l^.dato.estudio]:= vc[l^.dato.estudio] + 1; // b
		if (l^.dato.duracion > (prom(l,duracionmax,cantsondas))) then //c
			cantduracion:= cantduracion + 1;
		if (l^.dato.costoc > (prom2(l,costomax,cantsondas))) then
			nommax:= l^.dato.nombre;
		l:= l^.sig;
	end;
	writeln(maxnom);//a
	writeln(vc[1],vc[2],vc[3],vc[4],vc[5],vc[6],vc[7]); //b
	writeln(cantduracion); // c
	writeln(nommax); //d
end;

var
	l: lista;
	v:vecrango;
	x: integer;
begin
	for x:= 1 to 7 do 
		v[x]:= 0;
	l:= nil;
	cargarlista(l);
	recorrerlista(l,v);
end.
