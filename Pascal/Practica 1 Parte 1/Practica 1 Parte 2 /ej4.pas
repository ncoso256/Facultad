program p1p2_ej4;
var
    num,min1,min2,i:integer;
begin
    min1:=9999;
    min2:=9999;
    for i:=1 to 1000 do begin
        writeln('Ingresar número: '); readln(num);
        if (num < min1) then begin
            min2:=min1;
            min1:=num;
            end
        else if (num < min2) then
            min2:=num;
    end;
    writeln('El primer mínimo es: ',min1);
    writeln('El segundo mínimo es: ',min2);
end.
