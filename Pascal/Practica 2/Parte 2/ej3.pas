{3. Encontrar los 6 errores que existen en el siguiente programa. 
Utilizar los comentarios entre llaves como guía, indicar en qué línea se encuentra cada error y en qué consiste:}

program ej5;
	{suma los numeros entre a y b , y retorna el resultado en c}
procedure sumar(a,b,c: integer);  {error: la correccion seria procedure sumar(a,b,c: integer);}
var
	suma: integer;
begin
	for i:= a to b do {i no esta en las variables del proceso, no es ordinal, el contador del for esta mal}
		suma:= suma + i; {i no existe}
	c:= c + suma;
end;
var
	result: integer;
begin
	result:= 0;
	readln(a); readln(b); {no existe ni a ni b}
	sumar(a, b, 0); {no encuentra a ni b y no lo pasa}
	writeln('la suma total es ', result);
	{averigua si el resultado final estuvo entre 10 y 30}
	ok:= (result >= 10) or (result <= 30); {ok no existe deberia ser una variable booleana}
	if (not ok) then {ok no existe}
		writeln('La suma no quedo entre 10 y 30');
end.
