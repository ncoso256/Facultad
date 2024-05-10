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
