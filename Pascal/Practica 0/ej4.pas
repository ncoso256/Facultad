//4. Implemente un programa que lea el diámetro D de un círculo e imprima:
 //a. Elradio (R) del círculo (la mitad del diámetro).
 //b. Elárea del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2
 //c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
 //D*PI (o también PI*R*2)

program holamundi;
const
	pi= 3.14;
var
	d, radio, area, perimetro: real;
begin
	writeln('escriba el diametro de un circulo: ');
	readln(d);
	radio:= d / 2;
	writeln('el radio de un circulo es : ');
  	writeln(radio:6:3);
	area:= pi * (radio* radio);
	writeln('el area de un circulo es: ');
	writeln(area:6:3);
	perimetro:= d * pi;
	writeln('el perimetro de un circulo es: ');
	writeln(perimetro:6:3);
end.
