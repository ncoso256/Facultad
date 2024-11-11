program ej7p7;
type
	rangonotas= 4..10;
	vector = array[1..24] of rangonotas;
	alumno = record
		num: integer;
		ape: string;
		nom: string;
		correo: string;
		anioin: integer;
		anioout: integer;
		notas: vector;
	end;
	
	totalizador = record
		min1,min2: integer;
		apemin1,apemin2: string;
		nommin1,nommin2: string;
		correomin1,correomin2: string;
	end;
	
	lista = ^nodo;
	nodo= record
		dato: alumno;
		sig: lista;
	end;
	
procedure cargarvector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 24 do begin
		readln(v[i]);
	end;
end;

procedure ordenarvector(var v: vector);
var
	i,j,p,item: integer;
begin
	for i:= 1 to 24-1 do begin
		p:= i;
		for j:= i+1 to 24 do
			if (v[j] < v[p]) then
				p:= j;
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	end;
end;
	
procedure leeralumno(var a: alumno);
var
	v: vector;
begin
	readln(a.num);
	if (a.num <> -1) then begin
		readln(a.ape);
		readln(a.nom);
		readln(a.correo);
		readln(a.anioin);
		readln(a.anioout);
		cargarvector(v);
		ordenarvector(v);
	end;
end;

procedure agregaradelante(var l: lista; a: alumno);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= a;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarlista(var l: lista);
var
	a: alumno;
begin
	leeralumno(a);
	while (a.num <> -1) do begin
		agregaradelante(l,a);
		leeralumno(a);
	end;
end;

function promedio(nota: vector): real;
var
	i: integer;
begin
	promedio:= 0;
	for i:= 1 to 24 do
		promedio:= promedio + nota[i];
	promedio:= promedio / 24;
end;

function cumple (num: integer): boolean; // funcion para ver si el numero es solo impar y devuelve verdadero o falso 
var
	dig: integer;
	ok: boolean;
begin
	ok:= true; // inicializo el booleano en true para cortar el while si hay un digito 
	while (num <> 0)and (ok) do begin 
		dig:= num mod 10; // tomo el ultimo digito del dni
		if (dig mod 2 <> 1) then // si el digito es par
			ok:= false; // pongo el booleano en falso
		num:= num div 10; // saco el ultimo digito del dni
	end;
	cumple:= ok; // devuelvo el booleano
end;

procedure inicializartotalizador(var t: totalizador);
begin
	t.min1:= 9999;
	t.min2:= 9999;
end;

procedure minimo(recibido: integer;var t: totalizador; apellido,nombre,correo: string);
begin
	inicializartotalizador(t);
	if (recibido < t.min1) then begin
		t.min2:= t.min1;
		t.apemin2:= t.apemin1;
		t.nommin2:= t.nommin1;
		t.correomin2:= t.correomin1;
		t.min1:= recibido;
		t.apemin1:= apellido;
		t.nommin1:= nombre;
		t.correomin1:= correo;
	end
	else if (recibido < t.min2) then begin
		t.min2:= recibido;
		t.apemin2:= apellido;
		t.nommin2:= nombre;
		t.correomin2:= correo;
	end;
end;

procedure recorrerlista(l: lista);
var
	prom: real;
	cant,recibidos: integer;
	t: totalizador;
begin
	prom:= 0;
	cant:= 0;
	recibidos:= 0;
	while (l <> nil) do begin
		prom:= promedio(l^.dato.notas);
		writeln(prom);
		if(l^.dato.anioin = 2012) and (cumple(l^.dato.num)) then
			cant:= cant + 1;
		recibidos:= recibidos + (l^.dato.anioin - l^.dato.anioout);
		minimo(recibidos,t, l^.dato.ape,l^.dato.nom, l^.dato.correo); 
		l:= l^.sig;
	end;
	writeln(cant);
	writeln('El primer alumno que tardo menos años en recibirse fue' , t.min1 , ' con apellido, nombre y correo', t.apemin1,t.nommin1,t.correomin1);
	writeln('El segundo alumno que tardo menos años en recibirse fue' , t.min2 , ' con apellido, nombre y correo', t.apemin2,t.nommin2,t.correomin2);
end;

procedure borrarelemento(var l: lista; n: integer; var exito: boolean);
var
	ant,act: lista;
begin
	exito:= false;
	act:= l;
	while (act <> nil) and (act^.dato.num <> n) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act <> nil) then begin
		exito:= true;
		if (act = l) then
			l:= act^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

var
	l: lista;
	num: integer;
	ok: boolean;
begin
	l:= nil;
	cargarlista(l);
	recorrerlista(l);
	readln(num);
	borrarelemento(l,num,ok);
end.
