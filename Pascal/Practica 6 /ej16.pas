program ej16p6;
type
	totalizador = record
		nombre: string;
		cantcorredores: integer;
		kmtotales: real;
	end;	
	corredor = record
		nomyape: string;
		distancia: real;
		tiempo: integer;
		pais: string;
		ciudadp: string;
		ciudadf: string;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: corredor;
		sig: lista;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato2: totalizador;
		sig: lista2;
	end;
	
procedure leercorredor(var c: corredor);
begin
	readln(c.nomyape);
	readln(c.distancia);
	readln(c.tiempo);
	readln(c.pais);
	readln(c.ciudadp);
	readln(c.ciudadf);
end;
procedure agregaradelante(var l: lista; c: corredor);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= c;
	nue^.sig:= l;
	l:= nue;
end;

procedure inicializar(var t: totalizador);
begin
	t.nombre:= '';
	t.cantcorredores:= 0;
	t.kmtotales:= 0;
end;

procedure cargarlista(var l: lista);
var
	c: corredor;
begin
	leercorredor(c);
	while (c.distancia <> -1) do begin
		agregaradelante(l,c);
		leercorredor(c);
	end;
end;

procedure insertaraux (var l2: lista2; c:corredor);
var
	aux: lista2;
	nue: lista2;
begin
	aux:= l2;
	while (aux <> nil) and(aux^.dato2.ciudadp <> c.ciudadp) do begin
		aux:=aux^.sig;
	end;
	if(aux^.dato2.ciudadp = c.ciudadp)then begin
		aux^.dato2.cantcorredores:= aux^.dato2.cantcorredores + 1;
		aux^.dato2.kmrecorridos:= aux^.dato2.kmrecorridos + c.distancia;
	end
	else begin
		new(nue);
		nue^.dato2.ciudadp:= c.ciudadp;
		nue^.dato2.cantcorredores:= 1;
		nue^.dato2.kmrecorridos:= c.distancia;
		nue^.sig:= aux;
	end;
end;

procedure ciudadmax(l2: lista2);

procedure recorrerlista(l: lista);
var
	aux: lista;
	aux2: lista2;
	cantcorredor,tiempototal,cantbr,ciudadpaf,cantboston: integer;
	disttotal: real;
	suma,paso,sumacorredores: real;
begin
	aux:= l;
	disttotal:= 0;
	cantcorredor:= 0;
	tiempototal:= 0;
	suma:= 0;
	cantbr:= 0;
	ciudadpaf:= 0;
	cantboston:= 0;
	sumacorredores:= 0;
	paso:= 0;
	while (aux <> nil) do begin
		cantcorredor:= cantcorredor + 1;
		disttotal:= disttotal + aux^.dato.distancia;
		tiempototal:= tiempototal + aux^.dato.tiempo;
		insertaraux(l2,aux^.dato);
			
		if (aux^.dato.pais = 'Brasil') then begin
			suma:= suma + aux^.dato.distancia; 
			cantbr:= cantbr + 1;
		end;
		if (aux^.dato.ciudadp <> aux^.dato.ciudadf) then
			ciudadpaf:= ciudadpaf + 1;
		if (aux^.dato.ciudadp = 'Boston')then
			paso:= aux^.dato.tiempo / aux^.dato.distancia;
			cantboston:= cantboston + 1; 
			sumacorredores:= sumacorredores + paso;
		end;
		aux:= aux^.sig;
	end;
	writeln();
	writeln(cantcorredor);
	writeln(disttotal);
	writeln(tiempototal);
	writeln(suma / cantbr);
	writeln(sumacorredores / cantboston);
end;

var
	l: lista;
begin
	l:= nil;
	cargarlista(l);
	recorrerlista(l);
end.
