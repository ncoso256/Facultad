program ejercicio5;
var
	num, suma , nummax, nummin: integer;
begin
	suma:= 0;
	nummax:= -999;
	nummin:= 9999;
	repeat
		writeln('escriba un numero: '); readln(num);
		suma:= suma + num;
		if (num > nummax) then
			nummax:= num;
		if (num < nummin) then
			nummin:= num;
	until (num = 100);
	writeln('el numero maximo leido es: ', nummax);
	writeln('el numero minimo leido es: ', nummin);
	writeln('la suma de los numeros leidos es de : ', suma);
end.
