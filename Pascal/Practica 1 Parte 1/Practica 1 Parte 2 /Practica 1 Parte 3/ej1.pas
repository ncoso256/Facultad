//1. Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
//empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto/
//dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
//que debe procesarse.
//El programa deberá informar:
//● Para cada empresa, el monto promedio de sus inversiones
//● Código de la empresa con mayor monto total invertido
//● Cantidad de empresas con inversiones de más de $50000
//Por ejemplo:
//Ingrese un código de empresa: 33
//Ingrese la cant. de inversiones: 4
//Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
//Resultado del análisis: Empresa 33 Monto promedio 31157,71
//Ingrese un código de empresa: 41
//Ingrese la cant. de inversiones: 3
//Ingrese el monto de cada inversión: 102000.22 53000 12000
//Resultado del análisis: Empresa 41 Monto promedio 55666,74
//Ingrese un código de empresa: 100
//Ingrese la cant. de inversiones: 1
//Ingrese el monto de cada inversión: 84000.34
//Resultado del análisis: Empresa 100 Monto promedio 84000.34
//(Fin de la lectura)
//La empresa 41 es la que mayor dinero posee invertido ($167000.22).
//Hay 3 empresas con inversiones por más de $50000

program e;
var
	codigo, cant, codigomax,cantempresas, cantinvest: integer;
	sumamontos,montomax,monto, promedio: real;
begin
	codigomax:= -999;
	montomax:= -999;
	cantempresas:= 0;
	repeat
		writeln('Ingrese un codigo de empresa: '); readln(codigo);
		writeln('Ingrese la cantidad de inversiones: '); readln(cantinvest);
		cant:= 0; 
		sumamontos:= 0;
		
		//registrar todas las inversiones de la empresa 
		repeat
			writeln('Ingrese el monto de cada inversion: '); readln(monto);
			cant:= cant + 1;
			sumamontos:= sumamontos + monto;	
		until(cantinvest = cant);	
		// preguntar si el monto total de la empresa supera a los 50.000
		if (sumamontos > 50000) then
			cantempresas:= cantempresas + 1;
		//sacar el promedio de la empresa 
		promedio:= sumamontos/cant; 
		writeln('Resultado del analisis: Empresa ', codigo ,' monto promedio ', promedio:0:2);
		// si el monto total de la empresa actual es mayor que el maximo guardado...
		if (sumamontos > montomax) then begin 
			montomax:= sumamontos;       // actualizar maximo y el codigo maximo 
			codigomax:= codigo;
		end;
	until (codigo = 100);
	writeln('La empresa ', codigomax , ' es la que mayor dinero posee invertido ', montomax:0:2);
	writeln('Hay ', cantempresas , ' por mas de $50000 ');
end.
