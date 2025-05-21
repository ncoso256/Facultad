{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la información de los productos que mantiene actualmente en stock.
Para ello, se conoce la siguiente información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom,Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). 
La información de los microprocesadores se lee de forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no debe procesarse).
Se pide implementar un programa que lea información de los microprocesadores de la empresa importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm. 
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm. 
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz.}

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
