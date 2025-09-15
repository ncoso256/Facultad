{
2. Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:

a) Genere la información de los autos (patente, año de fabricación (2015..2024), marca,
color y modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de
datos:

	i. Una estructura eficiente para la búsqueda por patente.

	ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
	almacenar juntas las patentes y colores de los autos pertenecientes a ella.

b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.

c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.

d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.

e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.

f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
color del auto con dicha patente.
}

program dos;
type
	rangofab = 2015..2024;
	cadena30 = string[30];
	auto = record
		patente: cadena30;
		aniofab: rangofab;
		marca: cadena30;
		color: cadena30;
		modelo:cadena30;
	end;
	arbol = ^nodoa;
	nodoa = record
		dato: auto;
		hi: arbol;
		hd: arbol;
	end;
	
	autoacotado = record
		patente: cadena30;
		aniof: rangofab;
		color: cadena30;
		modelo: cadena30;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: autoacotado;
		sig: lista;
	end;
	
	registroacotado = record
		marca: cadena30;
		autos: lista;
	end;
	
	arbolmarca = ^nodo2;
	nodo2 = record
		dato2: registroacotado;
		hi:arbolmarca;
		hd: arbolmarca; 
	end;
	vector = array[rangofab] of lista;
procedure leerauto(var a: auto);
begin
	readln(a.patente);
	readln(a.aniofab);
	readln(a.marca);
	if (a.marca <> 'MMM') then begin
		readln(a.color);
		readln(a.modelo);
	end;
end;

procedure insertar(var a:arbol; c:auto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= c;
		a^.hi:= nil;
		a^.hd:= nil;
	end	
	else
		if (c.patente < a^.dato.patente) then
			insertar(a^.hi,c)
		else
			insertar(a^.hd,c);
end;

procedure crearregistro(var a:autoacotado; c:auto);
begin
	a.patente:= c.patente;
	a.aniof:= c.aniofab;
	a.color:= c.color;
	a.modelo:= c.modelo;
end;

procedure agregaradelante(var l: lista; a: autoacotado);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= a;
	nue^.sig:= l;
	l:= nue;
end;

procedure insertar2(var am:arbolmarca; c:auto; marca: cadena30);
var
	a:autoacotado;
begin
	if (am = nil) then begin
		new(am);
		am^.dato2.marca:= marca;
		am^.dato2.autos:= nil;
		crearregistro(a,c);
		agregaradelante(am^.dato2.autos,a);
		am^.hi:= nil;
		am^.hd:= nil;
	end
	else
		if (c.marca = am^.dato2.marca) then begin
			crearregistro(a,c);
			agregaradelante(am^.dato2.autos,a);
		end
		else
			if (c.marca < am^.dato2.marca) then 
				insertar2(am^.hi,c,marca)
			else
				insertar2(am^.hd,c,marca);
end;

procedure cargararbol(var a: arbol; var a2: arbolmarca);
var
	car:auto;
begin
	leerauto(car);
	while(car.marca <> 'MMM') do begin
		insertar(a,car);
		insertar2(a2,car,car.marca);
		leerauto(car);
	end;
end;

procedure incisob(a:arbol; marca: cadena30; var cantb: integer);
begin
	if (a <> nil) then begin
		incisob(a^.hi,marca,cantb);
		if (marca = a^.dato.marca) then
			cantb:= cantb + 1;
		incisob(a^.hd,marca,cantb);
	end;
end;

function buscar(a2: arbolmarca; marcac: cadena30): integer;
begin
	if (a2 = nil) then 
		buscar:= 0
	else
		if (marcac = a2^.dato2.marca) then 
			buscar:= buscar + 1
		else
			if (marcac > a2^.dato2.marca) then
				buscar:= buscar(a2^.hd,marcac)
			else
				buscar:= buscar(a2^.hi,marcac);
end;

procedure incisoc(a2:arbolmarca; marcac: cadena30);
var
	cantc: integer;
begin
	cantc:= 0;
	cantc:= buscar(a2,marcac);
	if (cantc = 0) then 
		writeln('Arbol vacio')
	else
		writeln(cantc);
end;

procedure inicializar(var v: vector);
var
	i: integer;
begin
	for i:= 2015 to 2024 do 
		v[i]:= nil;
end;

procedure agregaradelanteD(var l: lista; aut: autoacotado);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= aut;
	nue^.sig:= l;
	l:= nue;
end;

procedure incisod(a:arbol; var v: vector);
var
	autc:autoacotado;
begin
	if(a <> nil) then begin
		incisod(a^.hi,v);
		crearregistro(autc,a^.dato);
		agregaradelanteD(v[a^.dato.aniofab],autc);
		incisod(a^.hd,v);
	end;	
end;

function incisoe(a: arbol;patente: cadena30;modelo: cadena30):cadena30;
begin
	if (a <> nil) then begin
		if (a^.dato.patente = patente)then
			modelo:= a^.dato.modelo
		else
			if (patente >a^.dato.patente ) then 
				incisoe(a^.hd,patente,modelo)
			else
				incisoe(a^.hi,patente,modelo);
	end;
	incisoe:= modelo;
end;

procedure buscarenlista(l: lista; patente: cadena30; var color:cadena30);
begin
	while (l <> nil) do begin
		if(patente = l^.dato.patente) then 
			color:= l^.dato.color;
		l:= l^.sig;
	end;
end;

procedure incisof(a2:arbolmarca; patente2: cadena30; var color: cadena30);
begin
	if (a2 <> nil) then begin
		incisof(a2^.hi,patente2,color);
		buscarenlista(a2^.dato2.autos,patente2,color);
		incisof(a2^.hd,patente2,color);
	end;
end;

var
	a: arbol;
	a2: arbolmarca;
	marcab,marcac,patente1,patente2,modelo,color: cadena30;
	cant: integer;
	v: vector;
begin
	a:= nil;
	a2:= nil;
	cant:= 0;
	modelo:= 'vacio';
	color:= 'vacio';
	cargararbol(a,a2);
	readln(marcab);
	incisob(a,marcab,cant);
	readln(marcac);
	incisoc(a2,marcac);
	inicializar(v);
	incisod(a,v);
	readln(patente1);
	writeln(patente1,incisoe(a,patente1,modelo)); 
	readln(patente2);
	incisof(a2,patente2,color);
end.
