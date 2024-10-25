program punteros;
type
    cadena = string[9];
    producto = record // 2+10+4
        codigo: integer; 
        descripcion: cadena;
        precio: real;
    end;
    puntero_producto = ^producto;
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes'); // puntero 4 bytes
    writeln(sizeof(prod), ' bytes');  // 16 bytes
    new(p);
    writeln(sizeof(p), ' bytes'); // 4 bytes
    p^.codigo:= 1; 
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes'); //16+(4+4) = 24  
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes'); // 24 bytes
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes'); // 16 bytes
end.
