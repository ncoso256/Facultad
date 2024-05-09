// 5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades
//iguales entre todos los clientes. Los que le sobren se los quedará para él.
// a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la
// cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de
// caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se
//quedará para sí mismo.
// b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
// valor de $1.60.


program holamundi;
var
	x, y, cantidady, cantidadx: integer;
	caramelo: real; 
begin
	writeln('lea la cantidad de caramelos que posee el kiosquero: ');
	readln(x);
	writeln('lea la cantidad de clientes: ');
	readln(y);
	cantidady:= x div y; 
	writeln('le corresponde a cada cliente: ');
	writeln(cantidady); // cantidad que le corresponde a cada cliente
	cantidadx:= x mod y;
	writeln('la cantidad que le corresponde al kiosquero: '); 
	writeln(cantidadx); // cantidad que le sobran al kiosquero
	caramelo:= (cantidady * 1.6);
	writeln('el dinero que tiene que cobrar el kiosquero es de:  ');
	writeln(caramelo:6:3);
end.
