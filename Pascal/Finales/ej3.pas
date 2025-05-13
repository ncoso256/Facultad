program batallanaval;
type
	filas = 1..20;
	columnas = 1..15;
	tablero = array[filas,columnas]of boolean;
	tablero2 = array[filas,columnas] of boolean;
	nave = 0..1;

procedure cargarvector(var v: tablero);
var
	haynave: nave;
	i,j,cantbarcos: integer;
	ok: boolean;
begin
	cantbarcos:= 0;
	for i:= 1 to 20 do 
		for j:= 1 to 15 do begin
			readln(haynave);	
			
			if (haynave = 1)and(cantbarcos <= 7) then begin
				ok:= true;
				cantbarcos:= cantbarcos + 1;
			end
			else
				ok:= false;
				
			v[i,j]:= ok;
		end;
end;

function dameNumeroFila():integer;
var
	num: integer;
begin
	readln(num);
	dameNumeroFila:= num;
end;

function dameNumeroColumna():integer;
var
	n: integer;
begin
	readln(n);
	dameNumeroColumna:= n;
end;

procedure juego(var v:tablero; fila: integer; columna: integer; var contador: integer);
begin
	if (v[fila,columna]= true) then begin
		contador:= contador + 1;
		v[fila,columna]:= false;
	end
	else
		writeln('El barco no se hundio');
end;

procedure rondas(v1: tablero; v2: tablero2); 
var
	i,contador1,contador2: integer;
	fila: filas;
	columna: columnas;
begin
	contador1:= 0;
	contador2:= 0;
	for i:= 1 to 10 begin
		fila:= dameNumeroFila();
		columna:= dameNumeroColumna();
		juego(v1,fila,columna,contador1);
		
		fila:= dameNumeroFila();
		columna:= dameNumeroColumna();
		juego(v2,fila,columna,contador2);
	end;
	writeln(contador1);
	writeln(contador2);
end;

procedure imprimir(v: tablero);
var
	i,j: integer;
begin
	for i:= 1 to 20 do 
		for j:= 1 to 15 do
			writeln(v[i,j]);
end;

var
	v1: tablero;
	v2: tablero2;
begin
	cargarvector(v);
	cargarvector(v2);
	rondas(v,v2);
	imprimir(v);
	imprimir(v2);
end.
