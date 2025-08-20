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
	while (vent.dia <> 0) do begin
		diml:= diml + 1;
		v[diml]:= vent;
		leerventa(vent);
	end; 
end;


procedure ordenarporcodigo(var v: vector; diml: integer);
var
	i,j,pos: integer;
	item: rangocodigoprod;
begin
	for i:= 1 to diml-1 do begin
		pos:= i;
		for j:= i + 1 to diml do
			if (v[j].codigoprod < v[pos].codigoprod) then
				pos:= j;
		item:= v[pos].codigoprod;
		v[pos]:= v[i];
		v[i].codigoprod:= item; 
	end;
end;

function buscarpos(v: vector; diml: integer; codigo1,codigo2: rangocodigoprod):integer;
var
	pos: integer;
begin
	pos:= 1;
	while ((pos <= diml) and (v[pos].codigoprod < codigo1) and (v[pos].codigoprod < codigo2)) do
		pos:= pos + 1;
	if ((pos <= diml) and ((v[pos].codigoprod = codigo1) or (v[pos].codigoprod = codigo2)) )then 
		buscarpos:= pos
	else
		buscarpos:= 0;
end;

procedure eliminarventas(var v: vector; var diml: integer; c1,c2: rangocodigoprod; var exito: boolean);
var
	i,pos: integer;
begin
	pos:= buscarpos(v,diml,c1,c2);
	exito:= (pos > 0);
	if (exito) then begin
		for i:= pos + 1 to diml-1 do
			v[i-1]:= v[i];
		diml:= diml - 1;
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
	eliminarventas(ventas,diml,cod1,cod2,ok);
	imprimirvector(ventas,diml);
	
	inicializar(productos);
	procesarventas(ventas,diml,productos);
	imprimirproductos(productos);
end.
