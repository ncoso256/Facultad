{Redictado de CADP 2023 - PARCIAL 3RA FECHA (13/12)

TEMA 1

Una tienda virtual necesita un programa para administrar la información de sus clientes. 
De cada cliente se lee: número, DNI, apellido y nombre, fecha de nacimiento (día, mes y año), nivel (1..5) y puntaje. 
La lectura finaliza cuando se lee el cliente con DNI 33444555, que debe procesarse.

Se pide:

A) Generar una estructura que contenga número, apellido y nombre de aquellos clientes con DNI compuesto solamente por dígitos impares.

B) Informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000.

C) Implementar un módulo que elimine, de la estructura generada, la información relacionada a un número de cliente recibido por parámetro. 
Tener en cuenta que dicho número puede no existir en la estructura.
}


program parcial;
type
	rangodia = 1..31;
	rangomes = 1..12;
	fec = record
		dia: rangodia;
		mes: rangomes;
		anio: integer;
	end;
	rangonivel = 1..5;
	totalizador = record
		maxpuntaje,minpuntaje: integer;
		maxnivel,minnivel: integer;
	end;
	cliente = record
		numero: integer;
		dni: integer;
		apeynom: string;
		fecha: fec;
		nivel: rangonivel;
		puntaje: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: cliente;
		sig: lista;
	end;
	nuevaestructura = record
		numero: integer;
		apynom: string;
	end;
	lista2 = ^nodo2;
	nodo2 = record
		dato: nuevaestructura;
		sig: lista2;
	end;
	vectorcontador = array[rangonivel] of real;
procedure leerfecha(var f: fecha);
begin
	readln(f.dia);
	readln(f.mes);
	readln(f.anio);
end;

procedure leer(var c: cliente);
var
	f: fecha;
begin
	readln(c.numero);
	readln(c.dni);
	readln(c.apeynom);
	leerfecha(f);
	readln(c.puntaje);
end;

procedure agregaradelante(var l: lista; c: cliente);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= c;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarlista(var l: lista);
var
	c: cliente;
begin
	repeat
		leercliente(c);
		agregaradelante(l,c);
	until(c.dni = 33444555);
end;

function digimpares(dni: integer): boolean;
var
	dig: integer;
	cantimpares: integer;
	ok: boolean;
begin
	cantimpares:= 0;
	while (dni <> 0) do begin
		dig:= dni mod 10;
		if (dig <> 0) then
			ok:= true;
		dni:= dni div 10;
	end;
	digimpares:= ok;
end;

procedure agregaradelante2(var l2: lista2; n: nuevaestructura);
var
	nue: lista2;
begin
	new(nue);
	nue^.dato:= n;
	nue^.sig:= l2;
	l2:= nue;
end;

procedure agregardatos(num: integer; apynom: string; var l2: lista);
var
	n: nuevaestructura;
begin
	n.numero:= num;
	n.apynom:= apynom;
	agregaradelante2(l2,n);
end;

procedure inicializar(var vc: vectorcontador);
var
	i: integer;
begin
	for i:= 1 to 5 do 
		vc[i]:= 0;
end;



procedure recorrerlista(l: lista; var l2:lista; var vc: vectorcontador);
begin
	inicializar(vc);
	while (l <> nil) do begin
		if (digimpares(l^.dato.dni)) then begin
			agregardatos(l^.dato.numero,l^.dato.apeynom,l2);
		end;
		if (l^.dato.fecha.anio < 2000) then
			vc[l^.dato.nivel]:= vc[l^.dato.nivel] + l^.dato.puntaje;
		l:= l^.sig;
	end;
end;


procedure maximoyminimo(var t: totalizador; puntaje: real; nivel: rangonivel);
begin
	if (puntaje > t.maxpuntaje) then begin
		t.maxpuntaje:= puntaje;
		t.maxnivel:= nivel;
	end;
	if (puntaje < t.minpuntaje) then begin
		t.minpuntaje:= puntaje;
		t.minnivel:= nivel;
	end;
end;

procedure inicializartot(var t: totalizador);
begin
	t.maxpuntaje:= -1;
	t.minpuntaje:= 9999;
end;

procedure maximoyminimo(v: vectorcontador);
var
	i: integer;
	t: totalizador;
begin
	inicializartot(t);
	for i:= 1 to 5 do 
		maximoyminimo(t,v[i],i);
	writeln(t.maxnivel);
	writeln(t.minnivel);
end;

procedure eliminar (Var pI: listaE; valor:integer);
Var
 actual,ant:listaE;
Begin
  actual:=pI; 
  while (actual <> nil) and (actual^.dato.numero <> valor) do begin
    ant:=actual; 
    actual:= actual^.sig;
  end;
  if (actual <> nil) then
    if (actual = pI) then 
      pI:= pI^.sig
    else
     ant^.sig:= actual^.sig;
    
    dispose (actual);
End;

var
	l: lista;
	l2: lista2;
	v: vectorcontador;
	unnumero: integer;
begin
	l:= nil;
	l2:= nil;
	cargarlista(l);
	recorrerlista(l,l2);
	maximoyminimo(v);
	readln(unnumero);
	eliminar(l2,unnumero);
end.
