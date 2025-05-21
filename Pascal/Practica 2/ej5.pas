{6. 
a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. 
Al finalizar la lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.}

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
