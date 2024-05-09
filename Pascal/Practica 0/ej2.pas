//  2. Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
// números:
// a. Utilizando una variable adicional
// b. Sinutilizar una variable adicional


program holamundi;
var
	num1,num2, suma: integer;
begin
	readln(num1); 
	readln(num2);
	suma:= num1 + num2;
	writeln('Se ingresaron los valores ',(num2) , ' y '  , (num1));
	writeln(suma); // inciso a
	writeln(num1+num2); // inciso b
end.
