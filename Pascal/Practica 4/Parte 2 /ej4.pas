program cuatro;
const
	df = 1000;
type
	alumno = record
		nro: integer;
		nombre: string;
		apellido: string;
		cantasistencias: integer;
	end;
	vector = array[1..df] of alumno;

procedure leerdatos(var a: alumno);
begin
	readln(a.nro);
	readln(a.nombre);
	readln(a.apellido);
	readln(a.cantasistencias);
end;

procedure cargarvector(var v: vector; var dl: integer);// se dispone


function posicion (a: alumno;v:vector; dl:integer): integer;
var
	i,pos: integer;
begin
	pos:= -1;
	i:= 1;
	while (i <= d) and (v[i].nro <> x) do
		i:= i + 1;
	if (v[i].nro = a.nro) then
		pos:= i;
	posicion:= pos;
end;

procedure insertaralumno(var v: vector; var dl: integer; var pude: boolean; a:alumno; pos: integer);
var
	i: integer;
begin
	pude:= false;
	
	if ((dl + 1) <= df) and (pos >= 1) and (pos <= dl)) then begin
		
		for i:= dl downto pos do
			v[i+1]:= v[i];
			
		pude:= true;
		v[pos]:= a;
		dl:= dl + 1;
	end;
end;

procedure eliminarposalumno(var v: vector; var dl: integer; var pude: boolean; pos : integer);
var
	i: integer;
begin
	pude:= false;
	
	if ((pos >= 1) and (pos <= dl)) then begin
	
		for i:= pos to (dl-1) do
			v[i]:= v[i+1];
	
		pude:= true;
		dl:= dl - 1;
	end;
end;


function buscarnroalu(v: vector; dl: integer; nro: integer):boolean
var
	pos: integer;
	esta: boolean;
begin
	esta:= false;
	pos:= 1;
	while ((pos <= dl) and (not esta)) do begin
		if (v[pos] = nro) then esta:= true
		else
			pos:= pos + 1;
	end;
	buscar:= esta;
end;

procedure eliminarpornroalumno(var v: vector ; var dl: integer; var pude: boolean; nro: integer);
var
	i: integer;
begin
	pude:= false;
	
	if ((nro >= 1) and (nro <= dl)) then begin
	
		for i:= nro to (dl-1) do
			v[i]:= v[i+1];
			
		pude:= true;
		dl:= dl - 1;
	end;
end;

function buscarcantasistalu(v: vector; dl: integer; asistencias: integer):boolean;
var
	pos: integer;
	esta: boolean;
begin
	esta:= false;
	pos:= 1;
	while((pos <= dl) and (not esta)) do begin
		if(v[pos] = asistencias) then esta:= true
		else
			pos:= pos + 1;
	end;
	buscarcantasistalu:= esta;
end;

procedure eliminarcantasist(var v: vector; var dl: integer; var pude: boolean; cantasistencias: integer);
var
	i: integer;
begin
	pude:= false;
	
	if ((cantasistencias >= 1) and (cantasistencias <= dl)) then begin
		
		for i:= cantasistencias to (dl - 1) do
			v[i]:= v[i+1];
		
		pude:= true;
		dl:= dl - 1;
	end;
end;

var
	v: vector;
	a: alumno;
	dl,valor,pos: integer;
	ok:boolean;
	espaciovec:integer;
begin
	cargarvector(v,dl) // se dispone
	
	readln(valor); readln(pos);
	insertaralumno(v,dl,ok,valor,pos); // inciso b
	
	readln(pos);
	eliminarposalumno(v,dl,ok,pos); // inciso c
	
	readln(a.nro);
	if ((buscarnroalu(v,dl,a.nro))= true)then begin
		eliminarpornroalumno(v,dl,ok,a.nro); // inciso d
		eliminarposalumno(v,dl,ok,pos);
	end
	else if((buscar(v,dl,a.nro)= false) then
		writeln(buscar(v,dl,a.nro));
	a.cantasistencias:= 0;
	if ((buscarcantasistalu(v,dl,ok,a.cantasistencias))=true) then begin
		eliminarporcantasist(v,dl,ok,a.cantasistencias); // inciso e
		eliminarposalumno(v,dl,ok,pos);
	end
	else if((buscarcantasistalu(v,dl,ok,a.cantasistencias))= false) then
		writeln(buscarcantasistalu(v,dl,ok,a.cantasistencias));
end.
