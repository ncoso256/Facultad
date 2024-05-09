program ejercicio7;
var
	i:integer;
	pilotomin1, pilotomin2,piloto, pilotomax1, pilotomax2: string;
	tiempomin1,tiempomin2 ,tiempo, tiempomax1, tiempomax2: real;
begin
	tiempomin1:= 9999;
	tiempomin2:= 9999;
	tiempomax1:= -999;
	tiempomax2:= -999;
	pilotomin1:= '';
	pilotomin2:= '';
	pilotomax1:= '';
	pilotomax2:= '';
	for i:= 1 to 4 do begin
		writeln('Escriba el nombre del piloto: '); readln(piloto);
		writeln('Escriba el tiempo del piloto: '); readln(tiempo);
		if (tiempo < tiempomin1) then begin
			tiempomin2 := tiempomin1;
			tiempomin1:= tiempo;
			pilotomin2:= pilotomin1;
			pilotomin1:= piloto;
		end
		else if (tiempo < tiempomin2) then
		begin
			tiempomin2:= tiempo;
			pilotomin2:= piloto;
		end;
		if (tiempo > tiempomax1) then begin
			tiempomax2:= tiempomax1;
			tiempomax1:= tiempo;
			pilotomax2:= pilotomax1;
			pilotomax1:= piloto;
		end
		else if(tiempo > tiempomax2) then begin
			tiempomax2:= tiempo;
			pilotomax2:= piloto;
		end;
	end;
	writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos son: ' , pilotomin1 , ' y ' , pilotomin2); {gano}
	writeln('Los nombres de los dos pilotos que finalizaron en los ultimos dos puestos son: ' ,  pilotomax2 , ' y ' ,pilotomax1); {perdio}
end.
