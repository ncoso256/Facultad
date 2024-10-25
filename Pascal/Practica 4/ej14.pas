program catorce;
const 
    cantroles = 5;
    cantproyectos = 1000;
type
  {Tipos}
    str40= string[40];
    subrangoproyectos = 1..cantproyectos;
    subrangoroles = 1..cantroles;
    desarrollador = record
        pais: str40;
        codp: subrangoproyectos;
        nomp:string;
        rol: subrangoroles;
        horas: integer;
    end;
    arrayroles = array[subrangoroles] of real;
    arrayminimos = array[subrangoproyectos] of real;
    arrayarquitectos = array[subrangoproyectos] of integer;

procedure cargarroles(var vr: arrayroles); // se dispone
begin
    
end;

procedure leerdesarrollador(var d: desarrollador);
begin
    readln(d.pais);
    readln(d.codp);
    readln(d.nomp);
    readln(d.rol);
    readln(d.horas);
end;

procedure inicializarvectores(var vm; arrayminimos;var va: arrayarquitectos);
var
    i: subrangoproyectos;
begin
    for i := 1 to cantproyectos do begin
        vm[i]:= 0;
        va[i]:= 0;
    end;
end;

procedure cargardatos(var montoarg: real; var canthorasbd: integer;var vm: arrayminimos;var va: arrayarquitectos; vr: arrayroles);
var
    monto:real;
    dev: desarrollador;
begin
    montoarg:= 0;
    canthorasbd:= 0;
    leerdesarrollador(dev);
    while(dev.codp <> -1) do begin
        monto:= dev.horas * vr[dev.rol];
        if (dev.pais = 'Argentina') then
            montoarg:= montoarg + monto;
        if (dev.rol = 3) then
            canthorasbd:= canthorasbd + dev.horas;
        else begin
            if (dev.rol = 4) then begin
                va[dev.codp]:= va[dev.codp] + dev.horas;
                vm[dev.codp]:= vm[dev.codp] + monto;
                leerdesarrollador(dev);
            end;
        end;
    end;
end;

function codigomenormonto(v: arrayminimos):subrangoproyectos;
var
    pos, i: subrangoproyectos;
begin
    pos:= 1;
    for i:= 2 ro cantproyectos do begin
        if(v[i] < v[pos]) then pos:= i;
        codigomenormonto:= pos;
    end;
end;
procedure informararquis(v: arrayarquitectos);
var
    i: subrangoproyectos;
begin
    for i:= 1 to cantproyectos do
        writeln(' - ', i, ' : ', v[i]);
end;
var
  {Variables}
    vectorarq: arrayarquitectos;
    vectormin: arrayminimos;
    vectorroles: arrayroles;
    arg: real;
    bd: integer;
begin
  {Programa principal}
    cargarroles(vectorroles); //se dispone
    inicializarvectores(vectormin,vectorarq);
    cargardatos(arg,bd, vectormin,vectorarq,vectorroles);
end.
