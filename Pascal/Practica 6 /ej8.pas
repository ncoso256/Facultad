//  ejercicio ocho

procedure armarNodo(var l: lista; v: integer); // insertar ordenado
var
	actual,anterior,nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= v;
	actual:= l;
	anterior:= l;
	{recorro mientras no se termine la lista y no encuentro la posicion correcta} 
	while (actual <> nil) and (actual^.dato > v) do // de mayor a menor
	begin
		anterior:= actual;
		actual:= actual^.sig;
	end;
	if (anterior = actual) then
		l:= nuevo {el dato va al principio}
	else
		anterior^.sig:= nuevo {va entre otros dos o al final}
	nuevo^.sig:= actual;
end;
