program doce;
const
	df = 53;
type
	rangogalaxia = 1..4;
	tipogalaxias = array [rangogalaxia] of integer;
	galaxia = record
		nombre: string;
		tipo: rangogalaxia;
		masa,distancia: real;
	end;
	galaxias = array [1..df] of galaxia;

procedure leergalaxia(var g: galaxia);
begin
	readln(g.nombre);
	readln(g.tipo);
	readln(g.masa);
	readln(g.distancia);
end;

procedure vectcont(var tgc: tipogalaxias);
var
	i: integer;
begin	
	for i:= 1 to 4 do begin
		tgc[i]:= 0;
	end;
end;

procedure cargarvector(var gs: galaxias);
var
	i: integer;
	g: galaxia;
begin
	for i:= 1 to df do begin
		leergalaxia(g);
		gs[i]:= g;
	end;
end;

procedure maximo(masa: real; var maximo1, maximo2: real; var nombremax1, nombremax2: string; nom: string);
begin
	if (masa > maximo1) then begin
		maximo2:= maximo1;
		nombremax2:= nombremax1;
		maximo1:= masa;
		nombremax1:= nom;
	end
	else begin
		if(masa > maximo2) then begin
			maximo2:= masa;
			nombremax2:= nom;
		end;
	end;
end;

procedure minimo(masa: real; var minimo1, minimo2: real; var nombremin1,nombremin2: string; nom: string);	
begin
	if(masa < minimo1) then begin
		minimo2:= minimo1;
		nombremin2:= nombremin1;
		minimo1:= masa;
		nombremin1:= nom;
	end
	else begin
		if (masa < minimo2) then begin
			minimo2:= masa;
			nombremin2:= nom;
		end;
	end;
end;

procedure recorrer (g: galaxias; var tg: tipogalaxias; max1,max2,min1,min2: real; var nommax1,nommax2, nommin1,nommin2: string);
var
	masacumple: real;
	totalmasa: real;
	i: integer;
	cantirregulares: real;
begin
	nommax1:= '';
	nommax2:= '';
	nommin1:= '';
	nommin2:= '';
	cantirregulares:= 0;
	masacumple:= 0;
	totalmasa:= 0;
	for i:= 1 to df do begin
		tg[g[i].tipo]:= tg[g[i].tipo] + 1; // inciso a
		if (g[i].nombre = 'via lactea') or (g[i].nombre = 'andromeda') or (g[i].nombre = 'triangulo') then 
			masacumple:= masacumple + g[i].masa;
		totalmasa:= totalmasa + g[i].masa;
		if (g[i].tipo <> 4) and(g[i].distancia < 1000) then
			cantirregulares:= cantirregulares + 1;
		maximo(g[i].masa,max1,max2,nommax1,nommax2,g[i].nombre);
		minimo(g[i].masa,min1, min2,nommin1,nommin2,g[i].nombre);
	end;
	writeln((masacumple*100)/totalmasa); //b
	writeln(cantirregulares); //c
end;

var
	g: galaxias;
	tg: tipogalaxias;
	max1,max2,min1,min2: real;
	nommax1,nommax2, nommin1,nommin2: string;
begin
	max1:= -1;
	max2:= -1;
	min1:= 9999;
	min2:= 9999;
	vectcont(tg);
	cargarvector(g);
	recorrer(g,tg,max1,max2,min1,min2,nommax1,nommax2, nommin1,nommin2);
	writeln(tg[1]); //a
	writeln(tg[2]);
	writeln(tg[3]);
	writeln(tg[4]);
	writeln(nommax1); //d
	writeln(nommax2);
	writeln(nommin1);
	writeln(nommin2);
end. // modularize re mal no se que onda
