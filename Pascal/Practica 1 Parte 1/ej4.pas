//  4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
//  ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)

program holamundi;
var
	x, doble: real;
begin
	doble:= 0;
	writeln('escriba un numero : ');
	readln(x);
	while (doble*2 <> x) do 
	begin
		writeln('escriba otro valor: '); 
		readln(doble);
	end;
end.
