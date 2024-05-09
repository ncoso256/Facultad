// 3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
// Por ejemplo, si se ingresan los valores 4,-10 y 12, deberá imprimir: 12 4-10

program holamundi;
var
	num1, num2, num3, aux: integer;
begin
	writeln('escriba el primer numero: '); readln(num1);
	writeln('escriba el segundo numero: '); readln(num2);
	writeln('escriba el tercer numero: '); readln(num3);
	if (num1 = num2) and (num1 = num3) then
		writeln('los numeros son iguales')
	else
	if (num1 < num3) then
	begin
		aux:= num3;
		num3:= num1;
		num1:= aux;
	end;
	if (num1 < num2)then
	begin
		aux:= num2;
		num2:= num1;
		num1:= aux;
	end;
	if (num2 < num3) then
	begin
		aux:= num3;
		num3:= num2;
		num2:= aux;
	end;
	writeln('Los numeros ordenados son : ', num1,' ',num2, ' ', num3);
end.
// se podia usar un for tambien
