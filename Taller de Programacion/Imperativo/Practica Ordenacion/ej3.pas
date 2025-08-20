program tres;
type
	rangocodgen = 1..8;
	pelicula = record
		codpeli: integer;
		codgen: rangocodgen;
		puntajecritica: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	vector = array[rangocodgen] of real;

procedure leerpelicula(var p: pelicula);
begin
	readln(p.codpeli);
	readln(p.codgen);
	readln(p.puntajecritica);
end;

procedure agregaratras(var l,ult: lista; p: pelicula);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= nil;
	if (l = nil) then
		l:= nue
	else begin
		ult^.sig:= nue;
		ult:= nue;
	end;
end;

procedure cargarlista(var l: lista);
var
	p: pelicula;
	ult: lista;
begin
	ult:= nil;
	repeat
		leerpelicula(p);
		agregaratras(l,ult,p);
	until (p.codpeli = -1);
end;

procedure inicializar(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 8 do
		v[i]:= 0;
end;

procedure maximo(v: vector; var puntmax: real;var codmax: integer);
var
	i: integer;
begin
	puntmax:= -1;
	codmax:= 1;
	for i:= 1 to 8 do begin
		if (v[i] > puntmax) then begin
			puntmax:= v[i];
			codmax:= i;
		end;
	end;
end;

procedure minimo(v: vector; var puntmin: real; var codmin: integer);
var
	i: integer;
begin
	puntmin:= 9999;
	codmin:= 8;
	for i:= 1 to 8 do begin
		if (v[i] < puntmin) then begin
			puntmin:= v[i];
			codmin:= i;
		end;
	end;
end;

procedure recorrerlista(l: lista; var v: vector);
var
	actual: rangocodgen;
	maxpunt,minpunt: real;
	maxcod,mincod: integer;
begin
	inicializar(v);
	while(l <> nil) do begin
		actual:= l^.dato.codgen;
		while (l <> nil) and (actual = l^.dato.codgen) do
			v[l^.dato.codgen]:= v[l^.dato.codgen] + l^.dato.puntajecritica;
	end;
	maximo(v,maxpunt,maxcod);
	writeln(maxpunt); writeln(maxcod);
	minimo(v,minpunt,mincod);
	writeln(minpunt); writeln(mincod);
end;



procedure ordenar_por_seleccion_por_puntaje(var v: vector);
var
	i,j,pos: integer;
	item: real;
begin
	for i:= 1 to 8-1 do begin {Busca el minimo y guarda en pos la posicion}
		pos:= i;
		for j:= i+1 to 8 do begin
			if (v[j] < v[pos]) then
				pos:= j;
			
			{Intercambia v[i] y v[j]}
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item
		end;
	end;
end;

var
	l: lista;
	v: vector;
begin
	l:= nil;
	cargarlista(l);
	recorrerlista(l,v);
	ordenar_por_seleccion_por_puntaje(v);
end.
