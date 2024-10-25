program ocho;
type
	alumno = record
		nroinsc: integer;
		dni: integer;
		nombre: string;
		apellido: string;
		anionac: integer;
	end;
	vecalumnos = array[1..400] of alumno;

procedure leeralumno(var a: alumno);
begin
	readln(a.nroinsc);
	readln(a.nombre);
	readln(a.apellido);
	readln(a.dni);
	readln(a.anionac);
end;

procedure cargarvector(var va: vecalumnos);
var
	i: integer;
	a: alumno;
begin
	for i:= 1 to 400 do begin
		leeralumno(a);
		va[i]:= a;
	end;
end;

function descomponer(dni: integer): boolean;
var
	dig: integer; 
	ok: boolean;
begin
	ok:= true;
	while(dni <> 0) and (ok) do begin
		dig:= dni mod 10;
		if (dig mod 2 <> 0) then
			ok:= false;
		dni:= dni div 10;
	end;
	descomponer:= ok;
end;

procedure sacarmaximos(a: alumno; var max1,max2: integer; var apemax1,apemax2,nommax1,nommax2: string);
begin
	if(a.anionac > max1) then begin
		max2:= max1;
		apemax2:= apemax1;
		nommax2:= nommax1;
		max1:= a.anionac;
		nommax1:= a.nombre;
		apemax1:= a.apellido;
	end
	else begin
		if(a.anionac > max2) then begin
			max2:= a.anionac;
			nommax2:= a.nombre;
			apemax2:= a.apellido;
		end;
	end;
end;

procedure recorrervector(va: vecalumnos);
var
	i,cantpares,max1,max2: integer;
	nommax1,nommax2,apemax1,apemax2: string;
begin
	cantpares:= 0;
	for i:= 1 to 400 do begin
		if(descomponer(va[i].dni)) then
			cantpares:= cantpares + 1;
		sacarmaximos(va[i], max1,max2,apemax1,apemax2,nommax1,nommax2);
	end;
	writeln((cantpares * 100)/ 400);
	writeln(nommax1,apemax1,nommax2,apemax2);
end;

var
	va: vecalumnos;
begin
	cargarvector(va);
	recorrervector(va);
end. // 
