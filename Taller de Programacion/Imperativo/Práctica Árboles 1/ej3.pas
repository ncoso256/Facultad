
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
    
    registroarbol = record
        leg: integer; 
        finales: lista; 
    end; 

    arbol = ^nodoarbol;
    nodoarbol = record
        dato: registroarbol;
        hi: arbol;
        hd: arbol;
    end;

procedure leeralumno(var a: alumno);
begin
    a.legajo:= random(100);
    writeln (' el legajo es: ',a.legajo); 
    if (a.legajo <> 0)then begin 
        a.codigo:= random(10)+ 1;
        writeln (' el codigo es: ', a.codigo);
        a.fecha:= random(31)+ 1;
        writeln (' la fecha es: ', a.fecha); 
        a.nota:= random(11);
        writeln (' la nota es. ', a.nota); 
    end;
end;

procedure agregarAdelante (var l: lista; a:alumno);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:= a;
    nuevo^.sig:= l;
    l:= nuevo;
end;

procedure cargararbol(var a: arbol; alu: alumno);
begin 
    if (a = nil) then begin
        new(a);
        a^.dato.finales:= nil;
        a^.dato.leg:= alu.legajo;
        agregarAdelante(a^.dato.finales,alu);
        a^.hi:= nil;
        a^.hd:= nil;
    end
    else begin
        if (alu.legajo < a^.dato.leg) then
            cargararbol(a^.hi, alu)
        else
            cargararbol(a^.hd, alu);
    end;
end;


procedure cargar (var a: arbol); 
var 
	alu: alumno; 
begin 
	leeralumno(alu); 
	while (alu.legajo <> 0) do begin
		cargararbol (a, alu); 
		leeralumno(alu); 
	end; 
end; 

procedure incisoGG(l: lista ; var cantimpares: integer);
begin
    if (l <> nil)then begin
        if (l^.dato.legajo mod 2 = 1) then 
                cantimpares:= cantimpares + 1;
        incisoGG(l^.sig, cantimpares);
    end;
end;


procedure incisob (a: arbol; var cantimpares: integer);
begin 
    if (a<>nil) then begin 
        incisob (a^.hi, cantimpares);
        incisoGG(a^.dato.finales, cantimpares);
        incisob (a^.hd, cantimpares); 
    end; 
end; 

var
    a: arbol;
    cantimpares: integer; 
begin
    randomize;
    a:= nil;
	cantimpares:= 0; 
	cargar (a);
    incisob (a, cantimpares); 
    writeln (' la cantidad de alumnos con legajo impar es de: ', cantimpares);
end.
