program jugamosconlistas; // ejercicio 8 y 9
type
	lista = ^nodo;
	nodo = record
		num: integer;
		sig: lista;
	end;

procedure armarnodo(var pri: lista; v: integer);
var
	aux,ant,act: lista;
begin
	new(aux);
	aux^.num:= v;
	aux^.sig:= nil;
	if pri= nil then begin
		pri:= aux;
	end
	else begin
		act:= pri;
		ant:= pri;
		while (act <> nil) and (act^.num < aux^.num) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if act = pri then begin
			aux^.sig:= pri;
			pri:= aux;
		end
		else begin
			ant^.sig:= aux;
			aux^.sig:= act;
		end;
	end;
end;


procedure insertarordenadodescendente(var pri: lista; v: integer);
var
	aux,ant,act: lista;
begin
	new(aux);
	aux^.num:= v;
	aux^.sig:= nil;
	if pri= nil then begin
		pri:= aux;
	end
	else begin
		act:= pri;
		ant:= pri;
		while (act <> nil) and (act^.num > aux^.num) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if act = pri then begin
			aux^.sig:= pri;
			pri:= aux;
		end
		else begin
			ant^.sig:= aux;
			aux^.sig:= act;
		end;
	end;
end;




procedure imprimir(l: lista); 
var
	aux: lista;
begin
	aux:= l;
	while aux<>nil do begin
		writeln(aux^.num);
		aux:=aux^.sig;
	end;
end;

procedure sumar(l: lista; num: integer);
begin
	while l<>nil do begin
		l^.num:= l^.num + num;
		l:=l^.sig;
	end;
end;

procedure eliminar(var pri: lista; x: integer);
var
	act,ant: lista;
begin
	act:= pri;
	while (act<>nil) and (act^.num <> x) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if act<>pri then begin
		if act = pri then begin
			pri:= pri^.sig
		end
		else begin
			ant^.sig:= act^.sig;
		end;
	end;
	dispose(act);
end;

procedure agregaratras(var pri: lista; num: integer);
var
	nuevo,aux: lista;
begin
	new(nuevo);
	nuevo^.num:= num;
	nuevo^.sig:= nil;
	if pri= nil then begin
		pri:= nuevo
	end
	else begin
		aux:= pri;
		while (aux^.sig<> nil) do begin
			aux:=aux^.sig;
		end;
		aux^.sig:= nuevo;
	end;
end;

procedure nuevalista(pri: lista; var pri2: lista; mayor,menor: integer);
begin
	while pri<>nil do begin
		if (pri^.num> menor)and (pri^.num<mayor) then begin
			agregaratras(pri2,pri^.num);
		end;
		pri:= pri^.sig;
	end;
end;

procedure nuevalista2(pri: lista; var pri2: lista; mayor,menor: integer);
begin
	while pri<>nil do begin
		if (pri^.num> menor)and (pri^.num<mayor) then begin
			armarnodo(pri2,pri^.num); // insertarordenado
		end;
		pri:= pri^.sig;
	end;
end;

procedure nuevalista3(pri: lista; var pri2: lista; mayor,menor: integer);
begin
	while pri<>nil do begin
		if (pri^.num> menor)and (pri^.num<mayor) then begin
			insertarordenadodescendente(pri2,pri^.num)
		end;
		pri:= pri^.sig;
	end;
end;

function estaordenada(pri: lista): boolean;
var
	aux: integer;
	ok: boolean;
begin
	ok:= true;
	while (pri<>nil) and (ok= true) do begin
		aux:= pri^.num;
		pri:= pri^.sig;
		if (pri <> nil) and(pri^.num < aux) then begin
			ok:= false;
		end;
	end;
	estaordenada:= ok;
end;

var
	esta: boolean;
	pri,pri2: lista;
	valor,x, mayor,menor: integer;
begin
	pri:= nil;
	writeln('Ingrese un numero ');
	read(valor);
	while (valor <> 0) do begin
		agregaratras(pri,valor);
		writeln('Ingrese un numero ');
		read(valor);
	end;
	imprimir(pri);
	esta:= estaordenada(pri);
	if (esta = true) then
		writeln('La lista esta ordenada de manera ascendente');
	writeln('Ingrese un numero para eliminar de la lista');
	readln(x);
	eliminar(pri,x);
	imprimir(pri);
	writeln('Ingrese un numero para que sea el techo del subrango de la lista');
	readln(mayor);
	writeln('Ingrese un numero para que sea el piso del subrango de la lista');
	readln(menor);
	nuevalista3(pri,pri2,mayor,menor);
	imprimir(pri2);
end.
