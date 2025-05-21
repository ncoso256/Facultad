{8. Un local de ropa desea analizar las ventas realizadas en el último mes.
Para ello se lee por cada día del mes, los montos de las ventas realizadas. 
La lectura de montos para cada día finaliza cuando se lee el monto 0.

Se asume un mes de 31 días. 

Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas de todo el mes.

a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor cantidad de ventas}

program ejercicio8y8a;
var
	i, monto, cantventas, montototalmes, max, dia: integer
begin
	montototalmes:= 0;
	for i:= 1 to 31 do
	begin
		cantventas:= 0;
		writeln('dia ', i);
		write('monto: ');
		readln(monto);
		while (monto <> 0) do
		begin
			cantventas := cantventas + 1;
			montototalmes:= montototalmes + monto;
			write('monto: $');
			readln(monto);
		end;
		if (cantventas > max) then
		begin
			max:= cantventas;
			diamax:= i;
		end;
		writeln('cantidad de ventas hoy: ', cantventas);
	end;
	writeln('monto total de las ventas del mes: ', montototalmes); 
	writeln('el dia ', diamax, ' fue el que tuvo mayor cantidad de compras');
end.
