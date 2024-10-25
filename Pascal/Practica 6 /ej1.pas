program JugamosConListas; //practica 6 ejer 1
 type
    lista = ^nodo;
        nodo = record
        num : integer;
        sig : lista;
    end;
 procedure armarNodo(var L: lista; v: integer);
 var
    aux : lista;
 begin
    new(aux); // crea el primer nodo
    aux^.num := v; // pone el valor actual
    aux^.sig := L; // sigue adelante 
    L := aux; // el auxiliar es el siguiente puntero
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
    pri : lista;
    valor: integer;
begin
      pri := nil; // pone el primer nodo en nil 
      writeln('Ingrese un numero'); // pide el ingreso de algo
      read(valor); // lee un valor entero
    while (valor <> 0) do begin // si ese valor entero es distinto de 0 
        armarNodo(pri, valor); // llama a armar nodo
         writeln('Ingrese un numero');
        read(valor);
    end;
    writeln('Ingrese otro valor: '); read(valor);
    incrementarnumero(pri,valor);
    informarnumeros(pri);
end.

// a) crea un nodo en la lista hasta que la variable valor no sea 0
// b) 1. 10 2. 21  3. 13 4. 48 5. 0 
