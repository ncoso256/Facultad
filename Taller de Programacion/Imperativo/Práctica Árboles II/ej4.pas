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
	
	regf = record
		isbn: integer;
		acuisbn: integer;
	end;
	
	arbol3 = ^nodo3;
	nodo3 = record
		dato3: regf;
		hi: arbol3;
		hd: arbol3;
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
		if (isbn = a2^.dato2.isbn) then begin
			crearregistro(p,p2);
			agregaradelante(a2^.dato2.presac,p2);
		end
		else
			if (isbn < a2^.dato2.isbn) then
				insertar2(a2^.hi,p,isbn)
			else
				insertar2(a2^.hd,p,isbn);
end;	

procedure insertar3(var a3: arbol3; isbn: integer);
var
	r3:regf;
begin
	if (a3 = nil) then begin
		new(a3);
		r3.isbn:= isbn;
		r3.acuisbn:= 0;
		a3^.dato3:= r3;
		a3^.hi:= nil;
		a3^.hd:= nil; 
	end
	else
		if (r3.isbn = a3^.dato3.isbn) then
			r3.acuisbn:= r3.acuisbn + 1
		else
			if (r3.isbn < a3^.dato3.isbn) then 
				insertar3(a3^.hi,isbn)
			else
				insertar3(a3^.hd,isbn);
end;

procedure cargararbol(var a: arbol; var a2: arbol2; var a3: arbol3);
var
	p: prestamo;
begin
	leerprestamo(p);
	while (p.isbnlibro <> 0) do begin
		insertar(a,p);
		insertar2(a2,p,p.isbnlibro);
		insertar3(a3,p.isbnlibro);
		leerprestamo(p);
	end;
end;

function obtenermaxisbn(a: arbol): integer;
begin
	if (a^.HD<> nil) then 
		obtenermaxisbn:=obtenermaxisbn(a^.HD)
	else
		 obtenermaxisbn:=a^.datoarbol.isbnlibro;
end;

procedure incisob(a: arbol);
var
	isbngrande: integer;
begin
	isbngrande:= -1;
	isbngrande:= obtenermaxisbn(a);
	if (isbngrande = -1) then 
		writeln('Arbol vacio')
	else
		writeln(isbngrande);
end;

function obtenerminisbn(a2: arbol2): integer;
begin
	if (a2 <> nil) then 
		obtenerminisbn:= obtenerminisbn(a2^.hi)
	else
		obtenerminisbn:= a2^.dato2.isbn;
end;

procedure incisoc(a2: arbol2);
var
	isbnchico: integer;
begin
	isbnchico:= 9999;
	isbnchico:= obtenerminisbn(a2);
	if (isbnchico = 9999) then 
		writeln('Arbol vacio')
	else
		writeln(isbnchico);
end;

function obtenercantprestamos(a:arbol; numsocio: integer): integer;
begin
	if (a = nil) then 
		obtenercantprestamos:= 0
	else
		if (numsocio = a^.datoarbol.numsocio) then 
			obtenercantprestamos:= 1 + obtenercantprestamos(a^.hi,numsocio)+ obtenercantprestamos(a^.hd,numsocio)
		else
			obtenercantprestamos:= obtenercantprestamos(a^.hi,numsocio)+obtenercantprestamos(a^.hd,numsocio);
end;

procedure incisod(a:arbol);
var
	cantprestamos: integer;
begin
	cantprestamos:= obtenercantprestamos(a,a^.datoarbol.numsocio);
	if (cantprestamos = 0) then 
		writeln('Arbol vacio')
	else
		writeln(cantprestamos);
end;

function obtenercantprestamos2(a2: arbol2;numsocio: integer): integer;
begin
	if (a2 = nil) then
		obtenercantprestamos2:= 0
	else
		if (numsocio = a2^.dato2.presac^.dato.numsocio) then 
			obtenercantprestamos2:= 1 + obtenercantprestamos2(a2^.hi,numsocio) + obtenercantprestamos2(a2^.hd,numsocio)
		else
			obtenercantprestamos2:= obtenercantprestamos2(a2^.hi,numsocio) + obtenercantprestamos2(a2^.hd,numsocio);
end;

procedure incisoe(a2:arbol2);
var
	cantprestamos2: integer;
begin
	cantprestamos2:= obtenercantprestamos2(a2,a2^.dato2.presac^.dato.numsocio);
	if (cantprestamos2 = 0) then
		writeln('Arbol vacio')
	else
		writeln(cantprestamos2);
end;

procedure incisof(a: arbol; a3:arbol3);
begin
	if (a <> nil) and (a3 <> nil) then begin
		incisof(a^.hi,a3^.hi);
		if (a^.datoarbol.isbnlibro = a3^.dato3.isbn) then 
			a3^.dato3.acuisbn:= a3^.dato3.acuisbn + 1;
		writeln(a3^.dato3.isbn);
		incisof(a^.hd,a3^.hd);
	end;
	writeln(a3^.dato3.acuisbn);
end;

procedure incisog(a2: arbol2; var canttotal: integer);
begin
	if (a2 <> nil) then begin
		canttotal:= canttotal + 1;
		writeln(a2^.dato2.isbn);
		incisog(a2^.hi,canttotal);
		incisog(a2^.hd,canttotal);
	end;
	writeln(canttotal);
end;

procedure recorrerlista(l: lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato.numsocio);
		writeln(l^.dato.dia);
		writeln(l^.dato.mes);
		writeln(l^.dato.cantdiasprest);
	end;
end;

procedure incisoh(a2: arbol2; ct: integer);
begin
	if (a2 <> nil) then begin
		incisoh(a2^.hi,ct);
		recorrerlista(a2^.dato2.presac);
		writeln(a2^.dato2.isbn);
		writeln(ct);
		incisoh(a2^.hd,ct);
	end;
end;

function obtenercanttotalprestamos(a: arbol; v1,v2: integer): integer;
begin
	if (a = nil) then
		obtenercanttotalprestamos:= 0
	else
		if (a^.datoarbol.isbnlibro >= v1) and (a^.datoarbol.isbnlibro <= v2) then
			obtenercanttotalprestamos:= 1+ obtenercanttotalprestamos(a^.hi,v1,v2) + obtenercanttotalprestamos(a^.hd,v1,v2)
		else
			obtenercanttotalprestamos:= obtenercanttotalprestamos(a^.hi,v1,v2) + obtenercanttotalprestamos(a^.hd,v1,v2);
end;

procedure incisoi(a: arbol);
var
	canttotalprestamos,valor1,valor2: integer;
begin
	readln(valor1);
	readln(valor2);
	canttotalprestamos:= obtenercanttotalprestamos(a,valor1,valor2);
	if (canttotalprestamos = 0) then 
		writeln('Arbol vacio')
	else
		writeln(canttotalprestamos);
end;

function octprestamos(a2: arbol2; v1,v2: integer): integer;
begin
	if (a2 = nil) then
		octprestamos:= 0
	else
		if (a2^.dato2.isbn >= v1) and (a2^.dato2.isbn <= v2) then 
			octprestamos:= 1+ octprestamos(a2^.hi,v1,v2) + octprestamos(a2^.hd,v1,v2)
		else
			octprestamos:= octprestamos(a2^.hi,v1,v2) + octprestamos(a2^.hd,v1,v2);
end;

procedure incisoj(a2: arbol2);
var
	ctprestamos,val1,val2: integer;
begin
	readln(val1);
	readln(val2);
	ctprestamos:= octprestamos(a2,val1,val2);
	if (ctprestamos = 0) then 
		writeln('Arbol vacio')
	else
		writeln(ctprestamos);
end;

var
	a: arbol;
	a2: arbol2;
	a3:arbol3;
	canttotal:integer;
begin
	a:= nil;
	a2:= nil;
	a3:= nil;
	canttotal:= 0;
	cargararbol(a,a2,a3);
	incisob(a);
	incisoc(a2);
	incisod(a);
	incisoe(a2);
	incisof(a,a3);
	incisog(a2,canttotal);
	incisoh(a2,canttotal);
	incisoi(a);
	incisoj(a2);
end.

