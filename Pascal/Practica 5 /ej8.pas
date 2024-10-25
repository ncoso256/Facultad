program memoria; // ejercicio 8

type
  datos = array[1..20] of integer; {20*2= 40}
  punt = ^datos; {4 bytes}
procedure procesardatos(v: datos; var v2: datos); {4*40, 40}
var
 i, j: integer; {2 y 2 bytes}
begin
    for i:= 1 to 20 do
        v2[21 - i]:= v[i]; {d} {estatica: 80+4+4 =}
end;
var
  vect: datos; 
  pvect: punt; {4 bytes}
  i: integer; {2 bytes}
begin 
    for i:= 1 to 20 do {a} 
        vect[i]:= i; 
    new(pvect);{b} {4 bytes}
    for i:= 20 downto 1 do
        pvect^[i]:= 0;
    procesardatos(pvect^, vect); {c} {88 bytes}
    writeln('fin');
end. {e} {est: 40+ 88+ 4 +2 +4= 138} {din: 4}
