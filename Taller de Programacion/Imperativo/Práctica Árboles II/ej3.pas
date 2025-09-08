{
3. Implementar un programa modularizado para una librería. 

Implementar módulos para:

a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por código de producto. 
De cada producto deben quedar almacenados su código, la cantidad total de unidades vendidas y el monto total. 
De cada venta se lee código de venta, código del producto vendido cantidad de unidades vendidas y precio unitario. 
El ingreso de las ventas finaliza cuando se lee el código de venta -1.

b. Imprimir el contenido del árbol ordenado por código de producto.

c. Retornar el código de producto con mayor cantidad de unidades vendidas.

d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.

e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.

}

program tres;
type
	producto = record
		codigoprod: integer;
		canttotunivend: integer;
		montotot: real;
	end;
	venta = record
		codventa: integer;
		codprod: integer;
		cantunivend: integer;
		preciounit: real;
	end;
	arbol = ^nodo;
	nodo = record
		dato: producto;
		hi: arbol;
		hd: arbol;
	end;

procedure leerventa(var v: venta);
begin
	readln(v.codventa);
	if (v.codventa <> -1) then begin
		readln(v.codprod);
		readln(v.cantunivend);
		readln(v.preciounit);
	end;
end;

procedure armarproducto(var p: producto; v: venta);
begin
	p.codigoprod:= v.codprod;
	p.canttotunivend:= v.cantunivend;
	p.montotot:= v.cantunivend * v.preciounit;
end;

procedure insertar(var a: arbol; v: venta);
var
	p: producto;
begin
	if(a = nil) then begin
		new(a);
		armarproducto(p,v);
		a^.dato:= p;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if (v.codprod = a^.dato.codigoprod) then begin
			a^.dato.canttotunivend:= a^.dato.canttotunivend + v.cantunivend;
			a^.dato.montotot:= a^.dato.montotot + (v.cantunivend * v.preciounit);
		end
		else
			if (v.codprod < a^.dato.codigoprod) then
				insertar(a^.hi,v)
			else
				insertar(a^.hd,v);
end;

procedure cargararbol(var a: arbol);
var
	v: venta;
begin
	leerventa(v);
	while (v.codventa <> -1) do begin
		insertar(a,v);
		leerventa(v);
	end;
end;

procedure imprimirarbol(a: arbol);
begin
	if (a <> nil) then begin
		if (a^.hi <> nil) then
			imprimirarbol(a^.hi);
		writeln(a^.dato.codigoprod);
		writeln(a^.dato.canttotunivend);
		writeln(a^.dato.montotot);
		if (a^.hd <> nil) then
			imprimirarbol(a^.hd);
	end;
end;	

procedure incisob(a: arbol);
begin
	if (a = nil) then 
		writeln('Arbol vacio')
	else
		imprimirarbol(a);
end;

function obtenermaximocodigo(a: arbol): integer;
begin
	if (a = nil) then
		obtenermaximocodigo:= -1
	else
		if (a^.hd = nil) then
			obtenermaximocodigo:= a^.dato.codigoprod
		else
			obtenermaximocodigo:= obtenermaximocodigo(a^.hd);
end;

function obtenermaximocant(a: arbol): integer;
begin
	if (a = nil) then 
		obtenermaximocant:= -1
	else
		if (a^.hd = nil) then
			obtenermaximocant:= a^.dato.canttotunivend
		else
			obtenermaximocant:= obtenermaximocant(a^.hd);
end;

procedure incisoc(a: arbol);
var
	mayorcodigo,mayorcant: integer;
begin
	mayorcodigo:= obtenermaximocodigo(a);
	mayorcant:= obtenermaximocant(a);
	if (mayorcodigo = -1) and (mayorcant = -1) then 
		writeln('Arbol vacio')
	else begin
		writeln(mayorcodigo);
		writeln(mayorcant);
	end
end;

function cantidaddecodigosmenores(a: arbol;cod: integer): integer;

begin
	if (a = nil) then
		cantidaddecodigosmenores:= 0
	else
		if (a^.dato.codigoprod < cod) then
			cantidaddecodigosmenores:= 1 + cantidaddecodigosmenores(a^.hi,cod) + cantidaddecodigosmenores(a^.hd,cod)
		else
			cantidaddecodigosmenores:= cantidaddecodigosmenores(a^.hi,cod);
end;

procedure incisod(a: arbol);
var
	cantidad,codigo: integer;
begin
	readln(codigo);
	cantidad:= cantidaddecodigosmenores(a,codigo);
	writeln('La cantidad de codigos menores al codigo ', codigo, ' es: ', cantidad);
end;

function obtenermontototalentredoscodigos(a: arbol; codigo1,codigo2: integer): real;
begin
	if (a = nil) then
		obtenermontototalentredoscodigos:= 0
	else
		if (a^.dato.codigoprod >= codigo1) and (a^.dato.codigoprod <= codigo2) then 
			obtenermontototalentredoscodigos:= a^.dato.montotot + obtenermontototalentredoscodigos(a^.hi,codigo1,codigo2)+ obtenermontototalentredoscodigos(a^.hd,codigo1,codigo2)
		else
			obtenermontototalentredoscodigos:= 0;
end;

procedure incisoe(a: arbol);
var
	codigo1,codigo2: integer;
	montototal: real;
begin
	readln(codigo1);
	readln(codigo2);
	montototal:= obtenermontototalentredoscodigos(a,codigo1,codigo2);
	if (montototal = 0) then
		writeln('No hay codigos entre ', codigo1, ' y ', codigo2)
	else	
		writeln ('El monto total entre el codigo', codigo1, ' y el codigo : ', codigo2, ' es: ', montototal); 
end;

var
	a: arbol;
begin
	a:= nil;
	cargararbol(a);
	incisob(a);
	incisoc(a);
	incisod(a);
	incisoe(a);
end.
