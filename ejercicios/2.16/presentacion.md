# 2.16


### Hipotesis:
1. Se vende exactamente lo que se ronosticó.
2. No hay stock previo
3. La producción anterior es de $6000 u$.
4. Los recursos no son limitantes.


### Objetivo
Detenrmina el programa de producción trimestral para minimizar costos en la variación de la produccion en un periodo de un año.

### Variables: 
$T_i (unidades)$: la cantidad de unidades producidas en el trimestre $i$ 
$T_0 (unidades)$: la cantidad de unidades producidas en el trimestre previo al periodo de analisis$i$ 

$E_i (unidades)$: excedente del trimestre $i$ con respecto al trismestre anterior.

$PMAYOR_i (unidades)$: aumento de producción del trimestre $i$ con respecto al trismestre anterior.
$PMENOR_i (unidades)$: disminución de producción del trimestre $i$ con respecto al trismestre anterior.

$i \epsilon \{1, 2, 3, 4\}$

### Objetivo funcional:
$Z_{min} = \sum_{i=1}^4 (PMAYOR_i - PMENOR_i *0.5)$

### Resolución por software:
## .mod
```
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
```

## .sol

```
Problem:    ej
Rows:       15
Columns:    17
Non-zeros:  40
Status:     OPTIMAL
Objective:  z = 19400 (MINimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 z            B          19400                             
     2 stockInicial NS             0            -0             =         < eps
     3 ultProd      NS           600           600             =            -1 
     4 stockT4      NS          1000          1000             =           0.5 
     5 excT1        NS          9000          9000             =         < eps
     6 excT2        NS         24000         24000             =           0.5 
     7 excT3        NS         20000         20000             =           0.5 
     8 stockMax1    B              0                        5000 
     9 stockMax2    NU          5000                        5000          -0.5 
    10 stockMax3    B           1000                        5000 
    11 stockMax4    B           1000                        5000 
    12 varT1        NS             0            -0             =            -1 
    13 varT2        NS             0            -0             =            -1 
    14 varT3        NS             0            -0             =          -0.5 
    15 varT4        NS             0            -0             =         < eps

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 T0           B            600             0               
     2 T1           B          14000             0               
     3 T2           B          20000             0               
     4 T3           B          20000             0               
     5 T4           B          20000             0               
     6 E1           B              0             0               
     7 E2           B           5000             0               
     8 E3           B           1000             0               
     9 E4           B           1000             0               
    10 P_MAYOR_1    B          13400             0               
    11 P_MAYOR_2    B           6000             0               
    12 P_MAYOR_3    NL             0             0                         0.5 
    13 P_MAYOR_4    NL             0             0                           1 
    14 P_MENOR_1    NL             0             0                         1.5 
    15 P_MENOR_2    NL             0             0                         1.5 
    16 P_MENOR_3    NL             0             0                           1 
    17 P_MENOR_4    NL             0             0                         0.5 

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 0.00e+00 on column 0
        max.rel.err = 0.00e+00 on column 0
        High quality

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output

```
