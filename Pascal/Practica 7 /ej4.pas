program ej4p7;
const
	dimf = 42;
type
	rangosemana = 1..42;
	vectorpesos = array [rangosemana] of real;
	paciente = record
		nom: string;
		ape: string;
		peso: vectorpesos;
		diml: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: paciente;
		sig: lista;
	end;

procedure cargarvector(var v: vectorpesos; var diml: integer);
var
	peso: real;
begin
	diml:= 0;
	readln(peso);
	while (diml <= dimf) and (peso <> -1) do begin
		diml:= diml + 1;
		v[diml]:= peso;
		readln(peso);
	end;
end;
	
procedure leerpaciente(var p: paciente);
var
	v: vectorpesos;
	diml: integer;
begin
	readln(p.nom);
	readln(p.ape);
	cargarvector(v,diml);
end;	

procedure agregaradelante(var l: lista; p: paciente);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarlista(var l: lista); // se dispone
var
	p: paciente;
begin
	leerpaciente(p);
	while (p.nom <> ' ') do begin
		agregaradelante(l,p);
		leerpaciente(p);
	end;
end;

procedure maximo (var max: real; var sem: integer; km: real; i: integer);
begin
	if (max < km) then begin
		max:= km;
		sem:= i;
	end;
end;

procedure recorrervector(v: vectorpesos; diml: integer);
var
	i: rangosemana;
	max,peso,pesot: real;
	sem: integer;
begin
	pesot:= 0; max:= -1;
	for i:= 1 to diml-1 do begin
		peso:= v[i+1] - v[i];
		pesot:= pesot + peso;
		maximo(max,sem,peso,i);
	end;
	writeln(sem); //a
	writeln(pesot:0:2); // b
end;

procedure recorrer(l: lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato.nom);
		recorrervector(l^.dato.peso, l^.dato.diml);
		l:= l^.sig;
	end;
end;

var
	l: lista;
begin
	l:= nil;
	cargarlista(l); // se dispone
	recorrer(l); 
end.
