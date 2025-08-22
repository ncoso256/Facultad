program DecimalABinario;

procedure DecimalBinario(n: integer);
begin
    if (n <> 0) then begin
        DecimalBinario(n div 2);   { Llamada recursiva con la parte entera de n/2 }
        write(n mod 2);            { Imprime el resto de dividir por 2 }
    end;
end;

var
    num: integer;
begin
    write('Ingrese un numero decimal (0 para terminar): ');
    readln(num);
    while (num <> 0) do begin
        write('El numero ', num, ' en binario es: ');
        DecimalBinario(num);
        writeln;
        write('Ingrese un numero decimal (0 para terminar): ');
        readln(num);
    end;
    writeln('Programa finalizado.');
end.
