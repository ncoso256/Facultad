{
TURNO D - TEMA 2 — Módulo Imperativo — 12/09/2023

IMPORTANTE: Cree un programa en Pascal. 
 Utilice su apellido como nombre del programa y del archivo .pas, y guárdelo en el Escritorio de su computadora.

Aerolíneas Argentinas necesita procesar los pasajes vendidos durante 2023. De cada pasaje se conoce el código de vuelo,
 código del cliente, código ciudad destino y monto del pasaje.

a) Implementar un módulo que lea pasajes, genere y retorne una estructura adecuada para la búsqueda por código de ciudad destino, 
donde para cada código de ciudad de destino se almacenan juntos todos los pasajes (código de vuelo, código de cliente y monto del pasaje).
La lectura finaliza con el monto de pasaje 0. Se sugiere utilizar el módulo leerPasaje().

b) Implementar un módulo que reciba la estructura generada en a) y un código de ciudad destino y retorne todos los pasajes hacia esa ciudad destino.

c) Realizar un módulo que reciba la estructura generada en a) y retorne el código de ciudad de destino con mayor monto total de pasajes vendidos.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
}

program hola;
type
	pasaje = record
		codvuelo: integer;
		codcliente: integer;
		codciudaddes: integer;
		montopasaje: real;
	end;
	pasajecorto = record
		codvuelo: integer;
		codcliente: integer;
		montopasaje: real;
	end;
	
	lista = ^nodolista;
	nodolista = record
		dato: pasajecorto;
		sig: lista;
	end;
	
	pasajecort = record
		vuelo: lista;
		codciudad: integer;  
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: pasajecort;
		hi: arbol;
		hd: arbol;
	end;

procedure leerpasaje(var p: pasaje);
begin
	p.montopasaje:= random(9999)/(random(10)+1);
	if (p.montopasaje <> 0) then begin
		p.codvuelo:= random(7000);
		p.codcliente:= random(100)+1;
		p.codciudaddes:= random(500) + 1;
	end;   
end;

procedure crearregistro(var r: pasajecorto; p:pasaje);
begin
	r.codvuelo:= p.codvuelo;
	r.codcliente:= p.codcliente;
	r.montopasaje:= p.montopasaje;
end;

procedure agregaradelante(var l: lista; r:pasajecorto);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= r;
	nue^.sig:= l;
	l:= nue;
end;

procedure insertar(var a: arbol; p: pasaje; codciudad: integer);
var
	r: pasajecorto;
begin
	if (a = nil) then begin
		new(a);
		a^.dato.codciudad:= codciudad;
		a^.dato.vuelo:= nil;
		crearregistro(r,p);
		agregaradelante(a^.dato.vuelo, r);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if (p.codciudaddes = a^.dato.codciudad) then begin
			crearregistro(r,p);
			agregaradelante(a^.dato.vuelo, r);
		end
		else
			if (p.codciudaddes < a^.dato.codciudad) then 
				insertar(a^.hi,p,codciudad)
			else
				insertar(a^.hd,p,codciudad);
		
end;

procedure cargararbol(var a: arbol);
var
	p: pasaje;
begin
	leerpasaje(p);
	while(p.montopasaje <> 0) do begin
		insertar(a,p,p.codciudaddes);
		leerpasaje(p);
	end;
end;

function contarnodos(l:lista): integer;
begin
	if (l = nil) then
		contarnodos:= 0
	else
		contarnodos:= 1 + contarnodos(l^.sig);
end;

function incisob(a: arbol;cod: integer):integer;
begin
	if (a = nil) then
		incisob:= 0
	else
		if (a^.dato.codciudad = cod) then
			incisob:= contarnodos(a^.dato.vuelo)
		else
			incisob:= incisob(a^.hi,cod)+ incisob(a^.hd,cod)
end;

function obtenermaxpasajes(a: arbol;acumula: real): real;
begin
	if (a^.hd <> nil) then 
		obtenermaxpasajes:= obtenermaxpasajes(a^.hd,acumula)
	else
		obtenermaxpasajes:= acumula;
end;

function obtenermaxcod(a: arbol):integer;
begin
	if (a^.hd <> nil) then 
		obtenermaxcod:= obtenermaxcod(a^.hd)
	else
		obtenermaxcod:= a^.dato.codciudad;
end;

function contador(l: lista): real;
var
	cont: real;
begin
	cont:= 0;
	while (l <> nil) do begin
		cont:= cont + l^.dato.montopasaje;
		l:= l^.sig;
	end;
	contador:= cont;
end;

function obtenermontotot(a: arbol):real;
begin
	if (a <> nil) then begin
		obtenermontotot(a^.hi);
		obtenermontotot:= contador(a^.dato.vuelo);
		obtenermontotot(a^.hd);
	end;
end;	

procedure incisoc(a: arbol);
var
	maxcod: integer;
	maxpasajes,acu: real;
begin
	maxpasajes:= -1;
	maxcod:= -1;
	acu:= 0;
	acu:= obtenermontotot(a);
	maxpasajes:= obtenermaxpasajes(a,acu);
	maxcod:= obtenermaxcod(a);
	if (maxpasajes = -1) and (maxcod = -1) then
		writeln('Arbol vacio')
	else begin
		writeln(maxpasajes);
		writeln(maxcod);
	end;
end;

var
	a: arbol;
	codigo: integer;
begin
	a:= nil;
	randomize;
	cargararbol(a);
	readln(codigo);
	writeln(incisob(a,codigo));
	incisoc(a);
end.
