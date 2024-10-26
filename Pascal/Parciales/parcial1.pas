{
REDICTADO CADP 2023 (31/10),TEMA 1
Un restaurante necesita un programa para administrar la información de los platos que ofrece. Se dispone de una estructura con la 
información de los platos. De cada plato se conoce: nombre, precio, categoría (1: Entrada, 2: Principal, 3: Postre, 4: Minuta), 
cantidad de ingredientes y nombre de cada uno de los ingredientes (a lo sumo 10).

Se pide:

A) Generar una nueva estructura con nombre y precio de cada plato que posea "perejil" entre sus ingredientes.
B) Informar las dos categorías con mayor cantidad de platos ofrecidos.
C) Informar el precio promedio de los platos con más de 5 ingredientes.
}


program parcial;
const
	fin = 'r'; 
type
	rangoingredientes = 1..10;
	rangocat= 1..4;
	vector = array[rangoingredientes] of string;
	plato = record
		nom: string;
		precio: real;
		categoria: rangocat;
		cantingredientes: rangoingredientes;
		nombreingredientes: vector;
	end;
	lista = ^nodo;
	nodo = record
		dato: plato;
		sig: lista;
	end;
	totalizadorcat = record
		cat1,cat2: integer;
		max1,max2: integer;
	end;
	nuevaestructura = record
		nombre: string;
		pre: real;
	end;
	lista2 = ^nodo2;
	nodo2 = record
		dato2: nuevaestructura;
		sig2: lista2;
	end;
	vectorcontador = array[rangocat] of integer;

procedure agregaradelante2(var l: lista; p: plato);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= p;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure cargarvector(var v: vector; diml: rangoingredientes);
var
	i: rangoingredientes;
	ingrediente: string;
begin
	writeln('--CARGANDO VECTOR--');
	writeln('Ingrese ', diml, ' ingredientes');
	for i:= 1 to diml do begin
		readln(ingrediente);
		v[i]:= ingrediente;
	end;
end;

procedure leerplato(var p: plato);
var
	v:vector;
begin
	writeln('--CARGANDO LISTA--');
	with p do begin
		writeln('Ingrese el nombre --FIN R--');
		readln(nom);
		if (nom <> fin) then begin
			writeln('Ingrese el precio');
			readln(precio); 
			writeln('Ingrese la categoría --1 a 4--');
			readln(categoria);
			writeln('Ingrese la cantidad de ingredientes --1 a 10--');
			readln(cantingredientes);
			cargarvector(v,cantingredientes);
			nombreingredientes:= v;
		end;
	end;
end;

procedure cargarlista(var l: lista); // se dispone
var
	p: plato;
begin
	leerplato(p);
	while(p.nom <> fin) do begin
		AgregarAdelante2(l,p);
		leerplato(p);
	end;
end;

procedure agregaradelante1(var l2: lista2; n: nuevaestructura);
var
	nue: lista2;
begin
	new(nue);
	nue^.dato2:= n;
	nue^.sig2:= l2;
	l2:= nue;
end;	

procedure inicializarvc(var vc: vectorcontador);
var
	i: rangocat;
begin
	for i:=1 to 4 do
		vc[i]:= 0;
end;

procedure agregar(v: vector; diml: integer;nombre: string; precio: real; var l2: lista2);
var
	n: nuevaestructura;
	i: rangoingredientes;
begin
	for i:= 1 to diml do begin
		if (v[i] = 'perejil') then begin
			n.nombre:= nombre;
			n.pre:= precio;
			agregaradelante1(l2,n);
		end;
	end;
end;

procedure recorrerlista(l: lista; var l2: lista2; var vc: vectorcontador);
var
	preciototal: real;
	cant: integer;
begin
	preciototal:= 0;
	cant:= 0;
	inicializarvc(vc);
	while (l <> nil) do begin
		agregar(l^.dato.nombreingredientes,l^.dato.cantingredientes,l^.dato.nom,l^.dato.precio,l2);
		vc[l^.dato.categoria]:= vc[l^.dato.categoria] + 1;
		if (l^.dato.cantingredientes > 5) then 
			cant:= cant + 1;
		preciototal:= preciototal + l^.dato.precio;
		l:= l^.sig;
	end;
	if (cant > 0) then
		writeln((preciototal/cant):0:2);
end;

procedure inicializartotalizador(var t: totalizadorcat);
begin
	t.max1:= -1;
	t.max2:= -1;
end;

procedure maximo(var t: totalizadorcat; cant,cat: integer);
begin
	if (cant > t.max1) then begin
		t.max2:= t.max1;
		t.max1:= cant;
		t.cat2:= t.cat1;
		t.cat1:= cat;
	end
	else begin 
		if (cant > t.max2) then begin
			t.max2:= cant;
			t.cat2:= cat;
		end;
	end;
end;

procedure elmaximo(v: vectorcontador);
var
	i: rangocat;
	t: totalizadorcat;
begin
	inicializartotalizador(t);
	for i:= 1 to 4 do begin
		maximo(t,v[i],i);
	end;
	writeln(t.cat1);
	writeln(t.cat2);
end;

var
	l: lista;
	l2: lista2;
	v: vectorcontador;
begin
	l:= nil;
	l2:= nil;
	cargarlista(l); // se dispone
	recorrerlista(l,l2,v);
	elmaximo(v); 
end.
