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

program arbolito; 
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
	venta3 = record
		fec: integer;
		cantvend: integer;
	end;
	lista=^nodolista; 
	nodolista= record 
		dato: venta3; 
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
	v.codproducto:= random (10); 
	writeln (' el codigo del producto del primer arbol es: ', v.codproducto); 
	if (v.codproducto <>0) then begin 
		v.fecha:= 1 + random (31);
		writeln (' la fecha es: ', v.fecha); 
		v.cantvendidas:= 1+ random(50);
		writeln (' la cantidad de vendidas es de: ', v.cantvendidas); 
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

procedure insertarsegundo(var a2: arbol2; v: venta);
begin
    if (a2 = nil) then begin
        new(a2);
        a2^.dato.codigo := v.codproducto;
        a2^.dato.totalvendidas := v.cantvendidas;
        a2^.hi := nil;
        a2^.hd := nil;
    end
    else if (v.codproducto = a2^.dato.codigo) then
        a2^.dato.totalvendidas := a2^.dato.totalvendidas + v.cantvendidas //El producto ya existe en el árbol: acumulamos la cantidad vendida. duda v.cantvendidas!
    else if (v.codproducto < a2^.dato.codigo) then
        insertarsegundo(a2^.hi, v)
    else
        insertarsegundo(a2^.hd, v);
end;

procedure agregarVentaALista (var l: lista; v: venta3); 
var 
	nue: lista; 
begin 
	new(nue); 
	nue^.dato:= v; 
	nue^.sig:= l; 
	l:= nue; 
end; 

procedure crearregistro3(v: venta;var v3: venta3);
begin
	v3.fec:= v.fecha;
	v3.cantvend:= v.cantvendidas;
end;
 
procedure insertartercero (var a3: arbol3; v: venta; codigo: integer); 
var
	v3: venta3;
begin 
	if (a3=nil) then begin 
		new(a3);
        a3^.dato.mascodigo := codigo;
        a3^.dato.ventasrealizadas := nil;
        crearregistro3(v,v3);
        agregarVentaALista(a3^.dato.ventasrealizadas, v3); // agrego en la lista el registro 
        a3^.hi := nil;
        a3^.hd := nil; 
	end
	else
		if (codigo = a3^.dato.mascodigo) then //El producto ya existe: agregamos la nueva venta a su lista
        agregarVentaALista(a3^.dato.ventasrealizadas, v3)
    else 
		if (codigo < a3^.dato.mascodigo) then
        insertartercero(a3^.hi, v,codigo)
    else
        insertartercero(a3^.hd, v,codigo);
end; 

procedure cargararbol (var a: arbol; var a2: arbol2; var a3: arbol3); 
var 
	v: venta;
begin 
	leer(v);
	while (v.codproducto <> 0) do begin 
		insertar (a,v);
		insertarsegundo (a2, v);
		insertartercero(a3, v,v.codproducto); 
		leer(v);
	end; 
end; 



procedure incisob (a: arbol; fechita: integer; var totalcompras: integer); 
begin 
    if (a <> nil) then begin 
        if (a^.dato.fecha = fechita) then  
            totalcompras := totalcompras + a^.dato.cantvendidas;
        incisob(a^.hi,fechita,totalcompras); 
        incisob(a^.hd,fechita,totalcompras);
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
        incisoc(a2^.hi,maxvendidas,maxcodigo);  
        incisoc(a2^.hd,maxvendidas,maxcodigo);
    end; 
end; 
 

procedure incisod (a3: arbol3; var maxventas: integer; var mayorcodigo: integer);
var
    l: lista;
begin 
    if (a3<>nil) then begin 
        l := a3^.dato.ventasrealizadas;
        while (l <> nil) do begin
            if (maxventas < l^.dato.cantvend) then begin 
                mayorcodigo := a3^.dato.mascodigo;
                maxventas := l^.dato.cantvend;
            end;
            l := l^.sig;
        end;
        incisod (a3^.hi, maxventas, mayorcodigo);
        incisod (a3^.hd, maxventas, mayorcodigo);
	end; 
end;

var 
	a: arbol; 
	a2: arbol2; 
	a3:arbol3; 
	fechita, totalcompras, maxvendidas, maxcodigo, maxventas, mayorcodigo: integer; 
begin 
	totalcompras:= 0; 
    maxvendidas:= -1; 
    maxventas:= -1; 
	a:= nil; 
	a2:= nil; 
	a3:= nil; 
	cargararbol (a,a2,a3); 
	writeln (' ingresa una fecha entre 1 y 31: ');
	readln (fechita); 
	incisob (a, fechita, totalcompras); 
    writeln (' el total de compras en la fecha: ', fechita, ' es de : ', totalcompras);
    incisoc (a2, maxvendidas, maxcodigo);
    writeln(' el codigo que mas vendio fue: ', maxcodigo, ' con un total de ventas de: ', maxvendidas);
    incisod (a3, maxventas, mayorcodigo);
end.

