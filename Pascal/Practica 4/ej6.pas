program seis;
type
	vector = array[1..100] of integer;

procedure cargarvector(var v: vector; var diml: integer);
var
	i: integer;
begin
	for i:= 1 to 100 do begin
		if(v[i] <> 0) then begin
			readln(v[i]);
			diml:= diml + 1;
		end;
	end;
end;

function posicion (x: integer; v: vector; d: integer): integer;
var
	i, pos: integer;
begin
	pos:= -1;
	i:= 1;
	while (i <= d) and (v[i] <> x) do
		i:= i +1;
	if (v[i] = x) then
		pos := i;
	posicion:= pos;
end;

procedure intercambio(x,y: integer; var v: vector);
var
	a,b: integer;
begin
	a:= v[x];
	b:= v[y];
	v[x]:= b;
	v[y]:= a;
end;

function sumavector(v: vector): integer;
var
	suma,i: integer;
begin
	suma:= 0;
	for i:= 1 to 100 do begin
		suma:= suma + v[i];
	end;
	sumavector:= suma;
end;

function promedio (v: vector): integer;
var
	i, prom: integer;
begin
	for i:= 1 to 100 do begin
		prom:= prom + v[i];
	end;
	promedio:= prom div 100;
end;

procedure maxymin(v: vector; var elementomax, elementomin, diml: integer);
var
	i,max, min: integer;
begin
	max:= -1;
	min:= 9999;
	for i:= 1 to 100 do begin
		if(v[i] > max) then begin
			max:= v[i];
			elementomax:= i;
		end;
		if (v[i] < min) then begin
			min:= v[i];
			elementomin:= i;
		end;
	end;
end;

var
	vec: vector;
	maximo, minimo, dimlog: integer;
begin 
	cargarvector(vec, dimlog);
	maxymin(vec,maximo,minimo,dimlog);
	intercambio(maximo,minimo, vec);
	writeln('El elemento maximo ',vec[minimo], ' que se encontraba en la posicion ',maximo, 'fue intercambiado con el elemento minimo ',vec[maximo], ' que se encontraba en la posicion ',minimo);
	writeln('> v[',maximo,']=',vec[maximo],';');
    write('> v[',minimo,']=',vec[minimo],';');
end.
