program JugamosConListas; //practica 6 ejer 4
 type
    lista = ^nodo;
        nodo = record
        num : integer;
        sig : lista;
    end;


procedure minimo (l: lista; var min: integer);
begin
  while (l <> nil) do begin
    if (l^.num < min) then
      min:= l^.num;
    l:= l^.sig;
  end;
end;
procedure maximo (l: lista; var max: integer);
begin
  while (l <> nil) do begin
    if (l^.num > max) then
      max:= l^.num;
    l:= l^.sig;
  end;
end;
procedure armarNodoa (var l,ult: lista; v: integer); // agregar al final
var
  nue : lista;
 begin
    new(nue); {creo el nodo}
    nue^.num:= v;  {cargo el dato}
    nue^.sig:= nil; {inicializo enlace en nil}
    if (l = nil) then {si la lista esta vacia}
        l:= nue {actualizo el inicio}
    else {si la lista no esta vacia}
        ult^.sig:= nue; {realizo el enlace}
    ult:= nue; {actualizo el ultimo}
 end;

procedure armarnodob(var pri,ult: lista; v:integer); // con otro agregar atras
var
	aux: lista;
begin
	new(aux);
	aux^.num:= v;
	aux^.sig:= nil;
	if (pri = nil) then begin
		pri:= aux;
		ult:= aux;
	end else begin
		ult^.sig:= aux;
		ult:= aux;
	end;
end;

function multiplos (l: lista; a:integer):integer;
begin
  multiplos:= 0;
  while (l <> nil) do begin
    if (l^.num mod a = 0) then
      multiplos:= multiplos + 1;
    l:= l^.sig;
  end;
end;


procedure cargarlista(var pri,ult: lista);
var
    valor: integer;
begin
      writeln('Ingrese un numero'); // pide el ingreso de algo
      read(valor); // lee un valor entero
    while (valor <> 0) do begin // si ese valor entero es distinto de 0 
        armarNodoa(pri,ult ,valor); // llama a armar nodo
        writeln('Ingrese un numero');
        read(valor);
    end;
end;

procedure informarnumeros(l: lista); // inciso c
begin
    while (l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;
end;

function incrementarnumero(l: lista;  numero: integer): integer; //	inciso d
begin
	while (l <> nil) do begin
		l^.num:= l^.num + numero;
		l:= l^.sig;
	end;
end;
var
    pri, ult: lista;
    valor: integer;
    max: integer;
    min: integer;
    cant,mul: integer;
begin
    cant:= 0;
    min:= 9999;
    max:= -1;
    pri := nil; // pone el primer nodo en nil 
	ult:= nil;
    cargarlista(pri,ult);
    maximo(pri,max);
    minimo(pri,min);
    writeln('Elija un multiplo: '); read(mul);
    cant:= multiplos(pri,mul);
    writeln('El numero maximo ingresado fue ', max);
    writeln('El numero minimo ingresado fue ', min);
    writeln('La cantidad de multiplos de ', mul ,' es de ', cant);
    writeln('Ingrese otro valor: '); read(valor);
    incrementarnumero(pri,valor);
    informarnumeros(pri);
end.
