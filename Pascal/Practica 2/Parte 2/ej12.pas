{12. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja.
El módulo debe recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar, 3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha plantación. 
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:

Tipo de zona-Rendimiento por ha
1- 6 toneladas por ha
2- 2,6 toneladas por ha
3- 1,4 toneladas por ha

b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la provincia de Buenos Aires.
De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona (1, 2 ó 3).
La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse.
El precio de la soja es de U$S320 por tn.

Informar: 

● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado. 
● La localidad del campo con menor rendimiento económico esperado. 
● El rendimiento económico promedio.
}

program doce;
type
	tipoZonaFertil = 1..3;

function obtenerRendimientoPorHA(tipo : tipoZonaFertil) : real;
var
	rendimiento : real;
begin
	rendimiento := 0;
	case tipo of
	1: rendimiento := 6;
	2: rendimiento := 2.6;
	3: rendimiento := 1.4;
	end;
	obtenerRendimientoPorHA := rendimiento;
end;

function calcularGanancia(ha : integer; zona : tipoZonaFertil; precio : integer) : real;
var
	rendimientoHa : real;
begin
	rendimientoHa := obtenerRendimientoPorHA(zona);
	calcularGanancia := ha * rendimientoHa * precio;
end;

procedure leerCampo(var localidad : string; var hectareas : integer; var zona : tipoZonaFertil);
begin
	write('Localidad: ');
	readln(localidad);

	write('Cantidad de hectareas sembradas: ');
	readln(hectareas);

	write('Tipo de zona: ');
	readln(zona);

end;

const
	PRECIO_SOJA = 320;
var
	localidad : string;
	cantHaSembradas : integer;
	zona : tipoZonaFertil;

	rendimiento : real;

	campos3FebConMas10000 : integer;

	maxRendimiento : real;
	localidadMaxRendimiento : string;

	minRendimiento : real;
	localidadMinRendimiento : string;

	cantCampos : integer;
	sumaTotalRendimiento : real;

	rendimientoPromedio : real;
begin
	campos3FebConMas10000 := 0;
	maxRendimiento := -1;
	minRendimiento := 999999;
	cantCampos := 0;
	sumaTotalRendimiento := 0;
	repeat
		leerCampo(localidad, cantHaSembradas, zona);
		rendimiento := calcularGanancia(cantHaSembradas, zona, PRECIO_SOJA);

		sumaTotalRendimiento := sumaTotalRendimiento + rendimiento;
		cantCampos := cantCampos + 1;

		if((localidad = 'tres de febrero') AND (rendimiento > 10000)) then
			campos3FebConMas10000 := campos3FebConMas10000 + 1;

		if(rendimiento > maxRendimiento) then
		begin
			maxRendimiento := rendimiento;
			localidadMaxRendimiento := localidad;
		end;

		if(rendimiento < minRendimiento) then
		begin
			minRendimiento := rendimiento;
			localidadMinRendimiento := localidad;
		end;
	until((localidad = 'saladillo') AND (cantHaSembradas = 900));

	writeln;
	writeln('Campos de Tres de Febrero con rendimiento superior a 10.000: ', campos3FebConMas10000);
	writeln('Localidad con el campo de mayor rendimiento: ', localidadMaxRendimiento);
	writeln('Localidad con el campo de menor rendimiento: ', localidadMinRendimiento);
	rendimientoPromedio := sumaTotalRendimiento / cantCampos;
	writeln('Rendimiento promedio: ', rendimientoPromedio:0:2);
end.
