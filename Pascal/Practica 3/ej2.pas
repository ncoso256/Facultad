{
El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el
año 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese
año.

a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada
casamiento.

b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el
definido en el inciso a.

c.Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura
finaliza al ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos
realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos
realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura
de fecha
}

program ej2;
const
    ani = 2019;
    aneo = 2020;
type
    rangodia= 1..31;
    rangomes=1..12;
    fecha = record
        dia: rangodia;
        mes: rangomes;
        anio: integer;
    end;
procedure leerfecha(var f:fecha);
begin
    readln(f.dia);
    readln(f.mes);
    if (f.anio = ani) and (f.anio <> aneo) then
        readln(f.anio);
end;

var
    f:fecha;
begin
    leerfecha(f);
    while (f.anio <> aneo) and (f.anio = 2019) do begin
        if ((f.mes = 1) or (f.mes = 2) or (f.mes  = 3)) and (f.dia <= 10) then begin
            cantverano:= cantverano + 1;
            cant10dias:= cant10dias + 1;
        end;
        leerfecha(f)
    end;
    writeln(cantverano);
    writeln(cant10dias);
end.