program ocho;
procedure analizarnum(num: integer; var p,i: integer);
var
	digito: integer;
begin
	i:= 0; p:= 0;
	while (num <> 0) do begin
		digito:= num mod 10;
		if (digito mod 2 = 0) then
			p:= p + digito
		else
			i:= i + 1;
		num:= num div 10;
	end;
end;
var
	num, p, i: integer;
begin
	writeln('Escriba un numero ');
	readln(num);
	while (num <> 123456) do begin
		analizarnum(num,p,i);
		writeln('Escriba otro numero ');
		readln(num);
	end;
	writeln('La suma de los digitos pares es de: ', p);
	writeln('y la cantidad de digitos impares que posee es de : ' , i);
end.
