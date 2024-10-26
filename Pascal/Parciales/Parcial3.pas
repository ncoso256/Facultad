{Se va a desarrollar un concurso de docentes universitarios que se dedican a la investigación y se debe realizar un programa para administrar cicho concurso.
 Para ello se lee desde teclado información de docentes. De cada docente se lee: DNI, Apellido, Nombre, código de la facultad a la que pertenece (1..17),
  código de categoría de docente (1..5), área de investigación y cantidad de años en investigación. La lectura finaliza cuando llega el docente con DNI 0.

Además, para desarrollar el programa se dispone de una tabla que indica para cada categoría de docente el puntaje básico que se otorga por año de investigación.

Una vez que ha leída y almacenada la información de ios docentes, se pide:

a) Informar para cada docente el DNI, Apellido, Nombre y puntaje total otorgado según sus años de investigación y su categoría de docente. 
El puntaje total se calcula como: años de investigación del docente multiplicado por el valor que indique la tabla parą su categoría de docente.

b) Calcular e informar el código de facultad con mayor cantidad de docentes universitarios categoría 2.

c) Informar cuántos docentes categoría 5 se desempeñan en el área de "Ingeniería de Software".

d) Informar el DNI, Apellido y Nombre de aquellos docentes cuyo DNI contenga igual cantidad de dígitos pares que impares.}


program parcial2015;
type
	rangofacultad = 1..17;
	rangocat = 1..5;
	docente = record
		dni: integer;
		ape: string;
		nom: string;
		codfacu: rangofacultad;
		codcate: rangocat;
		area: string;
		cantanios: integer;
	end;
	
	vectorcontador = array[rangofacultad] of integer;
	
	vector = array[rangocat] of integer;
	
	lista = ^nodo;
	nodo = record
		dato: docente;
		sig: lista;
	end;	
	
procedure leer(var d: docente);
begin
	readln(d.dni);
	if (d.dni <> 0) then begin
		readln(d.ape);
		readln(d.nom);
		readln(d.codfacu);
		readln(d.codcate);
		readln(d.area);
		readln(d.cantanios);
	end;
end;

procedure agregaradelante(var l: lista; d: docente);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= l;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarlista(var l: lista);
var
	d: docente;
begin
	leer(d);
	while (d.dni <> 0) do begin
		agregaradelante(l,d);
		leer(d);
	end;
end;

procedure inicializarvc(var vc: vectorcontador);
begin
	for i:= 1 to 5 do
		vc[i]:= 0;
end;

procedure cargarvector(var v: vector); //  se dispone

function cumple (dni: integer): boolean;
var
	dig: integer;
	pares: integer;
	impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while (dni <> 0) do begin
		dig:= dni mod 10;
		if (dni mod 2 = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		dni:= dni div 10;
	end;
	cumple:= (pares = impares);
end;

procedure recorrerlista(l: lista;var vc: vectorcontador);
var
	v: vector;
	cant,puntajetotal: integer;
begin
	puntajetotal:= 0;
	cant:= 0;
	cargarvector(v);
	inicializarvc(vc);
	while (l <> nil) do begin
		writeln(l^.dato.dni);
		writeln(l^.dato.apellido);
		puntajetotal:= puntajetotal + (v[l^.dato.codcate] * l^.dato.cantanios);
		writeln(puntajetotal);
		writeln(l^.dato.codcate);
		if (l^.dato.categoria = 2) then
			vc[l^.dato.codfacu]:= vc[l^.dato.codfacu] + 1;
		if (l^.dato.codcate = 5) and (l^.dato.area = 'Ingenieria de Software') then
			cant:= cant + 1;
		if (cumple(l^.dato.dni)) then begin
			writeln(l^.dato.dni);
			writeln(l^.dato.ape);
			writeln(l^.dato.nom);
		end;
		l:= l^.sig;
	end;
	writeln(cant);
end;

procedure max(var cantmax,codmax: integer; cant: integer; cod: rangofacultad);
begin
	if (cant > cantmax) then begin
		cantmax:= cant;
		codmax:= cod;
	end;
end;

procedure maximo(v: vectorcontador);
var
	maxcant,maxcod: integer;
	i: integer;
begin
	maxcant:= -1;
	for i:= 1 to 17 do
		max(maxcant,maxcod,v[i],i);
	writeln(maxcod);
end;

var
	l: lista;
	v: vectorcontador;
begin
	l:= nil;
	cargarlista(l);
	recorrerlista(l,v);
	maximo(v);
end.
