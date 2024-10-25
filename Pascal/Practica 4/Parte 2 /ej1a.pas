program unoa;
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

function buscar(a: numeros; dl: integer; valor: integer):boolean;
var
	pos: integer;
	esta: boolean;
begin
	esta:= false;
	pos:= 1;
	while ((pos <= dl) and (not esta)) do begin
		if(a[pos] = valor) then esta:= true
		else
			pos:= pos + 1;
	end;
	buscar:= esta;
end;

var
	vn: numeros;
	diml, valor: integer;
begin
	cargar(vn,diml);
	writeln('escriba otro valor'); readln(valor);
	writeln('El elemento ', valor , 'se encuentra en el vector?'); writeln(buscar(vn,diml,valor));
end.
