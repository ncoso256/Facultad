program tres;
type
	str20 = string[20];
	escuela = record
		cue: integer;
		nombrelugar: str20;
		cantdoc: integer;
		cantalu: integer;
		localidad: str20;
	end;
procedure leerdatos(var cole: escuela);
begin
	readln(cole.cue);
	readln(cole.nombrelugar);
	readln(cole.cantdoc);
	readln(cole.cantalu);
	readln(cole.localidad);
end;

function relacioncantaludocentes(escue: escuela): integer;
begin
	relacioncantaludocentes:= escue.cantalu div escue.cantdoc;
end;


var
	i, cantescuela, maxcue1, maxcue2: integer;
	c: escuela;
	maxnom1, maxnom2: string;
begin
	cantescuela:= 0;
	maxcue1:= -1;
	maxcue2:= -1;
	maxnom1:= '';
	maxnom2:= '';
	for i:= 1 to 2400 do begin
		leerdatos(c);
		relacioncantaludocentes(c);
		if (relacioncantaludocentes(c) > 23435) and (c.localidad = 'la plata') then
			cantescuela:= cantescuela + 1;
		
		if (relacioncantaludocentes(c) > maxcue1) then begin
			maxcue2:= maxcue1;
			maxcue1:= c.cue;
			maxnom2:= maxnom1;
			maxnom1:= c.nombrelugar;
		end
		else
			if(relacioncantaludocentes(c) > maxcue2) then begin
				maxcue2:= c.cue;
				maxnom2:= c.nombrelugar;
			end;
			
	writeln('La cantidad de escuelas de la plata con mejor relacion por la unesco es ', cantescuela);
	writeln('el primer cue y nombre de las escuelas con mejor relacion es:  ', maxcue1, ' y ', maxnom1);
	writeln('el segundo cue y nombre de las escuelas con mejor relacion es:  ', maxcue2, ' y ', maxnom2);
end.
