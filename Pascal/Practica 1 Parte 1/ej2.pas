//2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
// número X, se escribe |X| y se define como:
// |X| = Xcuando Xesmayoroigual a cero
// |X| =-X cuando X es menor acero


program holamundi;
var
	num1: real;
begin
	writeln('escriba un numero: ');
	readln(num1);
	if (num1 >= 0) then
	begin
		writeln('su valor absoluto es :');
		writeln(num1:6:3)
	end
	else 
		if (num1 < 0) then
		begin
			writeln('su valor absoluto es: ');
			writeln(num1:6:3);
		end;
end.
