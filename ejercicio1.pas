{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”.}

program uno;
var
  num1, num2: integer;
begin
  read(num1);
  read(num2);
  if (num1 > num2) then
    Write ('el numero mayor es ', num1)
  else
    begin
      if (num1 = num2) then
      Write('los numeros leidos son iguales')
      else
        if (num2 > num1) then
        Write('el numero mayor es ', num2)
    end;
end.
