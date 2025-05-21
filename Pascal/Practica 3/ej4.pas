{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de consumo ilimitados (clientes que pagan por lo que consumen).
Para cada cliente se conoce su código de cliente y cantidad de líneas a su nombre.
De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos y la cantidad de MB consumidos en el mes. 
Se pide implementar un programa que lea los datos de los clientes de la compañía e informe el monto total a facturar para cada uno. 

Para ello, se requiere: 
a. Realizar un módulo que lea la información de una línea de teléfono. 
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el módulo desarrollado en el inciso a y retorne la cantidad total de minutos y la cantidad total de MB a facturar del cliente. 
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program cuatro;
type
	linea = record
		nro: integer;
		cantmin: real;
		cantmb: real;
	end;
	cliente = record
		codigo: integer;
		cantlineas: integer;
	end;
procedure leerlinea(var l: linea);
begin
	readln(l.cantmin);
	readln(l.cantmb);
	readln(l.nro);
end;

procedure leercliente(var c: cliente);
begin
	readln(c.cantlineas);
	readln(c.codigo);
end;

var
	l: linea;
	c: cliente;
	i,j: integer;
	mt, mbt: real;
begin
	mbt:= 0;
	mt:= 0;
	for i:= 1 to 9300 do
		leercliente(c);
		for j:= 1 to c.cantlineas do begin
			leerlinea(l);
			l.cantmin:= l.cantmin * 3.40;
			l.cantmb:= l.cantmb * 1.35; 
			mbt:= mbt + l.cantmb;
			mt:= mt + l.cantmin;
		end;
	writeln(mbt);
	writeln(mt);
end.
