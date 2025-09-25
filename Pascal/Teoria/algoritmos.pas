program algoritmos;

procedure maximo(val: integer; var max: integer);
begin
	max:= -1; // inicio el maximo en un valor chico
	readln(val); // leo el valor para ver el maximo
	if (val > max) then  // si ese valor es mas grande que el maximo entonces
		max:= val; // que el maximo sea igual al valor.
end;

procedure minimo(val: integer; var min: integer);
begin
	min:= 9999; // inicio el minimo en un valor grande
	readln(val); // leo el valor para ver el minimo
	if (val < min) then  // si el valor es menor que el minimo entonces
		min:= val; // que el minimo sea igual al valor
end;

procedure dosmaximos(val: integer; var max1,max2: integer);
begin
	max1:= -1; // inicio el primer maximo en un valor chico
	max2:= -1; // inicio el segundo maximo en un valor chico
	read(val); // leo un valor para ver entre los dos maximos cual es mas grande 
	while (val <> 0) do begin // mientras el valor sea distinto de 0
		if (val > max1) then begin // si el valor es mayor a el primer maximo
			max2:= max1; // el segundo maximo guarda lo que contiene el primer maximo
			max1:= val; // el primer maximo es igual al valor
		end
		else begin // sino 
			if (val > max2) then // si el valor es mayor al segundo maximo entonces
				max2:= val; // guarda en el segundo maximo el valor
		end;
		read(val); // segui leyendo el valor hasta apretar 0
	end;
end;

procedure dosminimos(val: integer; var max1,max2: integer);
begin
	min1:= 9999; // inicio el primer minimo en un valor grande
	min2:= 9999; // inicio el segundo minimo en un valor grande
	readln(val); // leo un valor para ver entre los dos minimos cual es mas grande
	while (val <> 0) do begin // mientras el valor sea distinto de 0
		if (val < min1) then begin // si el valor es menor al primer minimo entonces
			max2:= max1; // guardo en el segundo minimo el primer minimo 
			max1:= val; // guardo en el primer minimo el valor
		end
		else begin // sino 
			if (val < min2) then // si el valor es menor al segundo minimo entonces 
				min2:= val; // guardo en el segundo minimo el valor
		end 
		readln(val); // segui leyendo el valor hasta apretar 0
	end;	
end;

procedure cortedecontrol;
var
	prod: producto; // registro que permite ordenar la informacion
	total: integer; // variable que guarda el total del stock del producto por marca.
	aux: cadena15; // variable para guardar la marca del producto actual.
begin
	leerproducto(prod); // leo un producto
	while (prod.codigo <> -1) do begin // mientras el codigo del producto sea distinto de -1 
		total:= 0; // inicio el total en 0
		aux:= prod.marca; // guardo en un auxiliar la marca del producto actual
		while (prod.codigo <> -1) and(aux = prod.marca) do begin // mientras el codigo de producto sea distinto de -1 y el auxiliar actual sea igual a una marca de producto
			total:= total + prod.stock; // al total le sumo el stock del producto por marca del producto
			leerproducto(prod); // leo otro producto
		end;
		writeln(total); // informo el total del stock del producto por marca.
	end;
end;

procedure cargarvector1(var v: vector); 
// vamos a modificar el vector que contiene basura
var
	i: integer; // indice para recorrer el vector
	valor: real; // valor para ingresar al vector
begin
	for i:= 1 to max do begin // recorro el indice del vector completo 
		readln(valor); // leo un valor
		v[i]:= valor; // guardo en el vector el valor. 
	end;
end;

procedure cargarvector2(var v: vector2); 
// vamos a modificar el vector que contiene basura
var
	i: integer; // indice del vector.
begin 
	for i:= 1 to max do // recorro el indice del vector completo
		readln(v[i]);  // leo el elemento del vector directamente. 
end;
 
procedure cargarvectordimensionlogica(var v: vector3; var diml: integer); 
// vamos a modificar el vector y la dimension logica del vector
var 
	precio: real; // precio es la variable que almacenamos en el vector ingresada por teclado
begin
	diml:= 0; // inicio dimension logica en 0
	readln(precio); // leo un valor para cargar en el vector.
	while ((diml < dimf) and (precio <> 0)) do begin // mientras la dimension logica sea menor a la fisica y el valor sea distinto a 0
		diml:= diml + 1; // incremento la dimension logica 
		v[diml]:= precio; // en el vector con indice dimension logica guardo el valor ingresado
		readln(precio); // hasta que sea 0 sigo leyendo 
	end;
end;

procedure agregaralvector(var v: vector3; var diml: integer; precio: real; var exito: boolean); 
{
vamos a necesitar modificar el vector, su dimension logica y una variable booleana que determine si se agrego o no.
Y por valor vamos a ingresar un valor del mismo tipo del vector. 
}
begin
	exito:= (diml < dimf); // guardo en una variable booleana si la dimension logica es menor a la dimension fisica.
	if (exito) then begin // si esa variable booleana es verdadera entonces
		diml:= diml+1; // incremento en uno la dimension logica
		v[diml]:= precio; // guardo en el vector con indice dimension logica, el valor que ingrese por teclado. 
	end;	
end;

procedure insertaralvector(var v: vector3; var diml: integer; precio: real; pos: integer; var exito: boolean);
{
vamos a necesitar modificar el vector, su dimension logica y su variable booleana que determine si se inserto o no al vector. 
despues tambien vamos a necesitar por valor, la posicion en la cual queremos insertar y su valor al cual queremos insertar. 
}
var
	i: integer; // indice del vector
begin
	exito:= (diml < dimf) and(pos > 0) and (pos <= diml); // guardo en mi variable exito si la dimension logica es menor a la dimension fisica y si la posicion que ingrese esta entre el rango de la dimension logica.
	if (exito) then begin // si exito es verdadera
		for i:= diml downto pos do  // recorro mi indice del vector desde la dimension logica bajando hasta la posicion que ingrese
			v[i+1]:= v[i]; // guardo en el vector con el indice + 1,  el vector con el indice comun 
		diml:= diml+1; // incremento la dimension logica en uno 
		v[pos]:= precio; // inserto en mi vector con la posicion que ingrese por teclado, el valor que ingrese por teclado
	end;
end;

procedure eliminaralvector(var v: vector3; var diml: integer; pos: integer; var exito: boolean);
{
vamos a modificar el vector, su dimension logica y una variable exito que determina si elimino o no la posicion del vector. 
se ingresa por teclado la posicion y se pasa por parametro por valor. 
}
var
	i: integer; // indice del vector
begin
	exito:= (pos > 0) and (pos <= diml); // guardo en mi variable booleana si la posicion que ingrese esta entre el rango de la dimension logica.
	if (exito) then begin // si mi variable booleana es verdadera entonces
		for i:= pos + 1 to diml do // recorro mi indice del vector desde la posicion que ingrese + 1 hasta la dimension logica 
			v[i-1]:= v[i]; // guardo en mi vector con indice - 1 a mi vector con indice comun. 
		diml:= diml - 1; // decremento la dimension logica en uno. 
	end;
end;

procedure cargarvectorordenado(var v: vector; var diml: integer); {este modulo lo dejo porque hay uno o dos ejercicios que utilizan este algoritmo, no hay que dejar de tenerlo en cuenta}
	function buscarpos(v: vector; diml: integer; precio: real;): integer;
	var
		pos: integer;
	begin
		pos:= 1;
		while ((pos <= diml) and (v[pos].precio < precio)) do
			pos:= pos + 1;
		buscarpos:= pos;
	end;
	
	procedure insertar(var v: vector; var diml: integer; pos: integer; p: producto);
	var
		i: integer;
	begin
		for i:= diml downto pos do
			v[i+1]:= v[i];
		diml:= diml + 1;
		v[pos]:= p;
	end;		
var
	p: producto;
begin
	diml:= 0;
	leerproducto(p);
	while (diml < dimf) and (p.precio <> 0) do begin
		pos:= buscarpos(v,diml,p.precio);
		insertar(v,diml,pos,p);
		leerproducto(p);
	end;
end;

procedure eliminarvectorordenado(var v: vector; var diml: integer; valor: real; var exito: boolean); {este modulo lo dejo porque hay uno o dos ejercicios que utilizan este algoritmo, no hay que dejar de tenerlo en cuenta}
	function buscarprecio(v: vector; diml: integer; precio: real): integer;
	var
		pos: integer;
	begin
		pos:= 1;
		while (pos <= diml) and (v[pos].precio < precio) do
			pos:= pos + 1;
		if ((pos <= diml) and (v[pos].precio = precio)) then 
			buscarprecio:= pos
		else
			buscarprecio:= 0;
	end;
var
	i,pos: integer;
begin
	pos:= buscarprecio(v,diml,precio);
	exito:= (pos > 0);
	if (exito) then begin
		for i:= pos+1 to diml-1 do
			v[i-1]:= v[i];
		diml:= diml-1;
	end;
end;

function buscarvectordesordenado(a: numeros; dl: integer; valor: integer): boolean; 
{
a esta funcion le pasamos los parametros por valor de: el vector, la dimension logica y el valor a buscar 
esto tiene que devolver un booleano o tambien en algunas situaciones podes devolver un entero para ver cuantas veces esta repetido por ejemplo. 
}
var
	pos: integer; // indice del vector 
	esta: boolean; // variable booleana para retornar si el valor esta o no. 
begin
	esta:= false; // inicio mi variable booleana en falso
	pos:= 1; // inicio mi indice del vector en 1 
	while ((pos <= dl) and (not esta)) do begin // mientras mi indice del vector sea menor o igual a la dimension logica y no sea verdadera mi variable booleana
		if (a[pos] = valor) then  // si en el vector con indice es igual al valor que ingrese entonces
			esta:= true // mi variable booleana es verdadera
		else // sino 
			pos:= pos + 1; // aumento mi indice del vector. 
	end;
	buscarvectordesordenado:= esta; // devuelvo la funcion con mi variable booleana
end;

function buscarordenadovector(a: numeros; dl: integer; valor: integer): boolean;
{
paso como parametros por valor: mi vector, su dimension logica, y un valor que ingrese por teclado.
devuelvo un booleano o un entero tambien puede ser. 
}
var
	pos: integer; // mi indice del vector
begin 
	pos:= 1; // inicio el indice en 1 
	while ((pos <= dl) and (a[pos] < valor)) do // mientras el indice sea menor igual a la dimension logica y el vector con indice sea menor al valor que ingrese
		pos:= pos + 1; // aumento el indice en uno 
	if ((pos <= dl)and(a[pos] = valor)) then // si mi indice es menor igual a la dimension logica y mi vector con indice es igual al valor que ingrese entonces 
		buscarordenadovector:= true // devuelvo la funcion en verdadero
	else // sino 
		buscarordenadovector:= false; // devuelvo la funcion en falso
end;

procedure crearlista(var l: lista); 
{
nadie crea este modulo pero
tengo que modificar la lista. 
}
begin
	l:= nil; // la lista esta vacia
end;

procedure recorrerlista(l: lista);
{
tengo que pasar por valor la lista 
}
begin
	while (l <> nil) do begin // mientras la lista sea distinta de nil 
		{acciones a la lista...}
		l:= l^.sig; // guardo en la lista el puntero al nodo siguiente.  
	end;
end;

procedure agregaradelante(var l: lista; e: elemento);
{
tengo que modificar la lista porque voy a agregar nuevos elementos 
y paso los valores de mi nuevo elemento. 
}
var
	nue: lista; // puntero para generar nuevo dato a la lista. 
begin
	new(nue); // genero la direccion a el puntero nuevo.
	nue^.dato:= e; // el nuevo que apunta al dato guarda el elemento que ingrese.
	nue^.sig:= l; // el nuevo que apunta al siguiente guarda el puntero de la lista.
	l:= nue; // guardo en la lista el nuevo. 
end;

procedure agregaratras1(var l: lista; e: elemento); 
{
necesito modificar la lista
y paso los valores del elemento que ingrese
}
var
	nue,act: lista; // utilizo punteros para el nuevo dato a agregar y para el actual 
begin
	new(nue); // genero la direccion a el puntero nuevo
	nue^.dato:= e; // el nuevo que apunta al dato guarda el elemento que ingrese
	nue^.sig:= nil; // el nuevo que apunta al siguiente esta vacio 
	if (l = nil) then  // si la lista es igual a estar vacia entonces 
		l:= nue // la lista guarda a mi puntero nuevo
	else begin // sino esta vacia 
		act:= l; // actual guarda a la lista
		while (act^.sig <> nil) do // mientras el actual que apunta a el siguiente es distinto de estar vacio 
			act:= act^.sig; // actual guarda el actual que apunta a el siguiente
		act^.sig:= nue; // actual que apunta a el siguiente guarda el puntero con la informacion nueva 
	end;
end;

procedure agregaratras2(var l,ult: lista; e: elemento);
{
necesito modificar la lista y su puntero al ultimo.
y paso los valores del elemento que ingrese.
}
var
	nue: lista; // puntero al nuevo dato a agregar. 
begin
	new(nue); // genero la direccion a el puntero nuevo.
	nue^.dato:= e; // el nuevo que apunta al dato guarda el elemento que ingrese.
	nue^.sig:= nil; // el nuevo que apunta al siguiente esta vacio.
	if (l = nil) then // si la lista esta vacia entonces. 
		l:= nue // la lista guarda el puntero al nuevo dato a agregar.
	else // sino esta vacia 
		ult^.sig:= nue; // el ultimo que apunta al siguiente guarda el puntero al nuevo dato a agregar.
	ult:= nue; // el ultimo guarda el nuevo dato a agregar.
end;

procedure insertarordenado(var l: lista; e: elemento);
{
modifico la lista porque voy a insertar ordenadamente datos nuevos. 
y paso los valores del elemento que ingrese 
}
var
	nue,act,ant: lista; // voy a usar tres punteros: el nuevo al dato a insertar, el actual que analiza la informacion de a un dato del nodo, y el anterior que almacena la informacion de antes.
begin
	new(nue); // genero la direccion a el puntero nuevo
	nue^.dato:= e; // el nuevo que apunta al dato guarda el elemento que ingrese.
	act:= l; // el actual guarda la informacion de la lista.
	while (act <> nil) and (act^.dato.campoorden < e.campoorden) do begin // mientras el actual sea distinto de ser vacio y el actual que apunta al dato con cierto tipo de orden es menor al elemento con cierto tipo de orden 
		ant:= act; // el anterior guarda el actual.
		act:= act^.sig; // el actual guarda el actual que apunta al siguiente. 
	end;
	if (act = l) then // si el actual es igual a la lista entonces  
		l:= nue // la lista guarda el nuevo dato a insertar
	else // sino es igual al actual 
		ant^.sig:= nue; // el anterior que apunta al siguiente guarda el nuevo dato 
	nue^.sig:= act; // el nuevo que apunta al siguiente guarda el actual 
end;

procedure eliminarsinordenlistas(var l: lista; valor: elemento; var exito: boolean);
{
voy a modificar la lista porque voy a eliminar un dato de esta y voy a modificar una variable booleana que indica si elimine o no en la lista. 
voy a pasar por parametro un valor que ingreso por teclado y es el que voy a eliminar. 
}
var
	act,ant: lista;  // necesito dos punteros el actual por el que voy a analizar la informacion del dato que ingrese y el anterior que va a analizar la informacion del actual.  
begin
	exito:= false; // inicio mi variable booleana en falso. 
	act:= l; // actual guarda a la lista
	while (act <> nil) and (not exito) do // mientras actual sea distinto de nil y mi variable booleana no sea verdadera 
		if (act^.dato.campo = valor) then  // si el actual que apunta al dato es igual al valor que ingrese entonces 
			exito:= true // mi variable booleana es verdadera 
		else begin // sino es igual al valor que ingrese
			ant:= act; // el anterior guarda a el actual 
			act:= act^.sig; // el actual guarda al actual que apunta al siguiente
		end;
	if (exito) then begin // si mi variable booleana es verdadera entonces 
		if (l = act) then  // si la lista es igual al actual entonces
			l:= l^.sig // la lista guarda a la lista que apunta al siguiente. 
		else // sino 
			ant^.sig:= act^.sig; // el anterior que apunta al siguiente guarda al actual que apunta al siguiente
		dispose(act); // elimino el puntero actual 
	end; 
end;

procedure eliminarconordenlistas(var l: lista; valor: elemento; var exito: boolean);
{
voy a modificar la lista porque tengo que eliminar ordenadamente. Y voy a modificar una variable booleana que me indica si el elemento se elimino o no. 
voy a ingresar por teclado un valor que voy a pasar como parametro por valor.  
}
var
	act,ant: lista; // necesito dos punteros el actual por el que voy a analizar la informacion del dato que ingrese y el anterior que va a analizar la informacion del actual. 
begin
	exito:= false; // inicio mi variable booleana en falso 
	act:= l; // actual guarda la lista
	while (act <> nil) and(act^.dato.campoorden < valor) do begin // mientras el actual sea distinto de ser vacia y el actual que apunta al dato con un tipo de orden sea menor que el valor que ingrese
		ant:= act; // el anterior guarda el actual
		act:= act^.sig; // el actual guarda el actual que apunta al siguiente
	end;
	if (act <> nil) and (act^.dato.campoorden = valor) then begin // si el actual es distinto de ser vacio y el actual que apunta al dato con un tipo de orden es igual al valor entonces
		exito:= true; // mi variable booleana es verdadera 
		if (l = act) then  // si la lista es igual al actual  entonces 
			l:= l^.sig // la lista guarda la lista que apunta al siguiente 
		else // sino 
			ant^.sig:= act^.sig; // el anterior que apunta al siguiente guarda al actual que apunta al siguente 
		dispose(act); // elimino el puntero actual 
	end;
end;

procedure eliminarconrepeticioneslistas(var pi: listae; valor: integer);
{
voy a modificar la lista porque quiero eliminar con repeticion.
y voy a ingresar un valor por teclado y lo voy a pasar como parametro por valor. y ese valor lo voy a eliminar con repeticiones. 
}
var
	actual,ant: listae; // necesito dos punteros el actual por el que voy a analizar la informacion del dato que ingrese y el anterior que va a analizar la informacion del actual. 
begin
	actual:= pi; // actual guarda la lista
	while (actual <> nil) do begin // mientras actual sea distinto de ser vacia 
		if (actual^.elem <> valor) then begin // si el actual que apunta al dato es distinto del valor entonces
			ant:= actual; // el anterior guarda a actual
			actual:= actual^.sig; // actual guarda el actual que apunta al siguiente
		end
		else begin // sino  si el valor que ingrese es igual al actual que apunta al dato 
			if (actual = pi) then  // si el actual es igual a la lista entonces 
				pi:= pi^.sig // la lista guarda la lista que apunta al siguiente
			else // sino es igual 
				ant^.sig:= actual^.sig; // el anterior que apunta al siguiente guarda el actual que apunta al siguiente 
			dispose(actual); // elimino el puntero actual 
			actual:= pi; // actual guarda la lista
		end;
	end;
end;

function buscardesordenadolistas(pi: listae; valor: integer): boolean;
var
	aux: listae;
	encontre: boolean;
begin
	encontre:= false;
	aux:= pi;
	while (aux <> nil) and(encontre = false) do begin
		if (aux^.elem = valor) then
			encontre:= true
		else
			aux:=aux^.sig;
	end;
	buscardesordenadolistas:= encontre;
end;

function buscarordenadolistas(pi: listae; valor: integer):boolean;
var
	aux: listae;
	encontre: boolean;
begin
	encontre:= false;
	aux:= pi;
	while (aux <> nil) and (aux^.elem < valor) do
		aux:= aux^.sig;
	if (aux <> nil) and (aux^.elem = valor) then 
		encontre:= true;
	buscarordenadolistas:= encontre;
end;
