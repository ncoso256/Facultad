{5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de pares en las que numB es el doble de numA. 
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores 4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

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
