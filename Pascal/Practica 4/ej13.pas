program trece;
const
	dimf = 100;
	dimf2 = 50;
type
	vec = array [1..dimf] of real; // vector para promedio
	vec2 = array [1..dimf2] of vec; // vector para años

procedure cargarvector(var v: vec2);
var
	i,j: integer;
begin
	for i:= 1 to dimf2 do begin
		writeln(i); // anio
		for j:= 1 to dimf do begin
			readln(v[i][j]);
		end;
		writeln('cambia el anio');
	end;
end;

procedure recorrervector(v: vec2; var aniomax1, aniomax2: integer);
var
	i, j: integer;
	promedio, prommax, prommax2 : real;
begin
	suma:= 0;
	prommax:= -1;
	prommax2:= -1;
	for i:= 1 to dimf2 do begin
		for j:= 1 to dimf do begin
			promedio:= promedio + v[i][j]; // para hacer el promedio de la temperatura
			if (v[i][j] > prommax) then begin
				aniomax2:= i;
				prommax:= v[i][j];
			end;
		end;
		promedio:= promedio / dimf; {promedio}
		if (suma > prommax2) then begin
			prommax2:= suma;
			aniomax1:= i;
		end;
		promedio := 0; // se resetea 
	end;
end;
var
	v: vec2;
	anio1,anio2: integer;
begin
	cargarvector(v);
	procesarvector(v,anio1,anio2);
	writeln(anio1); //a
	writeln(anio2); //b
end.
