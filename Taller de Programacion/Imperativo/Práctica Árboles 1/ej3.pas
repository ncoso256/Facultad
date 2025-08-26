{3. Implementar un programa que contenga:

a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.

b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.

c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).

c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}

program tres;
type
    alumno = record
        legajo, codigo, fecha, nota: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;
    arbol = ^nodoarbol;
    nodoarbol = record
        dato: alumno;
        hi: arbol;
        hd: arbol;
    end;

procedure leeralumno(var a: alumno);
begin
    a.legajo:= random(100) +1;
    if (a.legajo <> 0)then begin 
        a.codigo:= random(10)+ 1;
        a.fecha:= random(31)+ 1;
        a.nota:= random(11);
    end;
end;
procedure agregarAdelante (var l: lista; a: alumno);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:= a;
    nuevo^.sig:= l;
    l:= nuevo;
end;

procedure cargarlista(var l: lista);
var
    a: alumno;
begin
    leeralumno(a);
    while (a.legajo <> 0) do begin
        agregarAdelante(l,a);
        leeralumno(a);
    end;
end;

procedure cargararbol(var a: arbol);
var
    l: lista;
begin 
    a:= nil;
    if (a = nil) then begin
        new(a);
        a^.dato:= l^.dato;
        a^.hi:= nil;
        a^.hd:= nil;
    end
    else begin
        if (l^.dato.legajo < a^.dato.legajo) then
            cargararbol(a^.hi)
        else
            cargararbol(a^.hd);
    end;
end;

procedure incisob (a: arbol; var cantimpares: integer);
begin 
    if (a<>nil) then begin 
        if (a^.dato.legajo mod 2 <>0) then 
            cantimpares:= cantimpares + 1; 
        incisob (a^.hi, cantimpares);
        incisob (a^.hd, cantimpares); 
    end; 
end; 

var
    l: lista;
    a: arbol;
    cantimpares: integer; 
begin
    l:= nil;
    cantimpares:= 0; 
    cargarlista(l);
    cargararbol(a);
    incisob (a, cantimpares); 
    writeln (' la cantidad de alumnos con legajo impar es de: ', cantimpares); 
end. {FALTA COMPLETAR!!!}
