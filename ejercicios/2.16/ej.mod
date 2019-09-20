/*** Declaracion de variables ***/
var T0 >= 0;
var T1 >= 0;
var T2 >= 0;
var T3 >= 0;
var T4 >= 0;

var E1 >= 0;
var E2 >= 0;
var E3 >= 0;
var E4 >= 0;

var P_MAYOR_1 >= 0;
var P_MAYOR_2 >= 0;
var P_MAYOR_3 >= 0;
var P_MAYOR_4 >= 0;

var P_MENOR_1 >= 0;
var P_MENOR_2 >= 0;
var P_MENOR_3 >= 0;
var P_MENOR_4 >= 0;

/*** Objetivo funcional ***/
minimize z: (P_MAYOR_1 + P_MAYOR_2 + P_MAYOR_3 + P_MAYOR_4) + (P_MENOR_1 + P_MENOR_2 + P_MENOR_3 + P_MENOR_4) * 0.5;

/*** Restricciones ***/

/* Se arranca con stock nulo */
s.t. stockInicial: E1 = 0;

/* La producción anterior es de 6000 u */
s.t. ultProd: T0 = 600;

/* Nivel de inventarios a fin del año próximo */
s.t. stockT4: E4 = 1000;



/* Producción necesaria para cumpplir pronósticos */
/* s.t. prodT1: T1 + E1 >= 9000 */
/* s.t. prodT2: T2 + E2 >= 24000 */
/* s.t. prodT3: T3 + E3 >= 20000 */
/* s.t. prodT4: T4 + E4 >= 7000 */

/* Relación excedente y producción anterior */
s.t. excT1: T1 + E1 - 9000 = E2;
s.t. excT2: T2 + E2 - 24000 = E3;
s.t. excT3: T3 + E3 - 20000 = E4;

/* Almacenamiento de stock máximo */
s.t. stockMax1: E1 <= 5000;
s.t. stockMax2: E2 <= 5000;
s.t. stockMax3: E3 <= 5000;
s.t. stockMax4: E4 <= 5000;

/* Aumento y disminución de la producción */
s.t. varT1: T1 - T0 = P_MAYOR_1 - P_MENOR_1;
s.t. varT2: T2 - T1 = P_MAYOR_2 - P_MENOR_2;
s.t. varT3: T3 - T2 = P_MAYOR_3 - P_MENOR_3;
s.t. varT4: T4 - T3 = P_MAYOR_4 - P_MENOR_4;

