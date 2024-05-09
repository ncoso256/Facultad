// 5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
// reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
// número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”
program holamundi;
var
	x, doble: real;
	cant: integer;
begin
	doble:= 0;
	cant:= 0;
	writeln('escriba un numero : '); readln(x); 
	while (doble*2 <> x) and (cant <> 10) do 
	begin
		cant:= cant + 1;
		writeln('escriba otro valor: '); readln(doble);
		if (cant = 10) then 
			writeln('no se leyo el doble de x');
		if (doble*2 = x) then
			writeln('se leyo el doble de x');
	end;
end.
