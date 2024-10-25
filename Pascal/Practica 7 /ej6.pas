program ej6p7;

type
	lista = ^nodo;
	obj= 1..7;
	objeto = record
		codigo: integer;
		clasificacion:obj;
		nombre: string;
		distancia: real;
		descubridor: string;
		anio: integer;
	end;
	nodo = record
		elem: objeto;
		sig: lista;
	end;
	vector = array [obj] of integer;

procedure leerobjeto(var o: objeto);
begin
	writeln('Ingrese codigo del objeto: ');
	readln(o.codigo);
	if (o.codigo <> -1) then begin
		writeln('Ingrese clasificacion del objeto: ');
		readln(o.clasificacion);
		writeln('Ingrese nombre del objeto: ');
		readln(o.nombre);
		writeln('Ingrese distancia a tierra en años luz del objeto: ');
		readln(o.distancia);
		writeln('Ingrese nombre del descubridor del objeto: ');
		readln(o.descubridor);
		writeln('Ingrese año del descubrimiento del objeto: ');
		readln(o.anio);
	end;
end;

procedure agregaratras(var l: lista; o: objeto);
var
	aux,aux2: lista;
begin
	new(aux);
	aux^.elem:= o;
	aux^.sig:= nil;
	if (l <> nil) then begin
		l:= aux;
	end
	else begin
		aux2:= l;
		while (aux2^.sig<> nil) do begin
			aux2:= aux2^.sig;
		end;
		aux2^.sig:= aux;
	end;
end;

procedure cargarlista(var l: lista);
var
	o: objeto;
begin
	leerobjeto(o);
	while (o.codigo <> -1) do begin
		agregaratras(l,o);
		leerobjeto(o);
	end;
end;

procedure inicializarvector(var v: vector);
var
	i: obj;
begin
	for i:= 1 to 7 do begin
		v[i]:= 0;
	end;
end;

procedure distanciamaxima(o: objeto; var dismax1,dismax2: real; var codedia1,codedia2: integer);
begin
	if (o.distancia > dismax1) then begin
		dismax2:= dismax1;
		codedia2:= codedia1;
		dismax1:= o.distancia;
		codedia1:= o.codigo;
	end
	else begin
		if (o.distancia > dismax2) then begin
			dismax2:= o.distancia;
			codedia2:= o.codigo;
		end;
	end;
end;

function check(n: integer):boolean;
var
	par,imp,aux: integer;
	ok: boolean;
begin
	ok:= false;
	aux:= n;
	par:= 0;
	imp:= 0;
	while (aux <> 0) do begin
		if (aux mod 2 =0) then begin
			par:= par + 1;
		end
		else begin
			imp:= imp+ 1;
		end;
		aux:= aux div 10;
	end;
	if (par >imp) then begin
		ok:= true;
	end;
	check:= ok;
end;

procedure imprimirvector(v: vector);
var
	i: obj;
begin
	for i:= 1 to 7 do begin
		writeln('La cantidad de objetos de la categoria ', i,' es de: ', v[i]);
	end;
end;

procedure analizar(l: lista; var v: vector);
var
	dismax1,dismax2: real;
	codedia1,codedia2,cantgalileo: integer;
begin
	cantgalileo:= 0;
	inicializarvector(v);
	dismax1:= -1;
	dismax2:= -1;
	while (l<>nil) do begin
		distanciamaxima(l^.elem, dismax1,dismax2,codedia1,codedia2);
		if (l^.elem.descubridor = 'Galilleo Gallilei') and (l^.elem.anio < 1600) and (l^.elem.clasificacion = 2)then begin
			cantgalileo:= cantgalileo + 1;
		end;
		v[l^.elem.clasificacion]:= v[l^.elem.clasificacion] + 1;
		if (l^.elem.clasificacion = 2) then begin
			if (check(l^.elem.codigo))then begin
				writeln('La estrella llamada ' , l^.elem.nombre, 'tiene un codigo con mas digitos pares que impares');
			end;
		end;
		l:= l^.sig;
	end;
	writeln('los codigos de los 2 objetos mas lejanos a la tierra son: ', codedia1,' y ', codedia2);
	writeln('La cantidad de planetas descubiertos por Gallileo Gallilei antes del año 1600 es del ', cantgalileo);
	imprimirvector(v);
end;

var
	pri: lista;
	v: vector;
begin
	pri:= nil;
	cargarlista(pri);
	analizar(pri,v);
end.
