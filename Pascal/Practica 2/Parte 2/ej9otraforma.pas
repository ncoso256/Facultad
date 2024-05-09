program prac2.parte2;
function noEsPeso (c:char): boolean;
begin
  noEsPeso:= (c <> '$');
end;
function esCharArroba(c:char):boolean;
begin
  esCharArroba:= (c = '@');
end;
procedure CumpleA (var cumple: boolean ; var long: integer);
var
  c:char;
begin
  readln(c);
  while (c <> '%') and (cumple) do begin
    if(not noEsPeso(c)) then
      cumple:= false
    else begin
      cumple:= true;
      readln(c);
    end;
    long:= long + 1;
  end;
end;
procedure CumpleB (var cumple: boolean; largo: integer);
var
  c: char;
  veces,vezArroba:integer;
begin
  veces:= 0;
  vezArroba:= 0;
  readln(c);
   while(c <> '*') and (veces < largo) do begin {mientras no sea un caracter * o el largo de la secuencia sea menor a la variable ...}
     if(esCharArroba(c)) then begin
       vezArroba:= vezArroba + 1;
     end;
     readln(c);
     veces:= veces + 1;
   end;
   if (vezArroba > 2) then begin
     cumple:= true;
   end
   else begin
     cumple:= false;
   end;
   writeln('');
  end;
var
  cumple: boolean;
  largo: integer;
begin
  cumple:= true;
  largo:= 0;
  CumpleA(cumple,largo);
  if (cumple) then begin
    CumpleB(cumple,largo);
    if(cumple) then begin
      write('se cumple la secuencia');
    end else begin
      write ('no cumple b');
    end;
  end else begin
    write('no se cumple a');
  end;
end.
