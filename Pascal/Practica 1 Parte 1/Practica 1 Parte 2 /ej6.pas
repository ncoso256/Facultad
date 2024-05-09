program ejercicio6;
type
	codigos = 1..200;
var
	i, cantprod: integer;
	cod1,codigo, cod2: codigos;
	precio, pmin1, pmin2: real;
begin
	cantprod:= 0;
	cod1:= 200;
	cod2:= 200;
	pmin1:= 9999;
	pmin2:= 9999;
	for i:= 1 to 3 do begin
		writeln('ingrese un codigo: '); readln(codigo);
		writeln('ingrese un precio: '); readln(precio);
		if (precio < pmin1) then begin
			pmin2:= pmin1;
			pmin1:= precio;
			cod2:= cod1;
			cod1:= codigo;
		end
		else if(precio < pmin2) then begin
			pmin2:= precio;
			cod2:= codigo;
		end;
		if (codigo mod 2 = 0) and (precio > 16) then
		begin
			cantprod:= cantprod + 1;
		end; 
	end;
	writeln('Los codigos de los dos productos mas baratos son: ', cod1 ,' y ', cod2);
	writeln('La cantidad de productos de mas de 16 pesos con codigo par son: ',cantprod);
end.
