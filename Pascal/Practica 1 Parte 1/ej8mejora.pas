Program vocales; {correccion 8}
var
  car:char;
  vocal, i:integer;
begin
vocal:=0;
for i:=1 to 3 do begin
    readln(car);
    if (car='a') or (car='e')or(car='i')or(car='o')or(car='u') 
     then vocal:=vocal+1;
end;
if (vocal=3) then
    writeln('Las 3 son vocales')
else
    writeln('Al menos un carácter no era vocal');
end.
