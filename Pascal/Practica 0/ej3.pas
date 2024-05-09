//3. Implemente un programa que lea dos números reales e imprima el resultado de la división de
// los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
// debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62

program holamundi;
var
	num1,num2, division: real;
begin
	readln(num1); 
	readln(num2);
	division:= (num1 / num2);
	writeln('el resultado de dividir' , (num1):6:3 , ' por' , (num2):6:3 , ' es' , (division):6:3);
end.
