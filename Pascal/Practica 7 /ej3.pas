program ej3p7;
type
	viaje = record
		nro: integer;
		cod: integer;
		direcciono: string;
		direcciond: string;
		km: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;

	lista2 = ^nodo2;
	nodo2 = record
		dato: viaje;
		sig: lista2;
	end;

procedure leerviaje(var v: viaje);
begin
	readln(v.cod);
	if (v.cod <> -1) then begin
		readln(v.nro);
		readln(v.direcciono);
		readln(v.direcciond);
		readln(v.km);
	end;
end;

procedure insertarordenado(var l: lista; v: viaje);
var
	actual,anterior,nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= v;
	nuevo^.sig:= nil;
	
	actual:= l;
	anterior:= l;
	while ((actual <> nil) and (v.cod > actual^.dato.cod)) do begin
		anterior:= actual;
		actual:= actual^.sig;
	end;
	if (anterior = actual) then
		l:= nuevo
	else
		anterior^.sig:= nuevo;
	nuevo^.sig:= actual;
end;

procedure cargarlista(var l: lista); // se dispone
var
	v: viaje;
begin
	leerviaje(v);
	while (v.cod <> -1) do begin
		insertarordenado(l,v);
		leerviaje(v);
	end;
end;

function esviajemas5km(km: real): boolean;
begin
	esviajemas5km:= (km > 5);
end;

procedure actualizarmax(cod: integer; km: real; var max1,max2: real; codmax1,codmax2: integer);
begin
	if (km > max1) then begin
		max2:= max1;
		max1:= km;
		codmax2:= codmax1;
		codmax1:= cod;
	end
	else if (km > max2) then begin
		max2:= km;
		codmax2:= cod;
	end;
end;

procedure insertarordenado2(var l2: lista2; v: viaje);
var
	nue: lista2;
	ant,act: lista2;
begin
	new(nue);
	nue^.dato:= v;
	nue^.sig:= nil;
	
	act:= l2;
	ant:= l2;
	while ((act <> nil) and (v.km > act^.dato.km)) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		l2:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure recorrerlista(l: lista; var l2: lista2);
var
	codactual: integer;
	max1,max2: real;
	codmax1,codmax2: integer;
	kmrecorridos: real;
begin
	max1:=-1; max2:=-1;
	codmax1:= 0; codmax2:= 0; 
	while (l<> nil) do begin
		codactual := l^.dato.cod;
		kmrecorridos:= 0;
		while (l<> nil) and (l^.dato.cod = codactual) do begin
			kmrecorridos := kmrecorridos + l^.dato.km;
				
			if (esviajemas5km(l^.dato.km)) then
				insertarordenado2(l2,l^.dato);
			l:= l^.sig;
		end;
		actualizarmax(codactual,kmrecorridos,max1,max2,codmax1,codmax2);
	end;
	writeln(codmax1);
	writeln(codmax2);
end;

var
	l: lista;
	l2: lista2;
begin
	l:= nil;
	l2:= nil;
	cargarlista(l); // se dispone
	recorrerlista(l,l2);
end.
