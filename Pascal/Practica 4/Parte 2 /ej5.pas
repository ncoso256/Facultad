program Ejercicio5;
cont
  dimFis = 500;

type
  rangoMes = 1..12;
  rangoDias = 1..31;
  Fecha = record
    dia:rangoDia;
    mes:rangoMes;
    anio:integer;
  end;
  
  rangoCate = 'A'..'F';
  rangoCod = 1..2400;
  Cliente = record
    fechaContrato:Fecha;
    cate:rangoCate;
    codCiudad: rangoCod;
    monto: real;
  end;

  vectorClientes = array[1..dimFis] of Cliente;
   
  vectorContPorCate = array[rangoCate] of integer;

  vectorContPorCiudad = array[rangoCiudad] of integer;

  datoMax = record
    cod: rangoCod;
    cant: integer;
  end;
  vectorMax = array[1..10] of datoMax;

procedure CargarClientes(var V:VectorClientes);
var i: integer;
begin
  for i := 1 to 500 do
     LeerReg(V[i]);
end;

procedure Calcular(V: vectorClientes; var Vcc: vectorContPorCate; var VecPorCiu: vectorContPorCiudad; var montoProm: real); 
var i,c,anioAct,mesAct,cantAnio: integer;
begin
  i := 1;
  while (i <= dimfis) do begin
    anioAct := V][i].fechaContrato.anio;
    cantAnio := 0;
    while (i <= dimfis) and (V][i].fechaContrato.anio = anioAct) do begin
       mesAct: = ...
       while ...
          c := V[i].cate;
          Vcc[c] := Vcc[c] + 1;
          i := i + 1;
    end;
end;

{falta completar ejercicio 5}
