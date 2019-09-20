/* Declaracion de variables */
var X_1 >= 0, binary;
var X_2 >= 0, binary;
var X_3 >= 0, binary;
var X_4 >= 0, binary;
var X_5 >= 0, binary;
var X_6 >= 0, binary;
var X_7 >= 0, binary;
var X_8 >= 0, binary;
var X_9 >= 0, binary;
var X_10 >= 0, binary;
var X_11 >= 0, binary;
var X_12 >= 0, binary;

var Y_1 >= 0, binary;
var Y_2 >= 0, binary;

var Q >= 0;
var I >= 0;
var C >= 0;

/* Definicion del funcional */
minimize z: X_1 * 2500 + X_2 * 2000 + X_3 * 1800 + X_4 * 3000 + X_5 * 2500 + X_6 * 1500 + X_7 * 3500 + X_8 * 4000 + X_9 * 2800 + X_10 * 3000 + X_11 * 2500 + X_12 * 5000 - 100 * Y_1;

/* Restricciones */

/* Tam grupo */
s.t. tamGrupo: X_1 + X_2 + X_3 + X_4 + X_5 + X_6 + X_7 + X_8 + X_9 + X_10 + X_11 + X_12 = 6;

/* Demanda minima de profesionales */
s.t. cantIng: I >= 1;
s.t. cantQuim: Q >= 1;
s.t. cantCont: C >= 1;

/* Demanda max de contadores */
s.t. mc1: 2 * Y_1 <= X_7 + X_11;
s.t. mc2: X_7 + X_11 <= Y_1 + 1;
s.t. mc3: C <= Y_1 + 3;

/* Personalidades antagónicas */
s.t. siG1NoX2_01: 1-X_2 <= X_1 + X_5 + X_7;
s.t. siG1NoX2_02: X_1 + X_5 + X_7 <= 3*(1-X_2);

s.t. siG1NoX6_01: 1-X_6 <= X_1 + X_5 + X_7;
s.t. siG1NoX6_02: X_1 + X_5 + X_7 <= 3*(1-X_6);

s.t. siG2NoX1_01: 1-X_1 <= X_2 + X_6;
s.t. siG2NoX1_02: X_2 + X_6 <= 2*(1-X_2);

s.t. siG2NoX5_01: 1-X_5 <= X_2 + X_6;
s.t. siG2NoX5_02: X_2 + X_6 <= 2*(1-X_5);

s.t. siG2NoX7_01: 1-X_7 <= X_2 + X_6;
s.t. siG2NoX7_02: X_2 + X_6 <= 2*(1-X_7);

/* Mentor y protegido */
s.t. protegidoMentor: X_6 <= X_4;

/* Personas conflictivas */
s.t. conf2Y11: X_2 + X_11 <= 1;
s.t. conf3Y4: X_3 + X_4 <= 1;

/* Personas Benevolentes */
s.t. ben_01:2*Y_2 <= X_4 + X_8 + X_11 + X_12;
s.t. ben_02: X_4 + X_8 + X_11 + X_12 <= 4*Y_2; 
