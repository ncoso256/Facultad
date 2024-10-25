program ej5p7;
type
	
	camion = record
		patente: string;
		anio: integer;
		capacidad: real;
	end;
	rango = 1..100;
	vectorcamiones = array [rango] of camion; // se dispone
	
	viaje = record
		codv: integer;
		codc: rango;
		distanciakm: real;
		ciudaddes: string;
		anio: integer;
		dni: integer;
	end;
	
	
	
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;

procedure leercamion(var c: camion);
begin
	readln(c.patente);
	readln(c.anio);
	readln(c.capacidad);
end;

procedure cargarvector(var v: vectorcamiones);  // se dispone 
var
	i: rango;
	c: camion;
begin
	for i:= 1 to 100 do begin
		leercamion(c);
		v[i]:= c;
	end;
end;

procedure leerviaje(var v: viaje);
begin
	readln(v.codv);
	readln(v.codc);
	readln(v.distanciakm);
	readln(v.ciudaddes);
	readln(v.anio);
	readln(v.dni);
end;

procedure agregaradelante(var l: lista; v: viaje);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= v;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarlista(var l: lista);
var
	v: viaje;
begin
	leerviaje(v);
	while (v.codv <> -1) do begin
		agregaradelante(l,v);
		leerviaje(v);
	end;
end;


function cumple (dni: integer): boolean; 
var 
    dig: integer; 
    ok: boolean;
begin 
    ok:= false;
    while (dni <> 0) and (not ok) do begin 
        dig:= dni mod 10; 
        if (dig mod 2 = 1) then 
            ok:= true; 
        dni:= dni div 10; 
    end; 
    cumple := ok; 
end; 
procedure procesarlista(l: lista; c: vectorcamiones; var cantviajes: integer);
var
	kmrecorridos: real;
	maxkm: real;
	minkm: real;
	patentemax: string;
	patentemin: string;
begin
	kmrecorridos:= 0;
	maxkm:= -1;
	minkm:= 9999;
	cantviajes:= 0;
	while (l<>nil) do begin
		if (l^.dato.distanciakm > maxkm) then begin
			maxkm:= l^.dato.distanciakm;
			patentemax:= c[l^.dato.patente];
		end;
		if (l^.dato.distanciakm < minkm) then 
			minkm:= l^.dato.distanciakm;
			patentemin:= c[l^.dato.patente];
		end;
		if (c[l^.dato.patente].capacidad > 30.5) and ((c[l^.dato.patente].anio + 5) > l^.dato.anio) then
			cantviajes:= cantviajes + 1;
		if (cumple(l^.dato.dni)) then
			writeln(l^.dato.codv);
		l:= l^.sig;
	end;
	writeln(patentemax);
	writeln(patentemin);
end;

var
	l: lista;
	v: vectorcamiones;
	cantviajes: integer;
begin
	l:= nil;
	cargarvector(v); // se dispone
	cargarlista(l);
	procesarlista(l,v, cantviajes);
	writeln(cantviajes);
end.
