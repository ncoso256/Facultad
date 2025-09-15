{
1. El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:

a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.

d) Un módulo recursivo que retorne el monto total acumulado de las expensas.

}

program uno;
const
	dimf = 300;
type
	oficina = record
		codid: integer;
		dni: integer;
		valorexp: real;
	end;
	indice = 1..dimf;
	vector = array [indice] of oficina;

procedure leeroficina(var o: oficina);
begin
	readln(o.codid);
	if (o.codid <> 0) then begin 
		readln(o.dni);
		readln(o.valorexp);
	end;
end;

procedure cargarvector(var v: vector; var diml:integer);
var
	o:oficina;
begin
	leeroficina(o);
	while(o.codid <> 0) do begin
		diml:= diml + 1;
		v[diml]:= o;
		leeroficina(o);
	end;
end;	

procedure insercion (var v: vector; diml: integer);
var
	i,j: integer;
	actual: integer;
begin
	for i:= 2 to diml do begin
		actual:= v[i].codid;
		j:= i - 1;
		while (j > 0) and (v[j].codid > actual) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1].codid:= actual;
	end;
end;

function dicotomica(v:vector; dl: integer; codid: integer): boolean;
var
	pri,ult,medio: integer;
	ok: boolean;
begin
	ok:= false;
	pri:= 1;
	ult:= dl;
	medio:= (pri+ult) div 2;
	while(pri <= ult) and(codid <> v[medio].codid) do begin
		if (codid < v[medio].codid) then 
			ult:= medio - 1
		else
			pri:= medio + 1;
		medio:= (pri + ult) div 2;
	end;
	if (pri <= ult) and(codid = v[medio].codid) then 
		ok:= true;
	dicotomica:= ok;
end;

procedure busquedadicotomica(v:vector;dl:integer;codid: integer);
begin
	if (dicotomica(v,dl,codid) = true) then 
		writeln('El codigo de identificacion ', codid, 'ha sido encontrado')
	else
		writeln('El codigo de identificacion ', codid, 'no sido encontrado');
end;

procedure informarrecursivo(v:vector ; diml:integer; var mt: real);
begin
	if (diml > 0) then begin
		mt:= mt + v[diml].valorexp;
		informarrecursivo(v,diml-1,mt);
	end; 
end;

var
	v: vector;
	diml,codid: integer;
	montototal: real;
begin
	diml:= 0;
	montototal:= 0;
	cargarvector(v,diml);
	insercion(v,diml);
	readln(codid);
	busquedadicotomica(v,diml,codid);
	informarrecursivo(v,diml,montototal);
	writeln(montototal);
end.
