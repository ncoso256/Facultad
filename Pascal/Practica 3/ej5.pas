{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. 
De cada auto se lee: marca, modelo y precio.
La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. 
La información se ingresa ordenada por marca. 
Se pide calcular e informar: 
a. El precio promedio por marca. 
b. Marca y modelo del auto más caro.}

program cinco;
type
	str20 = string[20];
	auto = record
		marca: str20;
		modelo: str20;
		precio: real;
	end;

procedure leerdatos(var a: auto);
begin
	readln(a.marca);
	readln(a.modelo);
	readln(a.precio);
end;

function prom(autito: auto): real;
begin
	prom:= (autito.precio + autito.precio)/ 1; 
end;

procedure marcayautomascaro(var carro: auto; var marcamax,modelomax: string; var preciomax: real);
begin
	if (carro.precio > preciomax) then begin 
		marcamax:= carro.marca;
		modelomax:= carro.modelo;
	end;
end;

var
	car: auto;
	maxmarca, maxmodelo: string;
	pmax, promedio: real;
	
begin
	maxmarca:= '';
	maxmodelo:= '';
	pmax:= -1;
	leerdatos(car);
	while (car.marca <> 'ZZZ') do begin
		marcayautomascaro(car, maxmarca, maxmodelo, pmax);
		promedio:= prom(car);
		leerdatos(car);
	end;
	writeln(promedio);
	writeln(maxmarca , maxmodelo);
end.
