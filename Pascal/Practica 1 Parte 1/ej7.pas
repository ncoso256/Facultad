//7. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén.
//La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse. Para cada producto
//leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.
//1
// Por ejemplo:
//○ Si se ingresa el código 10382, con precio actual 40 y nuevo precio 44, deberá imprimir:
//El aumento de precio del producto 10382 no supera el 10%
//○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir:
//El aumento de precio del producto 32767 es superior al 10%”

program holamundi;
var
	codigo: integer;
	precio,nuevoprecio, porcentaje: real;
begin
	repeat
		writeln('escriba un codigo de producto'); readln(codigo);
		writeln('escriba un un precio: '); readln(precio);
		writeln('escriba el nuevo precio del producto: '); readln(nuevoprecio);
		porcentaje:= precio/10;
		if ( nuevoprecio > 1.1* precio) then {precionuevo > precioact + precioact*0.1}
			writeln('el producto ', codigo , ' supera el 10%')
		else 
			writeln('el producto ' , codigo , ' no supera al 10%');
	until (codigo = 32767);
end.
