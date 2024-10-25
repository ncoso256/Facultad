program punteros; // 4b
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    //error error error
    // new(pc) para acceder a ^cadena
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes'); // error
    writeln(pc^);
    dispose(pc);
    pc^:= 'otro nuevo nombre';
end.
