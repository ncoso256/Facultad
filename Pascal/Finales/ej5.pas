{
 
 1. La facultad de informatica organizara el congreso WICC, en donde se expondran trabajos de investigacion.
 Realizar un programa que lea informacion de cada publicacion: titulo de la publicacion, nombre del autor, dni del autor y tipo de publicacion (1..12).
 La lectura de publicaciones finaliza al ingresar un dni de autor con valor 0 (el cual no debe procesarse). 
 La informacion se lee ordenada por dni del autor y un autor puede tener varias publicaciones. 
 Se pide escribir un programa que : 
	a. Informe el tipo de publicacion con mayor cantidad de publicaciones.
	b. Informar para cada autor la cantidad de publicaciones presentadas.
}

program uno;
type
	cadena50 = string[50];
	rangotipo = 1..12;
	publicacion = record
		titulo: cadena50;
		nombre: cadena50;
		dni: integer;
		tipo: rangotipo;
	end;
	vector = array [rangotipo] of integer;
	
procedure leerpublicacion(var p: publicacion);
begin
	writeln('Ingrese el dni de su autor: '); 
	readln(p.dni);
	if (p.dni <> 0) then begin
		writeln('Ingrese el titulo de su publicacion: ');
		readln(p.titulo);
		writeln('Ingrese el nombre del autor: ');
		readln(p.nombre);
		writeln('Ingrese un numero entre 1 y 12 para el tipo de publicacion: ');
		readln(p.tipo);
	end;
end;

procedure inicializar (var v: vector);
var
	i: integer;
begin
	for i:= 1 to 12 do
		v[i]:= 0;
end;

procedure maximovc(v: vector);
var
	i: integer;
	maxcant,maxtipo: integer;
begin
	maxcant:= -1;
	maxtipo:= -1;
	for i:= 1 to 12 do begin
		if (v[i] > maxcant) then begin
			maxcant:= v[i];
			maxtipo:= i;
		end;
	end;
	writeln('El maximo tipo de publicacion es de : ' , maxtipo);
	writeln('La maxima cantidad de publicaciones son de : ', maxcant);
end;

procedure procesarpublicaciones(var p: publicacion; var v: vector);
var
	actual,cantautor: integer;
begin
	leerpublicacion(p);
	while (p.dni <> 0)do begin
		actual:= p.dni;
		cantautor:= 0;
		while (p.dni <> 0) and (actual = p.dni) do begin 
			cantautor:= cantautor + 1;
			v[p.tipo]:= v[p.tipo] + 1;
			leerpublicacion(p);
		end;
		writeln('La cantidad de autor con el mismo dni es de : ', cantautor);
	end;
	maximovc(v);
end;


var
	p: publicacion; 
	v: vector;
{
calculo memoria estatica: 
 
 publicacion = 51+51+6+6 = 51+51= 102+12 = 114
 vector = 12*6 = 72
 * 
 * 
 * 
 total = 114 + 72 = 186 = memoria estatica
}
begin
	inicializar(v);
	procesarpublicaciones(p,v);
end.

