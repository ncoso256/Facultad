program cinco;
type
	
	producto = record
		cod: integer;
		des: string;
		stocka: integer;
		stockm: integer;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		datos: producto;
		sig: lista;
	end;

procedure leerproducto(var p: producto);
begin
	readln(p.cod);
	if (p.cod <> -1) then begin
		readln(p.des);
		readln(p.stocka);
		readln(p.stockm);
		readln(p.precio);
	end;
end;

procedure agregaradelante(var l: lista; p: producto);
var
	nue: lista;
begin
	new(nue); {creo un nodo}
	nue^.datos:= p; {cargo el dato}
	nue^.sig:= l; {realizo el enlace}
	l:= nue; {actualizo el primero}
end;

procedure cargarlista(var l: lista);
var
	p: producto;
begin
	leerproducto(p);
	while (p.cod <> -1) do begin
		agregaradelante(l,p);
		leerproducto(p);
	end;
end;


function pares (cod: integer; desc: string): boolean;
var
	dig,par: integer;
begin
	par:= 0;
	while (cod <> 0) do begin
		dig:= cod mod 10;
		if (dig mod 2 = 0) then
			par:= par + 1;
		cod:= cod div 10;
	end;
	pares:= (par >= 3);
end;

procedure minimo (cod: integer; prec: real; var min1,min2: integer; var precio1,precio2: real);
begin
	if (prec < precio1) then begin
		precio2:= precio1;
		precio1:= prec;
		min2:= min2;
		min1:= cod;
	end
	else if (prec < precio2) then begin
		precio2:= prec;
		min2:= cod;
	end;
end;

procedure recorrerlista(l: lista);
var
	cantprod,menorstock,min1,min2: integer;
	prec1,prec2: real;
begin
	prec1:= 9999; prec2:= 9999;
	cantprod:= 0; menorstock:= 0;
	while (l <> nil) do begin
		cantprod:= cantprod + 1;
		if (l^.datos.stocka < l^.datos.stockm) then
			menorstock:= menorstock + 1;
		if (pares(l^.datos.cod,l^.datos.des)) then //b
			writeln(l^.datos.des)
		else
			writeln('no tiene tres digitos pares');
		minimo(l^.datos.cod,l^.datos.precio,min1,min2,prec1,prec2); //c
		l:= l^.sig;
	end;
	writeln(min1);
	writeln(min2);
	writeln(menorstock*100/cantprod:0:2); // a
end;


var
	l: lista;
	
begin
	l:= nil;
	cargarlista(l);
	recorrerlista(l);
end.
