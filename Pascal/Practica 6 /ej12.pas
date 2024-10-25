program ej12p6;

type
	dispositivo = record
		version: real;
		tamanio: real;
		cantram : integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: dispositivo;
		sig: lista;
	end;

procedure cargarlista(var l: lista); // se dispone

procedure recorrerlista(l: lista);
var
	aux: lista;
	cantdispo,cantversion,cantdispositivos: integer;
	sumapantalla: real;
begin
	aux:= l;
	cantversion:= 0;
	cantdispo:= 0;
	sumapantalla:= 0;
	cantdispositivos
	while (aux <> nil) do begin
		versionactual:= aux^.dato.version;
		
		if (aux^.dato.cantram > 3) and (aux^.dato.tamanio <= 5) then
			cantdispo:= cantdispo + 1;
			
		sumapantalla:= sumapantalla + aux^.dato.tamanio;
		cantdispositivos:= cantdispositivos + 1;
		while (aux <> nil) and (aux^.dato.version = versionactual) do begin
			cantversion:= cantversion + 1;
			aux:= aux^.sig;
		end;
		writeln(cantversion);
	end;
	
	writeln(cantdispo);
	writeln(sumapantalla / cantdispositivos);
end;

var
	l: lista;
begin
	l:= nil;
	cargarlista(l); // se dispone
	recorrerlista(l);
end.
