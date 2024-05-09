//1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
//a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.

program holamundi;
var
	num,i, suma, cant: integer;
begin 
	suma:= 0;
	cant:= 0;
	for i:= 1 to 10 do 
	begin
		writeln('ingrese un numero: '); readln(num);
		suma:= suma + num; 
		if (num > 5) then
			cant:= cant +1;
	end;
	writeln('la suma de los 10 numeros es de: ', suma);
	writeln('la cantidad de numeros mayores a 5 son: ', cant);
end.
