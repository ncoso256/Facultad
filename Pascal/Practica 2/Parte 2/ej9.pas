{9. Realizar un programa modularizado que lea información de alumnos de una facultad. 
Para cada alumno se lee: número de inscripción, apellido y nombre. 
La lectura finaliza cuando se ingresa el alumno con número de inscripción 1200, que debe procesarse.

Se pide calcular e informar: 
● Apellido delos dos alumnos con número de inscripción más chico.

● Nombre de los dos alumnos con número de inscripción más grande.

● Porcentaje de alumnos con nro de inscripción par.}

program ej9;
procedure leerDatos (var numero: integer; var nombre, apellido: string);
begin
readln(numero);
readln(nombre);
readln(apellido);
end;

procedure evaluar2MasChicos (numero: integer; apellido: string; var ap1, ap2: string; var min1, min2: integer);
begin
if (numero < min1) then
    begin
        min2:= min1;
        ap2 := ap1;
        min1:= numero;
        ap1 := apellido;
    end
else 
    if (numero < min2) then
    begin
        min2 := numero;
        ap2 := apellido;
    end;
end;

procedure evaluar2MasGrandes (numero: integer; nombre: string; var nom1, nom2: string; var max1, max2: integer);
begin
if (numero > max1) then
    begin
        max2 := max1;
        nom2:= nom1;
        max1 := numero;
        nom1:= nombre;
    end
else if (numero > max2) then
        begin
            max2 := numero;
            nom2 := nombre;
        end;
end;

procedure evaluarPar (numero: integer; var cant: integer);
var
dig: integer;
begin
dig := numero MOD 10;
if (dig MOD 2 = 0) then
    cant:= cant + 1; 
end;

function porcentaje (total, cant: integer) : real;
begin
porcentaje := (cant/total)*100
end;

var
inscrip, numMin1, numMin2, totalalum, cantpar, numGran1, numGran2: integer;
apellido, nombre, apMin1, apMin2, nomGran1, nomGran2: string;
begin
    totalalum:= 0;
    numMin1:= 9999;
    numMin2:= 10000;
    numGran1:= -1;
    numGran2:= -2;
    cantpar:= 0;
    repeat
        totalalum := totalalum +1;
        leerDatos (inscrip, nombre, apellido);
        evaluar2MasChicos (inscrip, apellido, apMin1, apMin2, numMin1, numMin2);
        evaluar2MasGrandes (inscrip, nombre, nomGran1, nomGran2, numGran1, numGran2);
        evaluarPar (inscrip, cantpar);
    until (inscrip = 1200);
    writeln('Los dos alumnos con numero de inscripcion mas chico se apellidan: ', apMin1, ' y ', apMin2);
    writeln('Los dos alumnos con numero de inscripcion mas grande se llaman: ', nomGran1, ' y ', nomGran2);
    writeln ('El porcentaje de alumnos con numero de inscripcion par es: ', porcentaje(totalalum, cantpar):0:2);
end.
