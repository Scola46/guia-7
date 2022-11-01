program ej7;
{Con el fin de lograr un control sobre el movimiento de personas en un edificio de oficinas, se registra
cada día del mes de marzo, cuántas personas se dirigen a cada uno de los 25 pisos del edificio.
Los datos están desordenados y consisten en triplas:
 Día, Piso Cantidad ( pueden repetirse el Día y el Piso, juntos o separados).
Ingresar la información desde un archivo, calcular e informar:
a. Para cada piso y cada día, la cantidad de personas que ingresaron.
b. Cantidad total de personas ingresadas al edificio durante el mes.
c. Promedio diario de personas que ingresaron a cada piso.
d. Para un determinado día, el porcentaje de personas que ingresaron dicho día sobre el total del mes.}
type
  tmat=array[1..31,1..25]of byte;
  tvec=array[1..31]of real;
procedure iniciomat(var mat:tmat);
var
  i,j:byte;
begin
  for i:=1 to 31 do
      for j:=1 to 25 do
          mat[i,j]:=0;
end;
procedure cargarmat(var mat:tmat);
var
  i,j:byte;
  arch:text;
  dia,piso,cant:byte;
begin
  assign (arch,'edificio.txt');
  reset (arch);
  while not eof (arch) do
        begin
          readln (arch,dia,piso,cant);
          mat[dia,piso]:=mat[dia,piso]+cant;
        end;
end;
procedure mostrar (mat:tmat);
var
  i,j:byte;
begin
  for i:=1 to 31 do
      begin
        for j:=1 to 25 do
            write (mat[i,j]:4);
        writeln;
      end;
end;
function total (mat:tmat):word;
var
  i,j:byte;
  sum:word;
begin
  sum:=0;
  for i:=1 to 31 do
      for j:=1 to 25 do
          sum:=sum+mat[i,j];
  total:=sum;
end;
procedure generaProm (mat:tmat;var vec:tvec);
var
  i,j:byte;
 sum:word;
begin
  sum:=0;
  for i:=1 to 31 do
      begin
        sum:=0;
        for j:=1 to 25 do
            sum:=sum+mat[i,j];
            vec[i]:=sum/25;
      end;
end;
function porcentaje(mat:tmat;dia:byte):real;
var
 j,sum:byte;
 t:word;

 begin
   t:=total(mat);
   sum:=0;
   for j:=1 to 25 do
       sum:=sum+mat[dia,j];
   if t<>0 then
      porcentaje:=(sum*100)/t;
 end;
var
  mat:tmat;
  vec:tvec;
  dia,i:byte;
begin
repeat
  writeln ('Ingrese un dia');readln(dia);
until (dia>0)and(dia<=31);
iniciomat (mat);
cargarmat (mat);
mostrar (mat);
total (mat);
writeln ('Total ',total(mat));
generaProm(mat,vec);
for i:=1 to 31 do
    writeln ('PROMEDIO DIA ',i:5,vec[i]:8:2);
porcentaje(mat,dia);
writeln ('PORCENTAJE ',porcentaje(mat,dia):8:2);
readln;
end.
