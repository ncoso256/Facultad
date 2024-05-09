program ej7ab;

procedure descomponer(num: integer ; var cantdig, sumadig: integer);
var
	dig: integer;
begin
	cantdig:= 0; {inicializar contadores en 0 por lugar donde mencione el ejercicio}
	sumadig:= 0;
	while (num <> 0) do begin
		dig:= num mod 10;
		cantdig:= cantdig +1;
		sumadig:= sumadig + dig;
		num:= num div 10;
	end;
end;
var
	numero, cantdigito, sumadigitos, canttotaldig: integer;
begin
	canttotaldig:= 0;
	repeat
		writeln('Escriba un numero entero: ');
		readln(numero);
		descomponer(numero, cantdigito, sumadigitos);
		canttotaldig:= canttotaldig + cantdigito;
	until (sumadigitos = 10);
	writeln('La cantidad total de digitos leidos es: ', canttotaldig);
end.
