program ej15p6;
type
	rangonota = 1..10;
	rangoturno = 0..5;
	alumno = record
		dni: integer;
		apelllido: string;
		nombre: string;
		nota: rangonota;
		turno: rangoturno;
	end;

	lista = ^nodo;
	nodo = record
		dato: alumno;
		sig: lista;
	end;
	
procedure cargarlista(var l: lista); // se dispone


procedure recorrerlista(l: lista);
var
	aux: lista;
begin
	aux:= l;
	while (aux <> nil) do begin
		if (aux^.dato.nota >= 8) and ((aux^.dato.turno = 1) or (aux^.dato.turno = 4))then
			writeln(aux^.dato.dni,aux^.dato.apellido,aux^.dato.nombre,aux^.dato.nota,aux^.dato.turno);
		if (aux^.dato.nota<= 5 and aux^.dato.nota <= 8) and (aux^.dato.turno = 2 or aux^.dato.turno = 3 or aux^.dato.turno = 5) then
			writeln(aux^.dato.dni,aux^.dato.apellido,aux^.dato.nombre,aux^.dato.nota,aux^.dato.turno);
		if(aux^.dato.nota < 5) then begin
			aux^.dato.turno:= 0;
			writeln(aux^.dato.dni,aux^.dato.apellido,aux^.dato.nombre,aux^.dato.nota,aux^.dato.turno);
		end;
		aux:=aux^.sig;
	end;
end;
	
var
	l: lista;
begin
	l:= nil;
	cargarlista(l); // se dispone
	recorrerlista(l);
end.
