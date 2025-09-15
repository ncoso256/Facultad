{
3. PlayStation Store requiere procesar las compras realizadas por sus clientes durante el año
2023.

a) Implementar un módulo que lea compras de videojuegos. De cada compra se lee
código del videojuego, código de cliente y mes. La lectura finaliza con el código de
cliente 0. Se sugiere utilizar el módulo leerCompra(). El módulo debe retornar un árbol
binario de búsqueda ordenado por código de videojuego. En el árbol, para cada código
de videojuego debe almacenarse una lista con código de cliente y mes perteneciente a
cada compra.

b) Implementar un módulo que reciba el árbol generado en a) y un código de videojuego.
El módulo debe retornar la lista de las compras de ese videojuego.

c) Implementar un módulo recursivo que reciba la lista generada en b) y un mes. El
módulo debe retorne la cantidad de clientes que compraron en el mes ingresado.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.


type
	compra = record
		cod_videojuego : integer;
		cod_cliente : integer;
		mes : integer;
	end;
procedure leerCompra (var c : compra);
begin
	c.cod_cliente := Random(200);
	if (c.cod_cliente <> 0)
	then begin
		c.mes := Random(12) + 1;
		c.cod_videojuego := Random(200) + 1000;
	end;
end
}

program tres;
const
	corte = 0;
type
	rangomes = 1..12;
	compra = record
		codjuego:integer;
		codcliente: integer;
		mes: rangomes;
	end;
	
	compraacotada = record
		codcliente: integer;
		mes: rangomes;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: compraacotada;
		sig: lista;
	end;
	
	datoarbol = record
		compras: lista;
		codjuego: integer;
	end;
	
	arbol = ^nodoa;
	nodoa = record
		dato: datoarbol;
		hi: arbol;
		hd: arbol;
	end;
	
procedure leercompra(var c: compra);
begin
	c.codcliente:= random(200);
	if (c.codcliente <> corte) then begin
		c.codjuego:= random(200) + 1000;
		c.mes:= random(12) + 1;
	end;
end;

procedure crearregistro(c:compra; var cac:compraacotada);
begin
	cac.codcliente:= c.codcliente;
	cac.mes:= c.mes;
end;

procedure agregaradelante(var l: lista; cac:compraacotada);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= cac;
	nue^.sig:= l;
	l:= nue;
end;

procedure insertar(var a: arbol; c: compra; codjuego:integer);
var
	cac: compraacotada;
begin
	if (a = nil) then begin
		new(a);
		a^.dato.codjuego:= codjuego;
		a^.dato.compras:= nil;
		crearregistro(c,cac);
		agregaradelante(a^.dato.compras,cac);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if (c.codjuego = a^.dato.codjuego) then begin
			crearregistro(c,cac);
			agregaradelante(a^.dato.compras,cac);
		end
		else
			if (c.codjuego < a^.dato.codjuego) then 
				insertar(a^.hi,c,codjuego)
			else
				insertar(a^.hd,c,codjuego);
end;

procedure cargararbol(var a: arbol);
var
	c: compra;
begin
	leercompra(c);
	while(c.codcliente <> corte) do begin
		insertar(a,c,c.codjuego);
		leercompra(c);
	end;
end;

procedure informarlista(var l: lista);
begin
	while(l <> nil) do begin
		writeln(l^.dato.codcliente);
		writeln(l^.dato.mes);
		l:= l^.sig;
	end;
end;

procedure incisob(a: arbol; codjuego:integer);
begin
	if (a <> nil) then begin
		incisob(a^.hi,codjuego);
		if (codjuego = a^.dato.codjuego)then 
			informarlista(a^.dato.compras);
		incisob(a^.hd,codjuego);
	end;
end;

procedure incisoc(l: lista; mes: rangomes; var cant: integer);
begin
	cant:= 0;
	if (l <> nil) then begin
		if (mes = l^.dato.mes)then
			cant:= cant + 1;
		incisoc(l^.sig,mes,cant);
	end;
end;
var
	a: arbol;
	codjuego: integer;
	mes: rangomes;
	l: lista;
	cant: integer;
begin
	a:= nil;
	randomize;
	cargararbol(a);
	readln(codjuego);
	incisob(a,codjuego);
	readln(mes);
	incisoc(l,mes,cant);
	writeln(cant);
end.

