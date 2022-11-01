program ej1;
{Ingresar una matriz de N x M de enteros resolver mediante procedimientos o funciones los siguientes
puntos y mostrar el resultado:
 a. Dado un número, calcular cuantas veces se repite (puede no estar).
 b. Indicar cuántos elementos son nulos, positivos y negativos.
 c. Intercambiar la fila K con la fila H (K y H menor o igual que N) }
type
  Mat=array[1..50,1..50]of integer;
procedure leermat (m,n:integer;var matriz:mat);
var
  i,j:byte;
  num:integer;
begin
  for i:=1 to N do
      for j:=1 to M do
          begin
            writeln ('Ingrese un numero');readln (num);
            matriz[i,j]:=num;
          end;

end;
function repite (m,n:byte;x:integer;matriz:mat):byte;
var
  i,j,contx:byte;
begin
  contx:=0;
  for i:=1 to N do
      for j:=1 to M do
          if matriz[i,j]=x then
             contx:=contx+1;
  repite:=contx;
end;
procedure elementos (matriz:mat;m,n:byte;var contN,Contp,contnulo:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
      for j:=1 to M do
           if matriz[i,j]=0 then
              contnulo:=contnulo+1
           else
             if matriz [i,j]>0 then
                contp:=contp+1
           else
             contn:=contn+1;
end;
procedure intercambio (k,h,m:byte;var matriz:mat);
var
  j:byte;
  aux:integer;
begin
  for j:=1 to m do
      begin
        aux:=matriz[k,j];
        matriz[k,j]:=matriz[h,j];
        matriz[h,j]:=aux;
      end;
end;

var
  m,n,k,h,x:integer;
  matriz:mat;
  contp,contn,contnulos,contx:byte;

begin
  contn:=0;contp:=0;contnulos:=0;
  repeat
    writeln ('Ingrese M');readln (M);
  until (m>0);
  repeat
    Writeln ('Ingrese N');readln (N);
  until (n>0) ;
  repeat
    writeln ('Ingrese K');readln(k);
  until (k>0)and(k<=N) ;
  repeat
    writeln ('Ingrese H');readln (H);
  until (h>0)and(h<=n);
  writeln ('Ingrese X');readln(X);
  leermat (m,n,matriz);
  repite(m,n,x,matriz);
    writeln ('Se repite ',repite(m,n,x,matriz));
  elementos (matriz,m,n,contn,contp,contnulos);
  intercambio(k,h,m,matriz);
  writeln ('Positivos ',contp,' Negativos ',contn,' Nulos ',contnulos);
  readln;

end.


