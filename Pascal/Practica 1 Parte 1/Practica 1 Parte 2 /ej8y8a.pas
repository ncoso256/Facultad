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
