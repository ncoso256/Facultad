{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.

b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.

c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program dos;
const
	max = 300;
type
	oficina = record
		codid: integer;
		dniprop: integer;
		valorexp: integer;
	end;
	vector = array[1..max] of oficina;

procedure leeroficina(var o: oficina);
begin
	readln(o.codid);
	if (o.codid <> -1) then begin
		readln(o.dniprop);
		readln(o.valorexp);
	end;
end;

procedure cargarvector(var v:vector;var diml:integer);
var
	o: oficina;
begin
	diml:= 0;
	leeroficina(o);
	while (o.codid <> -1)and (diml< max) do begin
		diml:= diml + 1;
		v[diml]:= o;
		leeroficina(o);
	end;
end;

procedure ordenar_por_insercion_por_codigo(var v: vector; diml: integer);
var
	i,j: integer;
	actual: integer;
	actual2: vector;
begin
	for i:= 2 to diml do begin 
		actual:= v[i].codid;
		actual2 := v[i];
		j:= i-1;
		while (j > 0) and (v[j].codid > actual) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual2;
	end; 
end;



procedure ordenar_por_seleccion_por_codigo(var v: vector; diml: integer);
var
	i,j,pos: integer;
	item: integer;
begin
	for i:= 1 to diml-1 do begin {Busca el minimo y guarda en pos la posicion}
		pos:= i;
		for j:= i+1 to diml do begin
			if (v[j].codid < v[pos].codid) then
				pos:= j;
			
			{Intercambia v[i] y v[j]}
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item
		end;
	end;
end;

var
	vec: vector;
	dimlog: integer;
begin
	cargarvector(vec,dimlog);
	ordenar_por_insercion_por_codigo(vec,dimlog);
	ordenar_por_seleccion_por_codigo(vec,dimlog);
end.
