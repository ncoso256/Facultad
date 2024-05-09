program ejercicio4b;
var
	i,nummin, nummin2,num: integer;
	
begin
	nummin:= 9999;
	nummin2:= 9999;
	writeln('Ingrese un numero: '); readln(num);
	while (num <> 0) do begin 
		if (num < nummin ) then begin
			nummin2:= nummin;
			nummin:= num;
		end
		else if (num < nummin2) then
			nummin2:= num;
		writeln('Ingrese un numero: '); readln(num);
	end;
	writeln('el primer numero minimo es: ', nummin);
	writeln('el segundo numero minimo es: ', nummin2);
end.
