program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    writeln(sizeof(pc), ' bytes'); // puntero
    new(pc);
    writeln(sizeof(pc), ' bytes'); // puntero
    pc^:= 'un nuevo nombre'; 
    writeln(sizeof(pc), ' bytes'); // puntero
    writeln(sizeof(pc^), ' bytes'); {50+1= 51 bytes} 
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes'); {50+ 1 = 51 bytes}
 end.
