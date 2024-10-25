program vectores;  {ejercicio 2ayb}
const
	cant_datos = 4; {150}
type
	vdatos = array[1..cant_datos] of real;
	
procedure cargarvector(var v: vdatos; var diml: integer);
var
	numero: real;
begin
	readln(numero);
	while (numero <> 0) and (diml < cant_datos) do begin
		diml:= diml + 1;
		v[diml]:= numero;
	    if (diml < cant_datos) then begin
			readln(numero);
		end;
	end;
end;
procedure modificarvectorysumar(var v: vdatos; diml: integer; n: real; var suma: real);
var
	i: integer;
begin
	for i:= 1 to diml do begin
		v[i] := v[i] + n ;
		suma:= suma + v[i];
	end;
end;

var
	datos: vdatos;
	i,dim: integer;
	num,suma: real;
begin
	dim:= 0;
	suma:= 0;
	cargarvector(datos , dim);
	writeln('Ingrese un valor a sumar');
	readln(num);
	modificarvectorysumar(datos,dim, num,suma);
	writeln('La suma de valores es: ', suma:0:2);
	writeln('Se procesaron: ',dim, ' numeros');
end.
