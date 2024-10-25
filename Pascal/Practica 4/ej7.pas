program siete;
const
	dimf = 9;
type
	rango = 0..dimf;
	vecnum = array[rango] of integer;

procedure descomponer(num: integer; var v: vecnum);
var
	dig: integer;
begin
	if (num = 0) then
		v[0]:= v[0] + 1
	else begin
		while (num <> 0) do begin
			dig:= num mod 10; 
			v[dig]:= v[dig] + 1; // si viene el 3 incrementa de 0 a 1 la posicion 3 del vector
			num:= num div 10;
		end;
	end;
end;

procedure cargarvector(var v: vecnum);
var
	i: integer;
begin
	for i:= 0 to dimf do begin
		v[i]:= 0;
	end;
end;

procedure maximo(n: integer; i: rango; var maximo: integer; var digmax: rango);
begin
	if (n > maximo) then begin
		maximo:= n;
		digmax:= i; 
	end;
end;

procedure informar(v: vecnum);
var
	max: integer;
	maxdig,i: rango;
begin
	max:= -1;
	for i:= 0 to dimf do begin
		if (v[i] > 0) then
			writeln('el digito ', i, ' aparecio',v[i], 'veces ')
		else
			writeln('el digito ', i, ' no tuvo ocurrencias ');
		maximo(v[i],i,max, maxdig);
	end;
	writeln('El digito mas leido es ', maxdig , ' con ', max , ' ocurrencias');
end;
var
	v: vecnum;
	int: integer;
begin
	cargarvector(v);
	writeln('Ingrese numeros, cuando termine su secuencia ponga el -1'); readln(int);
	while (int <> -1) do begin
		descomponer(int, v);
		readln(int);
	end;
	informar(v);
end.
