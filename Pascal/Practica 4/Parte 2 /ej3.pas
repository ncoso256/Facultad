program tres;

const
	DF = 200;

type
	vDias = array [1..31] of integer;
	
	viaje = record
		dia: integer;
		monto:real;
		distancia:real;
	end;
	
	vecViajes = array [1..DF] of viaje;



{inicializar vector contador de 31 días}

procedure inicializarVDias (var vecDias:vDias);
var
	i:integer;
begin
	for i:= 1 to 31 do
	begin
		vecDias[i]:= 0;
	end;
end;


{inciso a}

procedure leerViaje (var v:viaje);
begin
	writeln ('[>] Ingrese la distancia del viaje en km: ');
	readln(v.distancia);
	if (v.distancia <> 0) then
	begin
		writeln ('[>] Ingrese el dia del viaje (entre 1 y 31): ');
		readln(v.dia);
		writeln ('[>] Ingrese el monto transportado: ');
		readln(v.monto);
		writeln(' ');
	end;
end;

procedure cargarVectorViajes (var vec:vecViajes; var v:viaje; var dimL:integer);
begin
	leerViaje(v);
	while ((dimL < DF) and (v.distancia <> 0)) do
	begin
		dimL:= dimL+1;
		vec[dimL]:= v;
		leerViaje(v);
	end;
end;




{inciso b}
procedure incisoB (vec:vecViajes; dimL:integer; var montoProm:real; var cantViajes:integer; var VD:vDias; var dMin:integer; var disMin:real);
var
	i:integer;
	montoTotal,montoMin:real;
begin
	montoTotal:=0;
	montoMin:= 30000;
	{primer parte}
	
	for i:= 1 to dimL do
	begin
		cantViajes:=cantViajes+1;
		montoTotal:= (montoTotal + vec[i].monto);
		
		{segunda parte}
		if (vec[i].monto < montoMin) then
		begin
			montoMin:= vec[i].monto;
			dMin:= vec[i].dia;
			disMin:= vec[i].distancia;
		end;
		
		{tercera parte}
		VD[vec[i].dia]:= VD[vec[i].dia]+1;
	end;
	montoProm:= montoTotal/cantViajes;
end;

{inciso c}

procedure eliminarViajes(var vec: vecViajes; var dimL: integer);
var
  i, pos: integer;
begin
  pos := 1;
  while (pos <= dimL) do
  begin
    if (vec[pos].distancia = 100) then
    begin
      for i := pos to (dimL - 1) do
      begin
        vec[i] := vec[i + 1];
      end;
      dimL := dimL - 1;
    end
    else
      pos := pos + 1;
  end;
end;

{impresion de vectores}

procedure imprimirViajes (vec:vecViajes; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
	begin
		writeln('> Dia: ',vec[i].dia,' de Marzo');
		writeln('> Monto: $',(vec[i].monto):1:2);
		writeln('> Distancia: ',(vec[i].distancia):1:2,' km');
		writeln(' ');
	end;
end;

procedure imprimirDias (VD:vDias);
var
	i:integer;
begin
	for i:= 1 to 31 do
	begin
		if (VD[i] > 1) then
		begin
			writeln('[!] El dia ',i,' de Marzo hubieron ',VD[i],' viajes.');
			writeln(' ');
		end
		else if (VD[i] = 1) then
		begin
			writeln('[!] El dia ',i,' de Marzo hubo ',VD[i],' viaje.');
			writeln(' ');
		end;
	end;
end;


{programa principal}
var
	vector:vecViajes;
	vector31Dias:vDias;
	registroViajes:viaje;
	
	DL:integer;
	
	montoPromedio:real;
	cantidadViajes:integer;
	
	diaMin:integer;
	distanciaMin:real;
	
begin
	DL:=0;
	montoPromedio:=0;
	cantidadViajes:=0;
	diaMin:=0;;
	distanciaMin:=0;
	inicializarVDias(vector31Dias);
	
	
	cargarVectorViajes(vector,registroViajes,DL);
	writeln('-----------------------------------');
	
	imprimirViajes(vector,DL);
	writeln('-----------------------------------');
	
	
	incisoB(vector,DL,montoPromedio,cantidadViajes,vector31Dias,diaMin,distanciaMin);
	writeln('El monto promedio de viajes fue: ', montoPromedio:1:2);
	writeln('El dia en el que se realizo el viaje que transporto menos dinero fue el:  ', diaMin,' de Marzo con una distancia de ',distanciaMin:1:1,' km');
	writeln('-----------------------------------');
	
	imprimirDias(vector31Dias);
	writeln('-----------------------------------');
	

	eliminarViajes(vector,DL);
	imprimirViajes(vector,DL);
	writeln('-----------------------------------');
end.
