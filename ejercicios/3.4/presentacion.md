# 3.4
---

### Hipotesis:
1. Las personas que se elijan estarán completamente disponibles para participar del proyecto
2. Las situaciones conflictivas no variaran.
3. El costo de remplazo será siempre el mismo
4. No puede haber dos personas conflictivas en el grupo
5. No se incluirá en el grupo al protegide si no es eficiente. Es decir, no se incluira a ningune protegide si no está le mentor.
6. El costo de remplazo total se calculara como la sumaria de los costos de remplazo de todes les integrantes del grupo.
7. No deben pertenecer al grupo dos personas con conflictos.


### Objetivo
Detenrmina las seis personas que formaran parte del grupo para minizar el costos de remplazo total durante el plazo del proyecto.

### Constantes:
$CR_{i}$ = costo de remplazo por contratar a la persona $i$. 

### Variables:
$X_{i}$ = 1 si se contrata a la persona $i$, 0 sino. 
$Q (personas)$: cantidad de quimiques contratades para participar del proyecto.
$C (personas)$: cantidad de contadores contratades para participar del proyecto.
$I (personas)$: cantidad de ingenieres contratades para participar del proyecto.

$Y_{1}$ = 1 si se contrata a Smith y Vidal, 0 sino.
$Y_{2}$ = 1 si hay más de dos benevolentes, 0 sino.

$i \epsilon \{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12\}$


### Objetivo funcional:
$$Z_{MIN} = \sum_{i = 1}^{12} (X_{i} * CR_{i} (\$)) - 100(\$)* Y_{1}$$

### Relación de variables:
$X_{i} \leq 1$

**Profesión de las personas** 
$Q = X_{2} + X_{7}$
$C = X_{1} + X_{4} + X_{5} + X_{8} + X_{11}$
$I = X_{3} + X_{9} + X_{10}$
             
### Restricciones:
**Cantidad de integrantes del grup**

$\sum_{i = 1}^{12} X_{i} = 6$

**Debe haber por lo menos 1 ingeniero, 1 químico y 2 contadores**
$I \geq 1$
$Q \geq 1$
$C \geq 2x$

**No puede haber más de 3 contadores, salvo que pertenezcan Vidal ($X_{11}$) y Smith ($X_{3}$) al grupo, entonces puede haber hasta 4 contadore**

$2 Y_{1} \leq X_{7} + X_{11} \leq Y_{1} + 1$
$C \leq 3 + Y_{1}$

**No deben encontrarse en el grupo 2 personalidades antagónicas**
Si están $X_{1}$, $X_{5}$ o $X_{7}$ no debe estar ni $X_{2}$ ni $X_{6}$:
$1 - X_{2} \leq X_{1} + X_{5} + X_{7} \leq 3 (1 - X_{2})$
$1 - X_{6}\leq X_{1} + X_{5} + X_{7} \leq 3 (1 - X_{6})$
y viceversa:
$1 - X_{1} \leq X_{2} + X_{6} \leq 2 (1 - X_{1})$
$1 - X_{5} \leq X_{2} + X_{6} \leq 2 (1 - X_{5})$
$1 - X_{7} \leq X_{2} + X_{6} \leq 2 (1 - X_{7})$

**No se incluirá en el grupo al protegide si no es eficiente. Es decir, no se incluira a ningune protegide si no está le mentor**
$X_{6} \leq X_{4}$

**No deben pertenecer al grupo dos personas con conflictos**
$X_{2} = 1-X_{11}$
$X_{3} = 1-X_{4}$

**Si hay dos benevolentes o más se ahorran $ 100.**

$2 Y_{2} \leq X_{4} + X_{8} + X_{11} + X_{12} \leq 4 Y_{2}$

### Resolución por software:
##.mod
```
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
```

## .sol

```
Problem:    ej
Rows:       23
Columns:    17 (14 integer, 14 binary)
Non-zeros:  85
Status:     INTEGER OPTIMAL
Objective:  z = 16100 (MINimum)

   No.   Row name        Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 z                       16100                             
     2 tamGrupo                    6             6             = 
     3 cantIng                     1             1               
     4 cantQuim                    1             1               
     5 cantCont                    1             1               
     6 mc1                        -1                          -0 
     7 mc2                         1                           1 
     8 mc3                         1                           3 
     9 siG1NoX2_01                -3                          -1 
    10 siG1NoX2_02                 3                           3 
    11 siG1NoX6_01                -3                          -1 
    12 siG1NoX6_02                 3                           3 
    13 siG2NoX1_01                -1                          -1 
    14 siG2NoX1_02                 0                           2 
    15 siG2NoX5_01                -1                          -1 
    16 siG2NoX5_02                 2                           2 
    17 siG2NoX7_01                -1                          -1 
    18 siG2NoX7_02                 2                           2 
    19 protegidoMentor
                                   0                          -0 
    20 conf2Y11                    0                           1 
    21 conf3Y4                     1                           1 
    22 ben_01                      0                          -0 
    23 ben_02                      0                          -0 

   No. Column name       Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 X_1          *              1             0             1 
     2 X_2          *              0             0             1 
     3 X_3          *              1             0             1 
     4 X_4          *              0             0             1 
     5 X_5          *              1             0             1 
     6 X_6          *              0             0             1 
     7 X_7          *              1             0             1 
     8 X_8          *              0             0             1 
     9 X_9          *              1             0             1 
    10 X_10         *              1             0             1 
    11 X_11         *              0             0             1 
    12 X_12         *              0             0             1 
    13 Y_1          *              0             0             1 
    14 Y_2          *              0             0             1 
    15 Q                           1             0               
    16 I                           1             0               
    17 C                           1             0               

Integer feasibility conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
```
