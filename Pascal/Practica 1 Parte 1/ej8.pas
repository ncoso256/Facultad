//8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos uno de
//ellos no lo era. Por ejemplo:
//○ Si se leen los caracteres “a e o”, deberá informar: Los tres son vocales
//○ Si se leen los caracteres “z a g”, deberá informar: Al menos un carácter no era vocal

program holamundi;
var
	c1, c2, c3: char;
begin 
	writeln('escriba un caracter: '); readln(c1);
	writeln('escriba un segundo caracter: '); readln(c2);
	writeln('escriba un tercer caracter: '); readln(c3);
	if (c1 = 'a') and (c1 = 'e') and (c1 = 'i') or (c1 = 'o') or (c1 = 'u') and (c2 = 'a') and (c2 = 'e') and (c2 = 'i') or (c2 = 'o') or (c2 = 'u') and (c3 = 'a') and (c3 = 'e') and (c3 = 'i') or (c3 = 'o') or (c3 = 'u')then
		writeln('las tres son vocales')
	else
		writeln('al menos un caracter no era vocal');
end.
{for para la lectura}
