program ejercicio2;
 type
    
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
	end;
	lista = ^nodo; {acomode la lista}
	nodo = record
		dato: persona;
		sig: lista;
	end;
 procedure leerPersona(var p: persona); {le faltaba ser por referencia}
 begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
         read(p.apellido);
    end;
 end; {faltaba el end}
 
 {Agrega un nodo a la lista}
 procedure agregarAdelante(var l:lista;p:persona); {estaba declarado despues de ser invocado} {necesitaba que sea por referencia}
 var
    aux: lista;
 begin
	aux:= l; {faltaba esta linea}
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
 end; 
 
 {Carga la lista hasta que llega el dni 0}
 procedure generarLista(var l:lista);
 var
    p:persona; 
 begin
    leerPersona(p); {se esperaba una persona}
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);
    end;
 end;
 procedure imprimirInformacion(var l:lista);
 begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:',l^.dato.nombre, 'Apellido:', l^.dato.apellido); {a nombre y apellido le faltaban .dato.nombre y .dato.apellido}
        l:= l^.sig;
     end;
 end;
 {habia un end de mas}

  {Programa principal}
 var
    l:lista;
 begin
    generarLista(l);
    imprimirInformacion(l);
 end.
