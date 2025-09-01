{
Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:

a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce
el día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).

b. Un módulo que muestre el contenido del vector resultante del punto a).

c. Un módulo que ordene el vector de ventas por código.

d. Un módulo que muestre el contenido del vector resultante del punto c).

e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.

f. Un módulo que muestre el contenido del vector resultante del punto e).

g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.

h. Un módulo que muestre la información obtenida en el punto g)

}
program uno;
const
	max = 50;
type
	rangocodigoprod = 1..15;
	venta = record
		dia: integer;
		codigoprod: rangocodigoprod;
		cantvendida: integer;
	end;
	vector = array [1..max] of venta;
	vectordeproductos= array [rangocodigoprod] of integer; 
procedure leerventa(var v: venta);
begin
	writeln('ingrese el dia de la venta, o 0 en caso de no cargar mas ventas');
	readln(v.dia);
	if (v.dia <> 0) then begin
		v.codigoprod:= Random(15) + 1;
		writeln('Se genero el producto ', v.codigoprod);
		writeln('Ingrese la cantidad vendida');
		readln(v.cantvendida);
	end;
end;

procedure imprimirventa(v:venta);
begin
	writeln('Dia ', v.dia);
	writeln('Producto: ', v.codigoprod);
	writeln('Cantidad: ', v.cantvendida);
end;

procedure imprimirvector(v: vector; diml: integer);
var
	i: integer;
begin
	for i:= 1 to diml do
		imprimirventa(v[i]);
end;

procedure cargarventas(var v: vector; var diml: integer);
var
	vent: venta;
begin
	diml:= 0;
	Randomize;
	leerventa(vent);
	while (vent.dia <> 0)and (diml < max) do begin
		diml:= diml + 1;
		v[diml]:= vent;
		leerventa(vent);
	end; 
end;


procedure ordenarporcodigo(var v: vector; diml: integer);
var
	i,j,pos: integer;
	item: venta;
begin
	for i:= 1 to diml-1 do begin
		pos:= i;
		for j:= i + 1 to diml do
			if (v[j].codigoprod < v[pos].codigoprod) then
				pos:= j;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item; 
	end;
end;



procedure eliminarrango(var v: vector; var diml: integer; c1,c2: rangocodigoprod; var exito: boolean);
var
	i,j: integer;
begin
	i:= 1;
	j:= 1;
    while ((not((v[i].codigoprod < c1) and (v[i].codigoprod > c2))) and (i < diml)) do begin 
      exito:= false;
      i:= i+ 1;
    end;
	while ((v[i].codigoprod < c1) and (v[i].codigoprod > c2)) and (i < diml) do begin
	  exito:= true;
	  for j:= i to dimL - 1 do 
	    v[j]:= v[j+1];   
	  dimL:= dimL - 1;
	end;                                                         
end;                      
             
procedure inicializar(var v: vectordeproductos);
var
	i: integer;
begin
	for i:= 1 to 15 do
		v[i]:= 0;
end;

procedure procesarventas(vent: vector; diml: integer; var p: vectordeproductos);
var
	i,j: integer;
begin
	for j:= 1 to diml do begin
		for i:= 1 to 15 do begin
			if (i mod 2 = 0) then
				p[i]:= p[i] + vent[j].cantvendida;
		end;
	end;
end;

procedure imprimirproductos(p: vectordeproductos);
var
	i: integer;
begin
	for i:= 1 to 15 do
		writeln('La cantidad vendida en el codigo ',i, 'es de ', p[i]);
end;

var
	ventas: vector;
	diml: integer;
	cod1,cod2: rangocodigoprod;
	ok: boolean;
	productos: vectordeproductos;
begin
	cargarventas(ventas,diml);
	imprimirvector(ventas,diml);
	ordenarporcodigo(ventas,diml); 
	imprimirvector(ventas,diml);
	
	writeln('Ingrese el primer codigo, entre 1 y 15');
	readln(cod1);
	writeln('Ingrese el segundo codigo, entre 1 y 15');
	readln(cod2);
	eliminarrango(ventas,diml,cod1,cod2,ok);
	imprimirvector(ventas,diml);
	
	inicializar(productos);
	procesarventas(ventas,diml,productos);
	imprimirproductos(productos);
end.
