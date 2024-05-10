```pascal
program siete;
type
	str20 = string[20];
	centro = record
		nombre: str20;
		uni: str20;
		cantinvest: integer;
		cantbec: integer;
	end;

procedure leerdatos(var c: centro);
begin
	with c do begin
		readln(uni);
		readln(nombre);
		readln(cantinvest);
		readln(cantbec);
	end;
end;

procedure max(c: centro; var maxcantinvest: integer; var unimax: string);
begin
	if (c.cantinvest > maxcantinvest) then begin
		maxcantinvest:= c.cantinvest;
		unimax:= c.uni;
	end;
end;

procedure min(c: centro; var mincantbec1,mincantbec2: integer ; var mincen1,mincen2: string);
begin
	if (c.cantbec <  mincantbec1) then begin
		mincantbec2:= mincantbec1;
		mincantbec1:= c.cantbec;
		mincen2:= mincen1;
		mincen1:= c.nombre;
	end
	else if(c.cantbec < mincantbec2) then begin
		mincantbec2:= c.cantbec;
		mincen2:= c.nombre;
	end;
end;

var
	cen: centro; 
	centros,cantbecmin1, cantbecmin2, maxinvest: integer;
	maxuni,cenmin1, cenmin2: string;
begin
	centros:= 0;
	cantbecmin1:= 9999;
	cantbecmin2:= 9999;
	maxinvest:= -1;
	maxuni:= '';
	leerdatos(cen);
	while (cen.cantinvest <> 0) do begin
		centros:= centros + 1;
		max(cen,maxinvest,maxuni);
		min(cen,cantbecmin1, cantbecmin2, cenmin1, cenmin2);
	end;
	writeln(centros);
	writeln(maxinvest, maxuni);
	writeln(cantbecmin1, cantbecmin2, cenmin1, cenmin2);
end.
