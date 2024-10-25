program diez;

type {Tipos}
    cliente = record
        dni,num: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: cliente;
        sig: lista;
    end;
    coladeespera = record
        pri,ult: lista;
    end;

procedure recibircliente(dni: integer; var l:coladeespera);
var
    c: cliente;
    aux: lista;
begin
    
    new(aux);
    aux^.sig:= nil;
    c.dni:= dni;
    if (l.pri = nil) then begin
        c.num:= 1; 
        l.pri:= aux;   
    end
    else begin 
        c.num:= l.ult^.dato.num + 1;
        l.ult^.sig:= aux;
    end;
    aux^.dato:= c;
    l.ult:= aux; 
end;

procedure atendercliente(var l: coladeespera ; var num, dni:integer);
{precondicion: la lista }
var 
    aux: lista;
begin
    num:= l.pri^.dato;
    dni:= l.pri^.dato.dni;
    aux:= l.pri;
    l.pri:= l.pri^.sig;
    dispose(aux);
end;

procedure simularllegada(var l: coladeespera);
var
    dni: integer;
begin
    writeln('ingrese el dni del cliente');
    readln(dni);
    while (dni <> 0) do begin
        recibircliente(dni,l);
        writeln('ingrese el dni del cliente');
        readln(dni);
    end;
end;

procedure simularatencion(var l: coladeespera);
var
    num,dni: integer;
begin
    while (l.pri <> nil) do begin
        atendercliente(l,num,dni);
        writeln('sigue el dni: ', dni, ' con el numero: ', num);
    end;
end;

var {Variables locales al programa ppal}
    l: coladeespera;


begin {Programa principal}
    l.pri:= nil;
    simularllegada(l);
    simularatencion(l);
end.
