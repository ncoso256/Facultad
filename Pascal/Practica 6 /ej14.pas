program ej14p6;
const
	corte = -1;
	canttransporte = 5;
type
	reg_fecha = record
		dia,mes: integer;
	end;
	rangocod = -1..1300;
	viaje = record
		codalumno: rangocod;
		fecha: reg_fecha;
		facultad: string;
		mediodetransporte: array [1..canttransporte] of integer;
	end;
	
	vectorprecios = array [1..canttransporte] of real;
	
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;


procedure leerviaje(var v: viaje);
var
	i: integer;
begin
	readln(v.codalumno);
	if (v.codalumno <> corte) then begin
		readln(v.fecha.dia);
		readln(v.fecha.mes);
		readln(v.facultad);
		
		for i:= 1 to canttransporte do
			v.mediodetransporte[i]:= 0;
		
		readln(i); // termina cuando es 0
		while (i >= 1) and (i <= 5) do begin
			v.mediodetransporte[i]:= v.mediodetransporte[i] + 1;
			readln(i);
		end;
	end;
end;

procedure agregaradelante(var l: lista; v: viaje);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= v;
	aux^.sig:= l;
	l:= aux;
end;

procedure cargarlista(var l: lista);
var
	v: viaje;
begin
	leerviaje(v);
	while (v.codalumno <> corte) do begin
		agregaradelante(l,v);
		leerviaje(v);
	end;
end;

procedure cargarvector(var v: vectorprecios);
begin
	v[1]:= 125.50; //1.
	v[2]:= 119.25; //2.
	v[3]:= 115.50; //3.
	v[4]:= 112.20; // 4.
	v[5]:= 117.00; // 5.
end;

function incisoa(v: viaje): integer;
var
	suma,x: integer;
begin
	suma:= 0;
	x:= 1;
	while (x <= 5) and (suma < 6) do begin
		suma:= suma + v.mediodetransporte[x];
		x:= x + 1;
	end;
	if (suma > 6) then
		incisoa:= 1
	else
		incisoa:= 0;
end;

function incisob(v: viaje ; vec: vectorprecios): integer;
var
	x: integer;
	suma: real;
begin
	suma:= 0;
	x:= 1;
	while (x <= 5) and (suma < 80) do begin
		suma:= suma + (v.mediodetransporte[x] * vec[x]);
		x:= x + 1;
	end;
	if (suma > 6) then
		incisob:= 1
	else
		incisob:= 0;
end;

procedure incisoc(v: viaje; var transp1,transp2,cant1,cant2: integer);
var
	x: integer;
begin
	for x:= 1 to canttransporte do begin
		if (cant1 < v.mediodetransporte[x]) then begin
			cant2:= cant1;
			transp2:= transp1;
			cant1:= v.mediodetransporte[x];
			transp1:= x;
		end
		else if (cant2 < v.mediodetransporte[x]) then begin
			cant2:= v.mediodetransporte[x];
			transp2:= x;
		end;
	end;
end;

function incisod(v: viaje): integer;
var
	x: integer;
	cumple: boolean;
begin
	incisod:= 0;
	cumple:= (v.mediodetransporte[5] > 0);
	if(cumple) then begin
		x:= 1;
		cumple:= false;
		while (x < 5) and not(cumple) do begin
			if (v.mediodetransporte[x] > 0) then begin
				cumple:= true;
				incisod:= 1;
			end
			else begin
				x:= x + 1;
			end;
		end;
	end;
end;

procedure imprimir(canta,cantb,cantd,transp1,transp2: integer);
begin
	writeln(canta);
	writeln(cantb);
	writeln(transp1 , transp2);
	writeln(cantd);
end;

procedure incisos(l: lista; v: vectorprecios);
var
	canta,cantb,cantd, transp1,transp2,cant1,cant2: integer;
begin
	canta:= 0;
	cantb:= 0;
	cantd:= 0;
	cant1:= 0;
	cant2:= 0;
	while (l <> nil) do begin
		canta:= canta + incisoa(l^.dato);
		
		cantb:= cantb + incisob(l^.dato,v);
		
		incisoc(l^.dato,transp1,transp2,cant1,cant2);
		
		cantd:= cantd + incisod(l^.dato);
		
		l:= l^.sig;
	end;
	imprimir(canta,cantb,cantd,transp1,transp2);
end;

var
	l: lista;
	v: vectorprecios;
begin
	l:= nil;
	cargarvector(v);
	cargarlista(l);
	writeln('======== fin carga =======');
	incisos(l,v);
end.
