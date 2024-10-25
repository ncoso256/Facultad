program Ejercicio10;
type

  Cliente = record
    dni,num: integer;
  end;
  Lista = ^nodo;
  nodo = record
    dato: Cliente;
    sig: Lista;
  end;
  ColaDeEspera = record
     pri, ult: Lista;
  end;

  procedure RecibirCliente(dni: integer; var L: ColaDeEspera);
  var
   C: Cliente;
   aux: Lista;
  begin
     new(aux);
     aux^.sig := nil;
     C.dni := dni;
     if (L.pri = nil)
        then begin
          C.num := 1;
          L.pri := aux;
        end
        else begin
           C.num := L.ult^.dato.num + 1;
           L.ult^.sig := aux;
        end;
     aux^.dato := C;
     L.ult := aux;
  end;
  
  procedure AtenderCliente(var L: ColaDeEspera; var num, dni: integer);
  {Precondición: La lista no está vacía}
  var
    aux: Lista;
  begin
    num := L.pri^.dato.num;
    dni := L.pri^.dato.dni;
    aux := L.pri;
    L.pri := L.pri^.sig;
    dispose(aux);
  end;

  procedure SimularLlegada(var L: ColaDeEspera);
  var
    dni: integer;
  begin
    writeln('Ingrese el dni del cliente:');
    readln(dni);
    while(dni <> 0) do begin
       RecibirCliente(dni,L);
       writeln('Ingrese el dni del cliente:');
       readln(dni);
    end;
  end;
  
  procedure SimularAtencion(var L: ColaDeEspera);
  var
    num, dni: integer;
  begin
    while(L.pri <> nil) do begin
      AtenderCliente(L,num,dni);
      writeln('Sigue el dni: ', dni, ' con el número: ', num);
    end;
  end;


var
  L: ColaDeEspera;
begin
  L.pri := nil;
  SimularLlegada(L);
  SimularAtencion(L);
end.

