program Ejercicio3;
procedure suma(var num1: integer; var  num2:integer);
begin
num2 := num1 + num2;
num1 := 0;
end;
var
i, x : integer;
begin
	read(x); { leo la variable x }
for i:= 1 to 5 do
	suma(i,x);
write(x); { imprimo las variable x }
end.

// a) imprime si se lee en la variable x 10 imprime 25 
// b) imprime 10 una copia de lo que leyo 
// c) hay un error conceptual la variable i la marca como de referencia y no se puede procesar el for porque al ingresar la x tiene distintos valores y no se le puede asignar un valor distinto 
