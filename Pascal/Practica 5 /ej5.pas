program alocaciondinamica; // ejercicio 5
type
    templeado = record
        sucursal: char; 
        apellido: string[25];
        correoelectronico: string[40];
        sueldo: real;
    end;
    str50 = string[50]; {51}
var
    alguien: templeado; {1+26+41+4= 72}
    ptrempleado: ^templeado; {4+72 = 76}
begin
    {suponer que en este punto se cuenta con 400.000 bytes de memoria disponible} {1}
    readln(alguien.apellido);
    new(ptrempleado); {76} 
    {¿Cuanta memoria disponible hay ahora?} {400.000 - 76 = 399.924}
    
    readln(ptrempleado^.sucursal, ptrempleado^.apellido); 
    readln(ptrempleado^.correoelectronico, ptrempleado^.sueldo);
    {cuanta memoria disponible hay ahora?} {399.924}
    
    dispose(ptrempleado); {0}
    {¿Cuanta memoria disponible hay ahora?} {399.924}
end.
