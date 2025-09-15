
{
Una clínica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes durante el año 2023.

a) Implementar un módulo que lea información de las atenciones y retorne un vector donde se almacenen las atenciones agrupadas por mes.
 Las atenciones de cada mes deben quedar almacenadas en un árbol binario de búsqueda ordenado por DNI del paciente 
y sólo deben almacenarse dni del paciente y código de diagnóstico. 
 De cada atención se lee: matrícula del médico, DNI del paciente, mes y diagnóstico (valor entre Ly P).
 La lectura finaliza con matrícula 0.

b) Implementar un módulo recursivo que reciba el vector generado en a) y retorne el mes con mayor cantidad de atenciones.

c) Implementar un módulo que reciba el vector generado en a) y un DNI de paciente, y retorne si fue atendido o no, el paciente con el DNI ingresado.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c. 
En caso de ser necesario, puede utilizar los módulos que se encuentran a continuación
}

program dos;
const
	dimf = 12;
type
	rangomes = 1..dimf;
	rangodiag = 'L'..'P';
	atencion = record
		matricula: integer;
		dni: integer;
		mes: rangomes;
		diagnostico: rangodiag;
	end;
	
	arbol = ^nodo;
	nodo = record
		dni: integer;
		diagnostico: rangodiag;
		hi: arbol;
		hd:arbol;
	end;
	
	vector = array[rangomes] of arbol;
	
procedure leeratencion(var a: atencion);
begin
	readln(a.matricula);
	if (a.matricula <> 0) then begin
		readln(a.dni);
		readln(a.mes);
		readln(a.diagnostico);
	end;
end;

procedure insertar(var a: arbol; dni: integer; diagnostico: rangodiag);
begin
	if (a = nil) then begin
		new(a);
		a^.dni:= dni;
		a^.diagnostico:= diagnostico;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if (dni < a^.dni) then 
			insertar(a^.hi,dni,diagnostico)
		else
			insertar(a^.hd,dni,diagnostico);
end;


procedure inicializar(var v: vector);
var
	i: integer;
begin
	for i:= 1 to dimf do 
		v[i]:= nil;
end;

procedure cargar(var v: vector);
var
	a: atencion;
begin
	leeratencion(a);
	while (a.matricula <> 0) do begin
		insertar(v[a.mes],a.dni,a.diagnostico);
		leeratencion(a);
	end;	
end;

function contarnodos(a:arbol): integer;
begin
	if (a = nil) then 
		contarnodos:= 0
	else
		contarnodos:= 1 + contarnodos(a^.hi) + contarnodos(a^.hd);
end;

procedure informarrecursivo(v:vector;i: integer; var mesmax,max: integer);
var
	cant: integer;
begin
	if (i <= 12) then begin
		cant:= contarnodos(v[i]);
		if (cant > max) then begin
			max:= cant;
			mesmax:= i;
		end;
		informarrecursivo(v,i+1,mesmax,max)
	end;
end;


function buscarsihaydni(a:arbol; dni: integer): boolean;
begin
	if (a = nil) then
		buscarsihaydni:= false
	else
		if (a^.dni = dni) then 
			buscarsihaydni:= true
		else
			if (dni > a^.dni) then 
				buscarsihaydni:= buscarsihaydni(a^.hd,dni)
			else
				buscarsihaydni:= buscarsihaydni(a^.hi,dni);
end;

function incisoc(v: vector; dni: integer):boolean;
var
	i: integer;
begin
	for i:= 1 to 12 do 
		incisoc:= buscarsihaydni(v[i],dni);
end;

var
	v:vector;
	mesmax,max,dni: integer;
begin
	inicializar(v);
	cargar(v);
	mesmax:= -1;
	max:= -1;
	informarrecursivo(v,1,mesmax,max);
	readln(dni);
	incisoc(v,dni);
end.
