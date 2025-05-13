{ Se dispone de la infomracion de los participantes incriptos a una carrera (a lo sumo 5000). De cada participante de tiene DNI, 
nombre y apellido, categoria (1..5) y fecha de inscripcionn. Se pide implementar un programa 
que guarde en una estructura adecuada los participantes de aquellas categorias que posean a lo sumo 
50 inscriptos. Se sabe que cada participante se puede anotar en una sola categoria.}

program p8;
type
	rangodia = 1..31;
	rangomes = 1..12;
	fec = record
		dia: rangodia;
		mes: rangomes;
		anio: integer;
	end;
	rangocat = 1..5;
	participante = record
		dni: integer;
		nomyape: string;
		categoria: rangocat;
		fecha: fec;
	end;
	
	participantes = array [1..5000] of participante;
	participantesxcat = array [rangocat] of integer;
	
	lista = ^nodo;
	nodo = record
		dato: participante;
		sig: lista;
	end;
	
procedure cargarvector(var v: participantes;var diml:integer); // se dispone

procedure inicializarvector(var vc: participantesxcat);
var
	i: integer;
begin
	for i:= 1 to 5 do
		vc[i]:= 0;
end;

procedure agregaradelante(var l: lista; p: participante);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l:= nue;
end;

procedure recorrervector(v: vector; diml: integer ; vc: participantesxcat; var l: lista);
var
	i: integer;
begin
	
	for i:= 1 to diml do begin
		vc[v[diml].categoria]:= vc[v[diml].categoria] + 1;
		if (vc[v[i].categoria] <= 50) then
			agregaradelante(l, v[i]);
	end;
end;



var
	vector: participantes
	dimlog: integer;
	vecc: participantesxcat;
	l: lista;
begin
	l:= nil;
	inicializarvector(vecc);
	cargarvector(vector,dimlog);
	recorrervector(vector,dimlog,vecc, l);
end.
