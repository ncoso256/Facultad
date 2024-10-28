//Una revista deportiva dispone de información de los jugadores de básquet participantes de la liga profesional 2022. 
//De cada jugador se conoce código de jugador, apellido y nombres, código de equipo (1.20), safio de nacimiento y 
//la calificación obtenida para cada una de las 18 fechas del torneo ya finalizado. La calificación es numérica de 0 a 10,
// donde el valor 0 significa que el jugador no ha participado de la fecha. 

//Se solicita:

//a. Informar para cada equipo la cantidad de jugadores menores de 30 años.
// b. Informar los códigos de los 2 jugadores con menor calificación promedio en los partidos en los que participă. 
//Solo deben considerarse a los jugadores que participaron en más de 9 fechas.

//c. (COMPLETO) Implementar e invocar a un módulo que genere una lista con los jugadores cuyo código posee exactamente 2 
//digitos pares y haya nacido entre 1987 y 1991. La lista debe estar ordenada por código de jugador.

program parcial;
type
	rangoequipo = 1..20;
	rangofechas = 1..18;
	rangonotas = 0..10;
	vector = array[rangofechas]of rangonotas; 
	jugador = record
		codjugador: integer;
		apeynom: string;
		codequipo: rangoequipo;
		anio: integer;
		calificacion: vector;
	end;
	totalizador = record
		codmin1,codmin2: integer;
		cantmin1,cantmin2: real;
	end;
	vectorcontador = array[rangoequipo] of integer;
procedure inicializar(var v: vectorcontador);
var
	i: integer;
begin
	for i:= 1 to 20 do
		v[i]:= 0;
end;

procedure informar(vc: vectorcontador);
var
	i: integer;
begin
	for i:= 1 to 20 do
		writeln(i,vc[i]);
end;

procedure prome(v: vector; var prom: real);
var
	sum,fechas,i: integer;
begin
	for i:= 1 to 18 do begin
		if (v[i] > 0) then begin
			fechas:= fechas + 1;
			sum:= sum + v[i];
		end;
	end;
	if (fechas > 9) then 
		prom:= sum / fechas;
end;

procedure totalizador(var t: totalizador);
begin
	t.cantmin1:= 9999;
	t.cantmin2:= 9999;
end;

procedure actualizarminimo(var t: totalizador; prom: real; codequipo:rangoequipo);
begin
	
	if (prom < t.cantmin1) then begin
		t.cantmin2:= t.cantmin1;
		t.codmin2:= t.codmin1;
		t.cantmin1:= prom;
		t.codmin1:= codequipo;
	end
	else
		if (prom < t.cantmin2) then begin
			t.cantmin1:= prom;
			t.codmin2:= codequipo;
		end;
end;

function digpares(cod: integer): boolean;
var
	dig: integer;
	pares: integer;
begin
	while (cod <> 0) do begin
		dig:= cod mod 10;
		if (dig mod 2 = 0) then
			pares:= pares + 1;
		cod:= cod div 10;
	end;
	digpares:= (pares = 2);
end;

procedure insertarordenado(var l: lista; j: jugador);
var
	act,ant,nue: lista;
begin
	new(nue);
	nue^.dato:= j;
	act:= l;
	ant:= l;
	while (act <> nil) and (j.codjugador > act^.dato.codjugador) do begin
		ant:=act ;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure recorrer(l: lista; var l2: lista);
var
	vc: vectorcontador;
	t: totalizador;
	promedio: real;
begin
	inicializar(vc);
	inicializartot(t);
	while (l<> nil) do begin
		promedio:= 0;
		if ((2022 - l^.dato.anio) < 30) then
			vc[l^.dato.codequipo]:=vc[l^.dato.codequipo] + 1;
		prome(l^.dato.calificacion,promedio);
		actualizarminimo(t,promedio,l^.dato.codequipo);
		if (digpares(l^.dato.codjugador)) and((l^.dato.anio >= 1987)and(l^.dato.anio <= 1991)) then
			insertarordenado(l2,l^.dato);
		l:= l^.sig;
	end;
	informar(vc);
	writeln(t.codmin1);
	writeln(t.codmin2);
end;

var
	l,l2: lista;
begin
	l2:= nil;
	cargarlista(l); // se dispone
	recorrer(l,l2);
end.
