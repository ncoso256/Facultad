{ 
2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
}


program uno;
type


	lista=^nodo; 
	nodo= record 
		dato: integer; 
		sig: lista; 
	end; 
    



procedure cargarLista(var l: lista);  {Lo que no sa}
var
    num: integer;
begin
    num:= 100 + random(200-100+1);   // genera un número entre 100 y 200
    if (num = 100) then
        l := nil                  // caso base: corto la lista
    else begin
        new(l);                   // creo nodo
        l^.dato := num;           // guardo número
        cargarLista(l^.sig);      // llamada recursiva al resto
    end;
end;



procedure imprimimamos (l: lista);  {LO QUE SABEMOS}
begin 
    if (l<> nil) then begin 
        writeln (l^.dato); 
        imprimimamos (l^.sig); 
    end; 
end; 



procedure imprimiralreves (l:lista);
begin       
    if (l<> nil) then begin
        imprimiralreves(l^.sig);
        writeln(l^.dato);
    end; 
end;

function min (n,m: integer): integer;
begin
	if (m> n) then
 		min:= n
   	else
		min:= m;
end;

function minimo (l: lista):integer;
begin
    if(l = nil) then
		minimo:= 9999
	else
 		minimo:= min(l^.dato, maximo(l^.sig));
    writeln('El numero min: ' , minimo(l));
end;


function encontre (l: lista; valor: integer):boolean;
begin 
    if (l=nil) then
		encontre:= false
  	else
   		encontre:= (l^.dato = valor) or (encontre(l^.sig,valor));
end;

//PPl
var 
    l: lista; 
    min, valor: integer;
    ok: boolean;
begin
    l:= nil;
    randomize;
    cargarLista(l);
    imprimimamos(l);
    imprimiralreves(l); 
    minimo (l,min);
    writeln (' ingrese un valor: ');
    readln(valor);
    writeln ('Que el valor que ingresamos este en la lista es: ', encontre(l,valor));
end.
