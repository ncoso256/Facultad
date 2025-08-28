{
3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..

c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.

d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).

}

program tres;
const
	dimf = 8;
type
	rangocodgen = 1..dimf;
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
	
	vector = array[rangocodgen] of lista;
	vectorcontador = array[rangocodgen] of real;

procedure leerpelicula(var p: pelicula);
begin
	readln(p.codpeli);
	if (p.codpeli <>-1) then begin
		readln(p.codgen);
		readln(p.puntajecritica);
	end;
end;

procedure inicializarvector(var v: vector; vc: vectorcontador);
var
	i,j: integer;
begin
	for i:= 1 to dimf do
		v[i]:= nil;
	for j:= 1 to dimf do
		vc[j]:= 0;
end;

procedure agregaratras(var l,ult: lista; p:pelicula);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= nil;
	if (l <> nil) then 
		l:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;

procedure cargarvector(var v: vector; var vc: vectorcontador);
var
	p: pelicula;
begin
	inicializarvector(v,vc);
	leerpelicula(p);
	while (p.codpeli <> -1) do begin
		agregaratras(v[p.codgen],v[p.codgen],p);
		leerpelicula(p);
	end;
end;

procedure maxymin(punt: real; var puntmax: real;var codmax:integer;var puntmin: real; var mincod:integer);
var
	i: integer;
begin
	for i:= 1 to dimf do begin
		if (punt > puntmax) then begin
			puntmax:= punt;
			codmax:= i;
		end;
		if (punt < puntmin) then begin
			puntmin:= punt;
			mincod:= i;
		end;
	end;
end;

procedure maximoyminimo(l: lista; vcont: vectorcontador; var maxpunt: real; var maxcod: integer; var minpunt: real; var mincod: integer);
begin
	maxpunt:= -1;
	maxcod:= 1;
	minpunt:= 9999;
	mincod:= 8;
	while (l <> nil) do begin
		maxymin(vcont[l^.dato.codgen],maxpunt,maxcod,minpunt,mincod);
		l:= l^.sig;
	end;
end;

procedure recorrer(v: vector;var vc: vectorcontador);
var
	maxpunt,minpunt: real;
	maxcod,mincod,i: integer;
begin
	for i:= 1 to dimf do begin
		vc[v[i]^.dato.codgen]:= vc[v[i]^.dato.codgen] + v[i]^.dato.puntajecritica;
		maximoyminimo(v[i],vc,maxpunt,maxcod,minpunt,mincod);
	end;
	writeln(maxpunt);
	writeln(maxcod);
	writeln(minpunt);
	writeln(mincod);
end;

procedure ordenar_por_seleccion_por_puntaje(var v: vector);
var
	i,j,pos: integer;
	item: lista;
begin
	for i:= 1 to dimf-1 do begin
		pos:= i;
		for j:= i+1 to dimf do 
			if (v[j]^.dato.puntajecritica < v[pos]^.dato.puntajecritica) then 
				pos:= j;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;
end;

var
	v: vector;
	vc: vectorcontador;
begin
	cargarvector(v,vc);
	recorrer(v,vc);
	ordenar_por_seleccion_por_puntaje(v);
end.
