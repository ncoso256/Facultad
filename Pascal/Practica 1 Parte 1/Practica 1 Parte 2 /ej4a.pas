program ejercicio4a;
var
	i,nummin, nummin2,num: integer;
	
begin
	nummin:= 9999;
	nummin2:= 9999;
	repeat
		writeln('Ingrese un numero: '); readln(num);
		if (num < nummin ) then begin
			nummin2:= nummin;
			nummin:= num;
		end
		else if (num < nummin2) then
			nummin2:= num;
	until (num = 0);
	writeln('el primer numero minimo es: ', nummin);
	writeln('el segundo numero minimo es: ', nummin2);
end.
