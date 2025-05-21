{5. Dado el siguiente programa, indicar cuál es el error.}

program hola;
procedure numero;
var
	num, par, parmax: integer;
begin
	parmax:= -998;
	writeln('Escriba un numero: '); readln(num);
	while(num <> -1) do begin
		if ((num mod 2) = 0) then
			par:= num;
		if (par > parmax) then
			parmax:= par;
		writeln('Escriba un numero: '); readln(num);
	end;
	writeln('El numero par mas alto es: ', parmax);
end;
begin
	numero;
end.
