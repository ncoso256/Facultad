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

d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.

coment profe: yo haría una lista para almacenar los legajos y promedios de los alumnos q superen el valor ingresado
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
	reglegprom = record
		legajos: integer;
		promedios: real;
	end;
    lista2 = ^nodo2;
    nodo2= record
		datos: reglegprom;
		sig: lista2;
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
    a.legajo:= random(10);
    writeln (' el legajo es: ',a.legajo); 
    if (a.legajo <> 0)then begin 
        a.codigo:= random(10)+ 1;
        writeln (' el codigo es: ', a.codigo);
        a.fecha:= random(31)+ 1;
        writeln (' la fecha es: ', a.fecha); 
        a.nota:= random(11);
        writeln (' la nota es: ', a.nota); 
        writeln ('-----------------------------------------------------------------');
        writeln ('');
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
    if (a = nil) then begin //Caso base: el árbol está vacío → creo un nuevo nodo para este legajo 
        new(a);
        a^.dato.finales := nil;
        a^.dato.leg := alu.legajo;  // le paso el legajo de la lista al arbol 
        agregarAdelante(a^.dato.finales, alu);// guardo este final en la lista del alumno dentro del arbol
        a^.hi := nil;
        a^.hd := nil;
    end
    else begin
        if (alu.legajo = a^.dato.leg) then //Caso 1: el legajo ya está en el árbol,no creo un nodo nuevo, simplemente agrego este final a la lista de finales de ese alumno
            agregarAdelante(a^.dato.finales, alu)

        else if (alu.legajo < a^.dato.leg) then// Caso 2: el legajo es más chico que el actual, bajo por la izquierda 
            cargararbol(a^.hi, alu)

        else// Caso 3: el legajo es más grande que el actual, bajo por la derecha 
            cargararbol(a^.hd, alu);
    end;
end;


procedure cargar (var a: arbol); {probar con recursividad}
var 
	alu: alumno; 
begin 
	leeralumno(alu); 
	while (alu.legajo <> 0) do begin
		cargararbol (a, alu); 
		leeralumno(alu); 
	end; 
end; 

//b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos conlegajo impar. No hacia falta recorrer la lista....
{procedure incisoGG(l: lista ; var cantimpares: integer);
begin
		if (l^.dato.legajo mod 2 <> 0) then 
       cantimpares:= cantimpares + 1;
    if (l <> nil)then begin
				if (l^.dato.nota >= 4) then 
					
        incisoGG(l^.sig, cantimpares);
    end;
end;}

procedure incisob (a: arbol; var cantimpares: integer);
begin 
    if (a<>nil) then begin 
        incisob (a^.hi, cantimpares);
        if (a^.dato.finales^.dato.legajo mod 2 <> 0) then 
					cantimpares:= cantimpares + 1;
        //incisoGG(a^.dato.finales, cantimpares);
        incisob (a^.hd, cantimpares); 
    end; 
end; 

//c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
//su cantidad de finales aprobados (nota mayor o igual a 4).

procedure incisofinales (l: lista; var cantaprobados: integer);
begin 
	if (l<> nil) then begin // recorro la lista
		if (l^.dato.nota >= 4) then 
			cantaprobados:= cantaprobados + 1; // si la nota es mayor o igualque 4 sumo uno al contador
		incisofinales (l^.sig, cantaprobados); // paso al siguiente nodo
	end; 
end; 

procedure incisoc (a: arbol);
var 
	cantaprobados: integer; // variable para contar la cantidad de aprobados 
begin 
	if (a<> nil) then begin
		incisoc (a^.hi);
		cantaprobados:= 0; // inicializo en 0 para cuando paso a la siguiente hoja (osea cambia el legajo), se resetea el contador de finales
		incisofinales (a^.dato.finales, cantaprobados); // le paso la lista y la variable contadora
		writeln ('el alumno con legajo: ', a^.dato.leg , ' tiene la cantidad de final/es aprobados de : ', cantaprobados); //imprimo
		incisoc (a^.hd);
	end; 
end; 

procedure calcularPromedio(l: lista; valor: real; legajo: integer; var l2: lista2);
var
    cantidad, notas: integer;
    promedio: real;
begin
	cantidad := 0;
	notas := 0;
	while (l <> nil) do begin// recorro toda la lista de finales del alumno
		cantidad := cantidad + 1;
		notas := notas + l^.dato.nota;
	
		l := l^.sig;
		
	end;
	if (cantidad > 0) then begin // pregunto si el alumno rindio finales
		promedio := notas / cantidad; // saco el promedio e informo lo que pide el inciso 
		if (promedio > valor) then begin
			writeln('El alumno con legajo ', legajo, 
				'tiene un promedio mayor al de ', valor:0:2, ' con un total de: ', promedio:0:2);
		end;
	end;
	l2^.datos.promedios:= promedio; 
	l2^.datos.legajos:= legajo;
	l2:= l2^.sig; 
end;

//d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
//retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado. lista prom y legajo

procedure incisod(a: arbol; valor: real; var l2: lista2);
begin
	if (a <> nil) then begin
		incisod(a^.hi, valor,l2); // bajo a las hojas izquierdas
		calcularPromedio(a^.dato.finales, valor, a^.dato.leg,l2);// llamo al proceso y le paso, la lista, el valor que ingrese y el legajo actual del alumno 
		incisod(a^.hd, valor,l2);// bajo a la hojas derechas
	end;
end;

var
    a: arbol;
    cantimpares: integer; 
    valor: real;
    l2: lista2;
begin
	l2:= nil;
    randomize;
    a:= nil;
	cantimpares:= 0; 
	cargar (a);
    incisob (a, cantimpares); 
    writeln (' la cantidad de alumnos con legajo impar es de: ', cantimpares);
    incisoc(a);
    writeln (' ingrese un valor real para el ultimo inciso:'); 
    readln (valor); 
    incisod(a, valor,l2); 
end.
