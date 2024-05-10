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

program ej;
const
 FIN= 2020;
type
    rangoD=1..31; 
    rangoM=1..12;
    
    fecha = record
            dia: rangoD; 
            mes:rangoM;
            anio:integer;
        end;


//procesos
procedure LeerFecha (var f:fecha);
begin
    writeln('Ingrese el año');
    readln(f.anio);
    if ( f.anio <> FIN ) then begin
        writeln('Ingrese el dia');
        readln(f.dia);
        writeln('Ingrese el mes');
        readln(f.mes);
    end;
end;

function CantidadMeses(mes:rangoM):boolean;
begin
    if ( (mes = 1) or (mes = 2) or (mes = 3) ) then CantidadMeses:=true
                                               else CantidadMeses:=false;
end;

function CantidadDias(dia:rangoD):boolean;
begin
    if ( (dia >= 1) and (dia <= 10) ) then CantidadDias:=true
                                      else CantidadDias:=false;
end;


//PROGRAMA PRINCIPAL
var
    f:fecha;
    cant1,cant2:integer;
begin
    cant1:=0; cant2:=0;
    LeerFecha(f);
    while ( f.anio <> FIN )do
    begin
        if ( CantidadMeses(f.mes) ) then cant1:=cant1+1;
        if ( CantidadDias(f.dia) ) then cant2:=cant2+1;
        LeerFecha(f);
    end;
    
    writeln(cant1);
    writeln(cant2);
end.
