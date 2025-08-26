{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta.

Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
* 
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
* 
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
* 
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
* 
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
* 
d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}

program arbol; 
type 
	venta= record 
		codproducto: integer; 
		fecha: integer; 
		cantvendidas: integer; 
	end; 
	
	producto= record 
		codigo: integer; 
		totalvendidas: integer; 
	end; 
	
	arbol=^nodo; 
	nodo= record 
		dato: venta; 
		hi: arbol;
		hd: arbol; 
	end; 
	
	arbol2=^nodo2; 
	nodo2=record 
		dato: producto; 
		hi: arbol2; 
		hd: arbol2; 
	end; 
	
	lista=^nodolista; 
	nodolista= record 
		dato: venta; 
		sig: lista; 
	end; 
	
	masproducto = record 
		mascodigo: integer; 
		ventasrealizadas: lista; 
	end; 
	
	arbol3=^nodo3; 
	nodo3= record 
		dato: masproducto; 
		hi: arbol3; 
		hd: arbol3; 
	end; 

procedure leer (var v: venta); 
begin 
	v.codproducto:= random (20); 
	if (v.codproducto <>0) then begin 
		v.fecha:= 1 + random (31);
		v.cantvendidas:= 1+ random(50);
	end; 
end; 

procedure insertar (var a: arbol; v: venta);
begin 
	if (a=nil) then begin 
		new(a); 
		a^.dato:= v; 
		a^.hi:= nil; 
		a^.hd:=nil; 
	end
	else 
		if (v.codproducto < a^.dato.codproducto) then 
			insertar(a^.hi, v)
		else
			insertar (a^.hd, v); 
end;

procedure cargararbol (var a: arbol); 
var 
	v: venta;
begin 
	a:= nil; 
	leer(v);
	while (v.codproducto <> 0) do begin 
		insertar (a,v);
		leer(v);
	end; 
end; 


procedure leersegundo (var p: producto);
begin 
	p.codigo:= random (20);
	p.totalvendidas:= random (50); 
end; 

procedure insertarsegundo (var a2: arbol2; p: prcducto);
begin 
	if (a2=nil) then begin 
		new(a2); 
		a^.dato:= p; 
		a^.hi:= nil; 
		a^.hd:=nil; 
	end
	else 
		if (p.codigo < a2^.dato.codigo) then 
			insertar(a^.hi, p)
		else
			insertar (a^.hd, p); 
end; 

procedure cargarsegundo (a2: arbol2); 
var 
	p: producto; 
begin 
	a2:= nil;
	leersegundo(p); 
	while (p.codigo <> 0) do begin 
		insertar (a2, p); 
		leersegundo (p);
	end; 
end; 

procedure incisob (a: arbol; f: fechita; var totalcompras: integer); 
begin 
    if (a <> nil) then begin 
        if (a^.dato.fecha = fechita) then begin 
            totalcompras:= a^.dato.cantvendidas;
        end
        else 
            incisob(a^.hi,f,totalcompras); 
            incisob(a^.hd,f,totalcompras);
    end;
end; 

//c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
//con mayor cantidad total de unidades vendidas.
procedure incisoc (a2:arbol2; var maxvendidas: integer; var maxcodigo: integer);
begin
    if (a2<>nil) then begin   
        if(a2^.dato.totalvendidas > maxvendidas) then begin
            maxvendidas:= a2^.dato.totalvendidas;
            maxcodigo:= a2^.dato.codigo;
        end;
        incisob(a2^.hi,f,totalcompras);  
        incisob(a2^.hd,f,totalcompras);
    end; 
end; 
 


//d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
//con mayor cantidad de ventas.}

procedure incisod (a3: arbol3; var maxventas: integer; var mayorcodigo: integer);
begin 
    if (a3<>nil) then begin 
        if (maxventas < a3^.dato.ventasrealizadas^.dato.cantvendidas) then begin 
            mayorcodigo:= a3^.dato.ventasrealizadas^.dato.codproducto;
            maxventas:= a3^.dato.ventasrealizadas^.dato.cantvendidas;
    end; 
        incisod (a3^.hi, maxventas, mayorcodigo);
        incisod (a3^.hd, maxventas, mayorcodigo);
end; 


var 
	a, a2,a3: arbol; 
	fechita, totalcompras, maxvendidas, maxcodigo, maxventas, mayorcodigo: integer; 
begin 
	totalcompras:= -1; 
    maxvendidas:= -1; 
    maxventas:= -1; 
	a:= nil; 
	a2:= nil; 
	a3:= nil; 
	cargararbol (a); 
	cargarsegundo (a2); 
	cargartercero (a3); 
	writeln (' ingresa una fecha entre 1 y 31: ');
	readln (fechita); 
	incisob (a, fechita, totalcompras); 
    writeln (' el total de compras en la fecha: ', fechita, 'es de: ', totalcompras);
    incisoc (a2, maxvendidas, maxcodigo);
    writeln(maxvendidas, maxcodigo);
    incisod (a3, maxventas, mayorcodigo);
    writeln(maxventas,mayorcodigo);
end.
