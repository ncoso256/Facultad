program ej1;
type
	vector = array [1..100] of char;
	veccontador = array[1..100] of integer;


procedure cargarvector(var v: vector; var diml: integer); // se dispone

procedure inicializarvector(var v: veccontador; diml: integer);
var
	i: integer;
begin
	for i:= 1 to diml do 
		v[i]:= 0;
end;

procedure recorrer(v: vector; diml: integer; vc: vectorcontador);
var
	i: integer;
begin
	for i:= 1 to diml do begin
		case v[i] of 
			'a'..'z': vc[i]:= vc[i] + 1;
			'A'..'Z': vc[i]:= vc[i] + 1;
			'0'..'9': vc[i]:= vc[i] + 1;
			else vc[i]:= vc[i] + 1;
		end;
	end;
	for i:= 1 to diml do begin
		writeln(v[i]); 
		writeln(vc[i]);
	end;
end;

var
	v: vector;
	diml: integer;
	vec: veccontador;
begin
	cargarvector(v,diml); // se dispone
	inicializarvector(vec,diml);
	recorrer(v,diml,vec);
end.
