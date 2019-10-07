/* Declaracion de variables */
var X1 >= 0, binary;
var X2 >= 0, binary;
var X3 >= 0, binary;
var X4 >= 0, binary;
var X5 >= 0, binary;
var X6 >= 0, binary;
var X7 >= 0, binary;
var X8 >= 0, binary;

/* Declaracion constantes */
param A := 10;
param B := 20;
param C := 30;
param D := 40;
param E := 50;
param F := 60;
param G := 70;
param H := 80;


/* Definicion del funcional */
minimize z: X1 * (C + D + E + F + G + H) + X2 * (C + D + E + F + G + H) + X3 * (A + B + G + H) + X4 * (A + B + G + H) + X5 * (A + B + H) + X6 * (A + B) + X7 * (A + B + C + D) + X8 * (A + B + C + D + E);


/* Relaciones de variables */
s.t. cantAmbulancias: X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8 = 1;

end;



