program once;
const
	df = 200;
type
	pagina = record
		titulo: string;
		autor: string;
		cantmg,cantclick,cantcoms: integer;
	end;
	fotos = array [1..df] of pagina;

procedure leerpagina(var p: pagina);
begin
	readln(p.titulo);
	readln(p.autor);
	readln(p.cantmg);
	readln(p.cantclick);
	readln(p.cantcoms);
end;

procedure cargarvector(var vf: fotos);
var
	i: integer;
	p: pagina;
begin
	for i:= 1 to df do begin
		leerpagina(p);
		vf[i]:= p;
	end;
end;

procedure maximo(cantidadclicks: integer; var max: integer; titulomax:string; var titulo: string);
begin
	if (cantidadclicks > max) then begin
		max:= cantidadclicks;
		titulo:= titulomax;
	end;
end;

procedure recorrer(vf: fotos; var cant: integer);
var
	i: integer;
	max: integer;
	tit: string;
	cantc: integer;
begin
	max:= -1;
	tit:= '';
	cant:= 0;
	for i:= 1 to df do begin
		cantc:= 0;
		if (vf[i].autor = 'Art Vandelay') then
			cant:= cant + vf[i].cantmg;
		maximo(vf[i].cantclick, max, vf[i].titulo, tit);
		cantc:= cantc + vf[i].cantcoms;
	end;
	writeln(cantc);
end;

var
	v: fotos;
	cant: integer;
begin
	cargarvector(v);
	recorrer(v,cant);
	writeln(cant); // art vandelay
end.
