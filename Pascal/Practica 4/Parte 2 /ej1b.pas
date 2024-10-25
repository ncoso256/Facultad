program unob;
const
	dimf = 500;
type
	numeros = array[1..dimf] of integer;

procedure cargar(var vn: numeros; var diml: integer);
var
	numero: integer;
begin
	diml:= 0;
	writeln('Escriba un numero entero que no sea 0'); readln(numero);
	while(numero <> 0) and (diml < dimf) do begin
		diml:= diml + 1;
		vn[diml]:= numero;
		writeln('Escriba un numero entero que no sea 0'); readln(numero);
	end;
end;

function existe(a: numeros; dl: integer; valor: integer):boolean;
var
	pos: integer;
begin
	pos:= 1;
	
	while((pos <= dl) and (a[pos] < valor)) do begin
		pos:= pos +1;
	end;
	if((pos <= dl) and(a[pos]= valor)) then existe:= true
	else existe:= false;
end;

var
	vn: numeros;
	diml, valor: integer;
begin
	cargar(vn,diml);
	writeln('escriba otro valor'); readln(valor);
	writeln('El elemento ', valor , ' se encuentra en el vector?'); writeln(existe(vn,diml,valor));
end.
