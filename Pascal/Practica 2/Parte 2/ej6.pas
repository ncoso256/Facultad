{6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. 
Para cada producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.).

Informar: 
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro. 
● Precio promedio.}

program ej6;

procedure leerproducto(var precio: real ; var codigo: integer ; var tipo: string ); {leer por referencia si o si para utilizar en el for}
begin
	writeln('Escriba el precio del producto: '); readln(precio);
	writeln('Escriba el codigo del producto: '); readln(codigo);
	writeln('Escriba el tipo de producto: '); readln(tipo);
end;

procedure codsmasbaratos(cod: integer; precio: real;var cod1, cod2: integer ;var min1, min2: real);
begin
	if (precio < min1) then begin
		min2:= min1;
		cod2:= cod1;
		min1:= precio;
		cod1:= cod;
	end
	else 
		if(precio < min2) then begin
			min2:= precio;
			cod2:= cod; 
		end;
end;

procedure codpantaloncaro(c: integer; tip: string; precio: real; var codimax: integer ; var premax: real);
begin
	if (tip = 'pantalon') then begin
		if (precio > premax) then begin
			premax:= precio;
			codimax:= c;
		end;
	end;
end;

function precioprom (sumprecios, p: real): real;
begin
	precioprom:= (sumprecios + p) / 5; {100 seria la cantidad}
end;

var
	precio, pmin1, pmin2, preciomax, sumaprecios: real;
	codigo, codmin1, codmin2, codmax, cant: integer;
	tipo: string;
	i: integer;
begin
	cant:= 0;
	sumaprecios:= 0;
	preciomax:= -9999;
	codmax:= -9999;
	pmin1:= 9999;
	pmin2:= 9999;
	codmin1:= 9999;
	codmin2:= 9999;
	for i:= 1 to 5 do begin {1 to 100}
		leerproducto(precio,codigo,tipo);
		codsmasbaratos(codigo, precio, codmin1, codmin2, pmin1, pmin2);
		codpantaloncaro(codigo, tipo, precio, codmax, preciomax);
	end;
	writeln('El codigo de los 2 productos mas baratos es: ', codmin1 ,' y ', codmin2);
	writeln('El codigo del pantalon mas caro es: ', codmax);
	writeln('El precio promedio es de: ' , precioprom(sumaprecios,precio):0:2);	
end.
