// 9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter,
//debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse una secuencia
//de números enteros que finaliza con 0. El programa deberá aplicar la operación leída con la secuencia de
//números, e imprimir el resultado final.
//Por ejemplo:
//○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
//○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir: 0 (-10 + 5 + 6 + (-1))

program holamundi;
var
	c: char;
	num1, num2, num3, num4, num5, suma , resta: integer;
	res: integer;
begin 
	res:= 0;
	writeln('escriba un caracter'); readln(c);
	while (c = '+') or (c = '-') do begin
		writeln('escriba un numero: '); readln(num1); 
		writeln('escriba un segundo numero: '); readln(num2); 
		writeln('escriba un tercer numero: '); readln(num3); 
		writeln('escriba un cuarto numero: '); readln(num4);
		writeln('escriba un quinto numero: '); readln(num5);
		if (num5 = 0) then 
		begin
			if (c = '+') then 
			begin
				suma:= num1 + num2 + num3 + num4;
				res:= suma;
				writeln('el resultado de la suma es: ' , res);
			end
			else
			if (c = '-') then
			begin
				resta:= num1 - num2 - num3 - num4;
				res:= resta;
				writeln('el resultado de la resta es: ' , res);
			end;
		end;
	end;
end.
