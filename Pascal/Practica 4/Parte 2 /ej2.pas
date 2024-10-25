program dos; 
const
	df = 500;
type
	vector = array[1..df] of string;

procedure cargarvector(var v: vector; var diml: integer); //a
var
	alumno: string;
begin
	diml:= 0;
	writeln('Escriba un nombre'); readln(alumno);
	while(alumno <> 'ZZZ') and (diml < df) do begin
		diml:= diml + 1;
		v[diml]:= alumno;
		writeln('Escriba un nombre'); readln(alumno);
	end;
end;

procedure eliminar(var v: vector; var dl: integer; var pude:boolean; pos: integer);
var
	i: integer;
begin
	pude:= false;
	if ((pos >= 1) and (pos <= dl)) then begin // verifico si la posicion es valida
		
		for i:= pos to (dl-1) do // corro los elementos empezando desde la posicion hasta la dimension logica-1 para tapar el elemento a eliminar
			v[i]:= v[i+1];
	
		pude:= true; // registro que se pudo realizar decremento la dimension logica
		dl:= dl - 1;
	end;
end;

procedure insertar(var v: vector; var dl: integer; var pude: boolean; alu: string; pos: integer);
var
	i: integer;
begin
	pude:= false;
	if ((dl + 1) <= df) and (pos >= 1) and (pos <= dl) then begin // verifico si hay espacio y si la posicion es valida
		
		for i:= dl downto pos do
			v[i+1]:= v[i]; // corro los elementos empezando desde atras hasta la posicion a insertar para hacer el hueco donde se va a insertar el elemento
			
		pude:= true; // registro que se pudo realizar
		v[pos]:= alu; // inserto el elemento
		dl:= dl + 1; // incremento la dimension logica
	end;
end;

procedure agregar(var v: vector; var dl: integer; var pude: boolean; alu: string);
begin
	pude:= false;
	
	if ((dl + 1)<= df) then begin // verifico si hay espacio
		pude:= true; // registro que se pudo realizar
		dl:= dl + 1; // incremento la dimension logica
		v[dl]:= alu; // agrego elemento
	end;
end;

var
	v: vector;
	diml, pos: integer;
	valor: string;
	ok: boolean;
begin
	cargarvector(v,diml); // a
	writeln('Ingrese un valor a agregar: '); readln(valor);
	agregar(v,diml,ok,valor); // d
	writeln(diml); // verifico si agrega en la ultima posicion
	writeln('ingrese un nombre que quiera insertar al vector'); readln(valor);
	writeln('ingrese la posicion que quiera aniadir al vector: '); readln(pos);
	insertar(v,diml,ok,valor,pos); //c
	writeln(v[4]); // valor prueba que quiero usar
	writeln('Escriba la posicion a eliminar '); readln(pos);
	eliminar(v,diml,ok,pos); //b
	writeln(v[1]); // puse de prueba el uno porque pinto probar
end.
