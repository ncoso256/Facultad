{8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de
transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año
2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia (1:
alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura no posee
orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que
las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar
ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales
el número de cuenta destino posea menos dígitos pares que impares.
}

program ej8p7;
type
	rangodia = 1..31;
	rangomes = 1..11;
	fec = record
		dia: rangodia;
		mes: rangomes;
	end;
	rangocod = 1..7;
	transferencia = record
		numcuentaorigen: integer;
		dnico: integer;
		numcuentadestino: integer;
		dnicd: integer;
		fecha: fec;
		hora: integer;
		monto: real;
		codmotivo: rangocod;
	end;
	lista = ^nodo;
	nodo = record
		dato: transferencia;
		sig: lista;
	end;
	vectorcontador = array[rangocod] of integer;
	
procedure cargarlista(var l: lista); // se dispone

procedure insertarordenado(var l2: lista; t: transferencia);
var
	act,ant,nue: lista;
begin
	new(nue);
	nue^.dato:= t;
	act:= l2;
	ant:= l2;
	while (act <> nil) and (t.numcuentaorigen > act^.dato.numcuentaorigen) do begin
		act:= ant;
		act:= act^.sig;
	end;
	if (act = ant) then
		l2:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure recorrerlista(l: lista; var l2: lista);
begin
	while (l <> nil) do begin
		if (l^.dato.dnico <> l^.dato.dnicd) do begin
			insertarordenado(l2,l^.dato);
		l:= l^.sig;
	end;
end;

procedure inicializarvc(var v: vectorcontador);
var
	i: integer;
begin
	for i:= 1 to 7 do
		v[i]:= 0;
end;

procedure max(var maxcant,maxcod: integer; cant: integer; cod: rangocod);
begin
	if (cant > maxcant) then begin
		maxcant:= cant;
		maxcod:= cod;
	end;
end;

procedure maximo(vc: vectorcontador);
var
	i: integer;
	cantmax: integer;
	codmax: integer;
begin
	cantmax:= -1;
	for i:= 1 to 7 do begin
		max(cantmax,codmax,vc[i],i);
	end;
	writeln(codmax);
end;

function menosparesqueimpares(num: integer):boolean;
var
	dig,pares,impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while (num <> 0) do begin
		dig:= num mod 10;
		if (dig mod 2 = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		num:= num div 10;
	end;
	menosparesqueimpares:= pares < impares; 
end;

procedure recorrerlista2(lis2: lista; var vc: vectorcontador);
var
	numorigenact,cant: integer;
	montototal: real;
begin
	inicializarvc(vc);
	cant:= 0;
	while (lis2 <> nil) do begin
		numorigenact:= lis2^.dato.numcuentaorigen;
		montototal:= 0;
		while (lis2 <> nil) and (numorigenact = lis2^.dato.numcuentaorigen) do begin
			montototal:= montototal + lis2^.dato.monto;
			vc[lis2^.dato.codmotivo]:= vc[lis2^.dato.codmotivo] + 1;
			if (lis2^.dato.fecha.mes = 6) and (menosparesqueimpares(lis2^.dato.numcuentadestino)) then
				cant:= cant + 1;
			lis2:= lis2^.sig;
		end;
		writeln(montototal);
	end;
	maximo(vc);
	writeln(cant);
end;

var
	l,l2: lista;
begin
	l2:= nil;
	cargarlista(l); // se dispone
	recorrerlista(l,l2);
	recorrerlista2(l2);
end.
