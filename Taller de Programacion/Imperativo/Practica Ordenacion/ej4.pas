{
4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.

d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.

e. Muestre los precios del vector resultante del punto d).

f. Calcule el promedio de los precios del vector resultante del punto d).
}
program cuatro;
type
	rangorubro = 1..8;
	producto = record
		codprod: integer;
		codrubro: rangorubro;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	vector = array [1..30] of lista; {Realmente no se como se hace esto}

procedure leerproducto(var p: producto);
begin
	readln(p.codprod);
	readln(p.codrubro);
	readln(p.precio);
end;

procedure insertarordenado(var l: lista; p: producto);
var
	nue,ant,act: lista;
begin
	new(nue);
	nue^.dato:= p;
	act:= l;
	while(act <> nil) and (act^.dato.codprod < p.prod) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = l) then 
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarlista(var l: lista);
var
	p: producto;
begin
	repeat
		leerproducto(p);
		insertarordenado(l,p);
	until(p.precio = 0);
end;

procedure recorrerlista(l: lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato.codprod);
		l:= l^.sig;
	end;
end;

var
	l: lista;
begin
	l:= nil;
	cargarlista(l);
	recorrerlista(l);
end.
