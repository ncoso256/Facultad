{
4. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. 

Implementar un programa con:

a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.

	i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
	insertarlos a la derecha.

	ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
	(prestar atención sobre los datos que se almacenan).

b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.

c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.

d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.

e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.

f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.

g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.

h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.

i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).

j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
}

program ej4;
type
	rangodia = 1..31;
	rangomes = 1..12;
	prestamo = record
		isbnlibro: integer;
		numsocio: integer;
		dia: rangodia;
		mes: rangomes;
		cantdiasprest: integer;
	end;
	
	prestamocorto = record
		numsocio: integer;
		dia: rangodia;
		mes: rangomes;
		cantdiasprest: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: prestamocorto;
		sig: lista;
	end;
	
	prestamoac = record
		presac: lista;
		isbn: integer;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol= record
		datoarbol: prestamo;
		hi: arbol;
		hd: arbol;
	end;
	arbol2 = ^nodoarbol2;
	nodoarbol2 = record
		dato2: prestamoac;
		hi: arbol2;
		hd: arbol2;
	end;

procedure leerprestamo(var p: prestamo);
begin
	readln(p.isbnlibro);
	if (p.isbnlibro <> 0) then begin
		readln(p.numsocio);
		readln(p.numsocio);
		readln(p.dia);
		readln(p.mes);
		readln(p.cantdiasprest);
	end;
end;	

procedure insertar(var a: arbol; p: prestamo);
begin
	if (a = nil) then begin
		new(a);
		a^.datoarbol:= p;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if (p.isbnlibro = a^.datoarbol.isbnlibro) then 
			a^.datoarbol:= p
		else
			if (p.isbnlibro < a^.datoarbol.isbnlibro) then 
				insertar(a^.hi, p)
			else
				insertar(a^.hd,p);
				
end;

procedure agregaradelante(var l: lista; p2: prestamocorto);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p2;
	nue^.sig:= l;
	l:= nue;
end;

procedure crearregistro(p: prestamo; var p2: prestamocorto);
begin
	p2.numsocio:= p.numsocio;
	p2.dia:= p.dia;
	p2.mes:= p.mes;
	p2.cantdiasprest:= p.cantdiasprest;
end;

procedure insertar2(var a2:arbol2; p:prestamo; isbn:integer);
var
	p2: prestamocorto;
begin
	if (a2 = nil) then begin
		new(a2);
		a2^.dato2.isbn:= isbn;
		a2^.dato2.presac:= nil;
		crearregistro(p,p2);
		agregaradelante(a2^.dato2.presac,p2);
		a2^.hi:= nil;
		a2^.hd:= nil;
	end
	else
		if (isbn = a2^.dato2.isbn) then
			agregaradelante(a2^.dato2.presac,p2)
		else
			if (isbn < a2^.dato2.isbn) then
				insertar2(a2^.hi,p,isbn)
			else
				insertar2(a2^.hd,p,isbn);
end;	

procedure cargararbol(var a: arbol; var a2: arbol2);
var
	p: prestamo;
begin
	leerprestamo(p);
	while (p.isbnlibro <> 0) do begin
		insertar(a,p);
		insertar2(a2,p,p.isbnlibro);
		leerprestamo(p);
	end;
end;

function obtenermaxisbn(a: arbol): integer;
begin
	if (a = nil) then 
		obtenermaxisbn:= -1
	else
		if (a^.hd = nil) then 
			obtenermaxisbn:= a^.datoarbol.isbnlibro
		else
			obtenermaxisbn:= obtenermaxisbn(a^.hd);
end;

procedure incisob(a: arbol);
var
	isbngrande: integer;
begin
	isbngrande:= obtenermaxisbn(a);
	if (isbngrande = -1) then 
		writeln('Arbol vacio')
	else
		writeln(isbngrande);
end;

function obtenerminisbn(a2: arbol2): integer;
begin
	if (a2 = nil) then 
		obtenerminisbn:= 9999
	else
		if (a2^.hi = nil) then 
			obtenerminisbn:= a2^.dato2.isbn
		else
			obtenerminisbn:= obtenerminisbn(a2^.hi);
end;

procedure incisoc(a2: arbol2);
var
	isbnchico: integer;
begin
	isbnchico:= obtenerminisbn(a2);
	if (isbnchico = 9999) then 
		writeln('Arbol vacio')
	else
		writeln(isbnchico);
end;

procedure incisod(a:arbol);
begin

end;

procedure incisoe(a2:arbol2);
begin

end;

procedure incisof(a: arbol);
begin

end;

procedure incisog(a2: arbol2);
begin

end;

procedure incisoh(a2: arbol2);
begin

end;

procedure incisoi(a: arbol);
begin

end;

procedure incisoj(a2: arbol);
begin

end;

var
	a: arbol;
	a2: arbol2;
begin
	a:= nil;
	a2:= nil;
	cargararbol(a,a2);
	incisob(a);
	incisoc(a2);
	incisod(a);
	incisoe(a2)
	incisof(a);
	incisog(a2);
	incisoh(a2);
	incisoi(a);
	incisoj(a2);
end.

{falta completar}
