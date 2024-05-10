program seis;
const
	intel = 'intel';
	amd = 'amd';
type
	str20 = string[20];
	microprocesadores = record
		marca: str20;
		linea: str20;
		cantcores: integer;
		ghz: real;
		tamanio: integer;
	end;
procedure leerdato(var micro: microprocesadores);
begin
	readln(micro.marca);
	readln(micro.linea);
	readln(micro.cantcores);
	readln(micro.ghz);
	readln(micro.tamanio);
end;

procedure maximo (procesador: microprocesadores; var maxmarca1, maxmarca2: string);
begin
	if (procesador.tamanio > 14) then begin
		maxmarca2:= maxmarca1;
		maxmarca1:= procesador.marca;
	end
		else
			if (procesador.tamanio > 14) then
				maxmarca2:= procesador.marca;
end;

var
	m: microprocesadores;
	maxmar1, maxmar2: string;
	maxlinea, maxmarca: string;
	cantmulti: integer;
begin
	maxlinea:= '';
	maxmarca:= '';
	maxmar1:= '';
	maxmar2:= '';
	cantmulti:= 0;
	leerdato(m);
	while (m.cantcores <> 0) do begin
		if(m.tamanio >= 22) and (m.cantcores > 2) then begin
			maxlinea:= m.linea;
			maxmarca:= m.marca;
		end;
		maximo(m,maxmar1,maxmar2);
		if (m.cantcores > 1) and (m.marca = intel) or (m.marca = amd) then
			if (m.ghz <= 2) then
				cantmulti:= cantmulti + 1;
		leerdato(m);
	end;
	writeln(maxlinea, maxmarca);
	writeln(maxmar1, maxmar2);
	writeln(cantmulti);
end. 
