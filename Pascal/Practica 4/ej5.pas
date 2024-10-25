program cinco;
type
	vector = array[1..100] of integer;

procedure cargarvector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 100 do begin
		if(v[i] <> 0) then
			readln(v[i]);
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

function elementomax(v: vector): integer;
var
	i, max: integer;
begin
	max:= -1;
	for i:= 1 to 100 do begin
		if(v[i] > max) then begin
			max:= v[i];
			elementomax:= i;
		end;
	end;
end;

function elementomin(v: vector): integer;
var
	i, min: integer;
begin
	min:= 9999;
	for i:= 1 to 100 do begin
		if (v[i] < min) then begin
			min:= v[i];
			elementomin:= i;
		end;
	end;
end;

var
	vec: vector;
	maximo, minimo: integer;
begin 
	cargarvector(vec);
	maximo:= elementomax(vec);
	minimo:= elementomin(vec);
	intercambio(maximo,minimo, vec);
	end;
	writeln('El elemento maximo ',v[minimo], ' que se encontraba en la posicion ',maximo, 'fue intercambiado con el elemento minimo ',v[maximo], ' que se encontraba en la posicion ',minimo);
	writeln('> v[',max,']=',v[max],';');
  write('> v[',min,']=',v[min],';');
end.
