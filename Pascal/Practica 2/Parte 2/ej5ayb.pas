program Ejercicio5;

function esDoble(numA,numB: integer) : boolean;
begin
  if (numB = 2*numA)
    then esDoble := true
    else esDoble := false;
end;

var
  n1,n2, cant, cantDobles: integer;
begin
  cant := 0;
  cantDobles := 0;
  writeln('Ingrese un número entero');
  readln(n1);
  writeln('Ingrese otro número entero');
  readln(n2);
  while ((n1 <> 0) OR (n2 <> 0)) do begin   
     cant := cant + 1;
     if (esDoble(n1,n2))
       then cantDobles := cantDobles + 1;
     writeln('Ingrese un número entero');
     readln(n1);
     writeln('Ingrese otro número entero');
     readln(n2);
  end;
  writeln('Cantidad total: ', cant);
  writeln('Cantidad que cumple la condición: ', cantDobles);
end.
