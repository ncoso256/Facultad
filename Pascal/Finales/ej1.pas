program p6;
type
	vector = array [1..1000] of integer;
	estudiante = record
		dni: integer;
		ape: string;
		legajo: integer;
	end;
	lista = ^nodo;
	nodo= record
		dato: estudiante;
		sig: lista;
	end;

procedure cargarvector(var v: vector ; var diml: integer); // se dispone	

procedure cargarlista(var l: lista) // se dispone

procedure eliminarconorden(var l: lista; dni: integer; var exito: boolean);
var
	act,ant: lista;
begin
	exito:= false;
	act:= l;
	while (act <> nil) and (act^.dato.dni < dni) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act <> nil) and (act^.dato.dni = dni) then begin
		exito:= true;
		if (l = act) then 
			l:= l^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

function esirregular(dni: integer; irregulares: integer;diml: integer):boolean;
var
	i: integer;
begin
	esirregular:= false;
	for i:= 1 to diml do begin
		if (irregulares = dni) then
			esirregular:= true;
	end;
end;

procedure recorrerlista(l: lista; v: vector; diml: integer);
var
	i: integer;
	ok: boolean;
begin
	while (l <> nil) do begin
		if (esirregular(l^.dato.dni,v[i],diml)) then 
			eliminarconorden(l,l^.dato.dni,ok);
		l:= l^.sig;
	end;
end;

var
	l: lista;
	v: vector;
	dimlog: integer;	
begin
	cargarvector(v,dimlog); 
	cargarlista(l);
	recorrerlista(l,v,dimlog);
end.
