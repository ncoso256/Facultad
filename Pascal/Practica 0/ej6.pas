// 6. Realice un programa que informe el valor total en pesos de una transacción en dólares. Para
// ello, el programa debe leer el monto total en dólares de la transacción, el valor del dólar al día
// de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la transacción. Por
// ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor 189,32 pesos y el
// banco cobra un 4% de comisión, entonces el programa deberá informar:
// La transacción será de 1968,93 pesos argentinos
// (resultado de multiplicar 10*189,32 y adicionarle el 4%)
program holamundi;
var
	monto, dolar, porcentaje: real;
begin
	writeln('escriba el monto total en dolares: ');
	readln(monto);
	writeln('escriba el valor del dolar hoy: ');
	readln(dolar);
	writeln('Ingrese comision en porcentaje del banco: ');
	readln(porcentaje);
	porcentaje:= (porcentaje/100)+1; 
	writeln('La transaccion sera ' ,(monto* dolar*porcentaje):4:2, 'pesos argentinos' );
end.
