program p1_1ej9;
var  op: char;    
num, resultado: integer;
begin   
writeln('Ingrese el operador + o -');   
readln(op);   
if (op = '+') or (op ='-')     then begin         
writeln('Ingrese un número. Finalice con 0');         
readln(num);         
resultado := num;        
 while (num <> 0) do begin             
 readln(num);             
 if (op = '+')               
 then resultado := resultado + num               
 else resultado := resultado - num;         
 end; {Acá termina el while}         
 writeln('El resultado es: ', resultado);     
 end     
 else writeln('Error');
 end.
