//correccion del 9
program holamundi;
var
	c: char;
	numeros: integer;
	res: integer;
begin 
	res:= 0;
	writeln('escriba un caracter'); readln(c);
	if (c = '+') or (c = '-') then
	begin 
		if (c = '+') then 
		begin
			writeln('escriba un numero: '); readln(numeros);
			while (numeros <> 0) do
			begin	
				res:= res + numeros;
				readln(numeros);
			end;
			writeln('el resultado de la suma es: ' , res);
		end
		else
		begin
			writeln('ingrese los numeros que desee');
			readln(res);
			if (res <> 0) then
			begin
				readln(numeros);
				while (numeros <> 0) do
				begin
					res:= res - numeros;
					readln(numeros);
				end;
				writeln('el resultado de la resta es: ', res);
			end;
		end;
	end
	else writeln('el caracter no es valido');
end.
