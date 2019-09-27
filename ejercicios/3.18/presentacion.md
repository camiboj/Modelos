# 3.18

### Hipotesis:
1. No va a variar la cantidad de habitantes por distrito
2. EL tiempoo que tarda la ambulancia de ir de un distrito a otro no se modifica por ninguna circunstancia adversa.
3. La ambulancia está siempre disponible
4. El tiempk que tarda la ambulancia desde un distrito al otro es siempre el mismo sin importar el punto del distrito en el que se encuentra.



### Objetivo
Determinar en que distrito colocar la ambulanciapara minimizar el número de personas que están a más de 3 minutos de la misma durante un periodo dado.

### Contantes:
$P_i$: cantidad de habitantes en el distrito $i$ con $i,j \epsilon \{1,2,3,4,5,6,7,8\}$
$P_2 = B$
$P_3 = C$
$P_4 = D$
$P_5 = E$
$P_6 = F$
$P_7 = G$
$P_8 = H$

$C_{i,j}$: $1$ si del distrito $i$ al $j$ hay más de 3 minutos, $0$ sino. $\forall i \neq j$ con $i,j \epsilon \{1,2,3,4,5,6,7,8\}$

### Variables:
$X_i$: $1$ si la ambulancia se coloca en el distrito $i$, $0$ sino. con $i \epsilon \{1,2,3,4,5,6,7,8\}$

### Restricciones:
Bivalentes:
$X_i \leq 1$ con $i \epsilon \{1,2,3,4,5,6,7,8\}$

Cantidad de ambulancias:
$\sum_{i = 1}^{8} X_i = 1$

### Funcional:
$Z_{min} = \sum_{i = 1}^{8} [X_i * \sum_{j = 1}^{8} (C_{i,j} * P_j)]$ $\forall i \neq j$


### Resolución por sistema:
**Planteo del problema:**
```
/* Declaracion de variables */
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
```

**Solución:**
```
Problem:    ej
Rows:       2
Columns:    8 (8 integer, 8 binary)
Non-zeros:  16
Status:     INTEGER OPTIMAL
Objective:  z = 30 (MINimum)

   No.   Row name        Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 z                          30                             
     2 cantAmbulancias
                                   1             1             = 

   No. Column name       Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 X1           *              0             0             1 
     2 X2           *              0             0             1 
     3 X3           *              0             0             1 
     4 X4           *              0             0             1 
     5 X5           *              0             0             1 
     6 X6           *              1             0             1 
     7 X7           *              0             0             1 
     8 X8           *              0             0             1 

Integer feasibility conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
```