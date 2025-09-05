{
4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. 
Considerar que puede haber más o menos de 20 productos del rubro 3. 
Si la cantidad de productos del rubro 3 es mayor a 20, almacenar los primeros 20 que están en la lista e ignore el resto.

d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.

e. Muestre los precios del vector resultante del punto d).

f. Calcule el promedio de los precios del vector resultante del punto d).
}
program cuatro;
const
	dimf = 8;
	dimf2 = 30; 
type
	rangorubro = 1..dimf;
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
	elementos = 1..dimf2;
	vector = array [rangorubro] of lista; 
	vector2 = array [elementos] of producto;
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
	while(act <> nil) and (act^.dato.codprod < p.codprod) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = l) then 
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure inicializarvector(var v: vector; var v2: vector2; var j: integer);
var
	i: integer;
begin
	for i:= 1 to dimf do 
		v[i]:= nil;
	if (j > 0) and (j < 20) then begin
		v2[j].codprod:= v[3]^.dato.codprod;
		v2[j].codrubro:= v[3]^.dato.codrubro;
		v2[j].precio:= v[3]^.dato.precio;
		while (j < dimf) do begin
			j:= j + 1;
			v2[j].codprod:= v[3]^.dato.codprod;
			v2[j].codrubro:= v[3]^.dato.codrubro;
			v2[j].precio:= v[3]^.dato.precio;
		end;
	end
	else begin
		v2[j].codprod:= v[i]^.dato.codprod;
		v2[j].codrubro:= v[i]^.dato.codrubro;
		v2[j].precio:= v[i]^.dato.precio;
		while (j < dimf) do begin
			j:= j + 1;
			v2[j].codprod:= v[i]^.dato.codprod;
			v2[j].codrubro:= v[i]^.dato.codrubro;
			v2[j].precio:= v[i]^.dato.precio;
		end;
	end;
end;

procedure recorrerlista(l: lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato.codprod);
		l:= l^.sig;
	end;
end;

procedure cargarvector(var v : vector;var diml: integer; var v2: vector2; var j: integer);
var
	p: producto;
	
begin
	inicializarvector(v,v2,j);
	leerproducto(p);
	while (p.precio <> 0) and (diml < dimf) do begin
		diml:= diml + 1;
		insertarordenado(v[p.codrubro],p);
		leerproducto(p);
	end;
	recorrerlista(v[p.codrubro]);
end;





procedure ordenarporseleccion(var v: vector2; diml: integer);
var
	i,j,pos: integer;
	item: producto;
begin
	for i:= 1 to diml-1 do begin
		pos:= i;
		for j:= i+1 to dimf do 
			if (v[j].precio < v[pos].precio) then 
				pos:= j;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;
end;

procedure informar(v: vector2; diml: integer);
var
	i,cant: integer;
	prom: real;
begin
	cant:= 0;
	prom:= 0;
	for i:= 1 to diml do begin
		writeln(v[i].precio);
		cant:= cant + 1;
		prom:= prom + v[i].precio;
	end;
	writeln(prom / cant);
end;

var
	v: vector;
	v2: vector2;
	diml,diml2: integer;
begin
	diml:= 0;
	diml2:= 0;
	cargarvector(v,diml,v2,diml2);
	ordenarporseleccion(v2,diml2);
	informar(v2,diml2);
end.
