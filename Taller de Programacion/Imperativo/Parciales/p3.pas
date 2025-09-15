{Se desea procesar las pólizas de una compañía de seguros. De cada póliza se conoce:
DNI del cliente, suma asegurada, valor cuota y fecha de vencimiento. Un cliente puede
tener más de una póliza. Las pólizas se comenzaron a emitir a partir del 2000 y
finalizaron de emitirse en 2023. Realice un programa que contenga:

a) Un módulo que lea pólizas, hasta leer una póliza con DNI -1, y las almacene en una
   estructura eficiente para la búsqueda por suma asegurada.

b) Un módulo que reciba la estructura generada en a) y devuelva otra estructura con las
   pólizas cuya suma asegurada sea menor a un valor recibido por parámetro. Esta
   estructura debe estar agrupada por año de vencimiento y ordenada por DNI de cliente.

c) Un módulo que reciba la estructura generada en b) y devuelva la cantidad de pólizas
   de un cliente cuyo DNI se recibe por parámetro.}

program nose; 
type 
	rango = 2000..2023; 
	poliza = record 
		dni: integer; 
		suma: real; 
		valor: real; 
		anio: rango; 
	end; 
	
	lista = ^nodol;
	nodol = record
		dato: poliza;
		sig: lista;
	end;
	
	arbol = ^nodo; 
	nodo= record 
		dato: poliza; 
		hi: arbol; 
		hd: arbol; 
	end; 
	
	vector = array [2000..2023] of lista; 
	
procedure leer (var p: poliza); 
begin 
	p.dni:= random (20)-1; 
	writeln (' El dni del cliente es: ', p.dni);
	if (p.dni <> -1) then begin 
		p.suma:= random (100)*1.5; 
		writeln (' La suma asegurada: ', p.suma:0:2); 
		p.valor:= random (100)*1.5; 
		writeln (' El valor de la cuota es: ', p.valor:0:2); 
		p.anio:= 2000+random(24); 
		writeln (' El anio es: ', p.anio);
	end; 
end; 

procedure insertar (var a: arbol; p: poliza);
begin 
	if (a= nil) then begin 
		new(a); 
		a^.dato:= p; 
		a^.hi:= nil; 
		a^.hd:= nil;
	end
	else 
		if (a^.dato.suma > p.suma) then 
			insertar(a^.hi, p)
		else
			insertar(a^.hd,p); 
end; 

procedure cargararbol (var a: arbol); 
var 
	p: poliza;
begin 
	leer(p); 
	while (p.dni <> -1) do begin 
		insertar (a, p); 
		leer(p); 
	end; 
end; 

procedure inicializar (var v: vector); 
var 
	i: integer;
begin 
	for i:= 2000 to 2023 do 
		v[i]:= nil; 
end;

{procedure insercion (var v: vector); 
var
	i, j: integer; 
	act: arbol; 
begin
	for i:= 2001 to 2023 do begin 
		act:= v[i]; 
		j:= i-1; 
		while ( j> 0) and (v[j]^.dato.dni > act^.dato.dni) do begin 
			v[j+1]:= v[j]; 
			j:= j-1; 
		end; 
		v[j+1]:= act; 
	end; 
end; }

{
procedure ordenarsimple (var a: arbol; p: poliza); 
begin 
	if (a= nil) then begin 
		new(a); 
		a^.dato:= p; 
		a^.hi:= nil; 
		a^.hd:= nil; 
	end
	else
		if (a^.dato.dni > p.dni) then 
			ordenarsimple (a^.hi, p)
		else
			ordenarsimple (a^.hd, p); 
end; 
}

procedure ordenarsimple(var l: lista; p: poliza);
var
	nue,ant,act: lista;
begin
	new(nue);
	nue^.dato:= p;
	act:= l;
	while(act <> nil) and (act^.dato.dni < p.dni) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = l) then 
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

{procedure incisob (a: arbol; valor: real; var v: vector); 
begin 
	if (a<> nil) then begin
		if (a^.dato.suma < valor) then begin 
			v[a^.dato.anio]:= a; 
			ordenarsimple (v[a^.dato.anio], a^.dato); 
			incisob (a^.hi, valor, v); 
			incisob (a^.hd, valor, v); 
		end
		else
			incisob (a^.hi, valor, v); 
	end;
	insercion (v); 
end;    
}
procedure incisob(a: arbol; valor: real; var v: vector); 
begin 
    if (a <> nil) then begin
        incisob(a^.hi, valor, v);  { siempre recorro izquierda }
        
        if (a^.dato.suma < valor) then
            ordenarsimple(v[a^.dato.anio], a^.dato);
        
        incisob(a^.hd, valor, v);  { siempre recorro derecha }
    end;
end;
   
  procedure imprimirlista (l: lista); 
  begin 
	if (l<> nil) then begin 
		writeln (' El dni es: ', l^.dato.dni);
		imprimirlista(l^.sig); 
	end; 
 end;
  procedure imprimir (v: vector); 
  var 
	i: integer; 
	begin 
		for i:= 2000 to 2023 do begin
			writeln (' Para el anio: ', i); 
			imprimirlista (v[i]); 
		end; 
	end; 
	
{Un módulo que reciba la estructura generada en b) y devuelva la cantidad de pólizas
   de un cliente cuyo DNI se recibe por parámetro.}
 
function contarnodos (l:lista; dni: integer): integer; 
begin 
	contarnodos:= 0;
	while (l <> nil) do begin
		if (l^.dato.dni = dni) then
			contarnodos:= contarnodos + 1;
	end;
end; 

function incisoc (v: vector; dni: integer): integer; 
var 
	i, total: integer; 
begin 
	total:= 0; 
	for i:= 2000 to 2023 do begin 
			total:= total + contarnodos (v[i], dni);
		incisoc:= total; 
	end; 
end;   

var 
	a: arbol; 
	valor: real; 
	v: vector; 
	dni: integer; 
begin 
	a:= nil; 
	randomize; 
	cargararbol (a);
	inicializar (v); 
	writeln (' Ingrese un valor para el inciso b: '); 
	readln (valor);  
	incisob (a, valor, v); 
	imprimir (v); 
	writeln (' Ingrese el dni de un cliente para ver la cantidad de polizas: '); 
	readln (dni); 
	writeln (' La cantidad de polizas para el cliente con DNI: ', dni, ' es de: ', incisoc (v,dni)); 
end. 
