# 2.30


### Hipotesis:
1. Las galletitas que no son Williams no pueden ser compradas.
2. LAs galletitas Williams son las únicas que se empaquetan.
3. Los costos "MP Y MO" proporcionados en la tabla representan la suma de los gastos de mano de obra y de mano de obra.
4. La hora trabajada de los empleados es neta.
5. La proporcion de galletitas rotas que se pueden canjear es máxima.
6. Los 20 empleados requeridos para el armado de bolsas son diarios.
7. No se pueden producir galletitas en horas extra
8. La demanda de bolsas es mínima
9. El "costo de venta" son todos los costos salvo los costos MP Y MO.
 


### Objetivo
Detenrmina la cantidad de galletitas a comprar/fabricar y las bolsas a armar de cada tipo para maximizar las ganancias durante una semana.


### Variables:
$A(kg/sem)$: $kg$ producidos de la galletita Anton en una semanada.
$C(kg/sem)$: $kg$ producidos de la galletita Cervantes en una semanada.
$W(kg/sem)$: $kg$ producidos de la galletita William en una semanada.
$M(kg/sem)$: $kg$ producidos de la galletita Mollier en una semanada.


$B1(bolsas/sem)$: cantidad de bolsas 1 producidas durante la semana.
$B2(bolsas/sem)$: cantidad de bolsas 2 producidas durante la semana.
$B3(bolsas/sem)$: cantidad de bolsas 3 producidas durante la semana.

$PW(paq/sem)$: cantidad de paquetes William producidos y comprados en la semana.
$PWC(paq/sem)$: cantidad de paquetes William comprados en la semana.
$PWP(paq/sem)$: cantidad de paquetes William producidos en la semana.
$PWCC(paq/sem)$: cantidad de paquetes William comprados y canjeados por estar en mal estado en la semana.
$PWCV(paq/sem)$: cantidad de paquetes William comprados y vendidos a pesar de estar en mal estado en la semana.


$AB1(kg/sem)$: $kg$ de galletitas Anton que van a la bolsa 1.
$AB2(kg/sem)$: $kg$ de galletitas Anton que van a la bolsa 2.
$AB3(kg/sem)$: $kg$ de galletitas Anton que van a la bolsa 3.

$AS3(kg/sem)$: $kg$ de galletitas Anton que van al surtido de la bolsa 3.
$WS3(kg/sem)$: $kg$ de galletitas William que van al surtido de la bolsa 3.


$CS1(kg/sem)$: $kg$ de galletitas Cervante que van al surtido de la bolsa 1.
$CS3(kg/sem)$: $kg$ de galletitas Cervante que van al surtido de la bolsa 3.

$CB2(kg/sem)$: $kg$ de galletitas Cervante que van a la bolsa 2.

$PWB1(kg/sem)$: $kg$ de galletitas William que van a la bolsa 1.
$PWB2(kg/sem)$: $kg$ de galletitas William que van a la bolsa 2.
$PWB3(kg/sem)$: $kg$ de galletitas William que van a la bolsa 3.

$HHN(hs/sem)$: horas hombres totales (sin contar las extras) utilizados en la semana.
$HHNA(hs/sem)$: horas hombres (sin contar las extras) utilizados para armar bolsas en la semana.
$HHNFG(hs/sem)$: horas hombres (sin contar las extras) utilizados para fabricar galletitas en la semana.

$HHEX(hs/sem)$: horas hombres extra totales utilizadas en la semana.


$HHEXEM(hs/sem)$: horas hombres extra utilizadas para empaquetar galletitas en la semana.
$HHEXAB(hs/sem)$: horas hombres extra totales utilizadas para armar bolsas en la semana.

### Resolución gráfica:
**Planteo del problema:**
```
/* Declaracion de variables */
var A >= 0;
var C >= 0;
var M >= 0;
var W >= 0;
var B1 >= 0;
var B2 >= 0;
var B3 >= 0;
var PW >= 0;
var PWC >= 0;
var PWF >= 0;
var AB1 >= 0;
var AB2 >= 0;
var AB3 >= 0;
var PWB1 >= 0;
var PWB2 >= 0;
var PWB3 >= 0;
var AS3 >= 0;
var WS3 >= 0;
var CS1 >= 0;
var CS3 >= 0;
var CB2 >= 0;
var PWCV >= 0;
var PWCC >= 0;


var HHN >= 0;
var HHEX >= 0;
var HHEXEM >= 0;
var HHEXAB >= 0;
var HHNAB >= 0;
var HHNFG >= 0;
var HM >= 0;

var P >= 0;

/* Definicion del funcional */
maximize z: 10*B1 + 20*B2 + 30*B3 + 3.6*PWCV - P*0.5 - (A*(1.5+0.8) + W*3 + C*(0.8+0.6) + M*(0.9+0.5)) - 3.5*PWC - HHEX*10;


/* Relaciones de variables */
s.t. antonTotal: A = AB1 + AB2 + AB3 + AS3;
s.t. cervanteTotal: C = CB2 + CS1 + CS3;
s.t. willTotal: W = WS3 + PW * 1/2;
s.t. paqWillTotalProvenientes: PW = PWC - PWCC * 1/(1-0.1)+ PWF;
s.t. paqWillTotalDestino: PW = PWB1 + PWB2 + PWB3 + PWCV;
s.t. paqWillFallados: PWC * 0.1 = PWCV + PWCC;

s.t. willFallCanjeados: PWC * 0.1 * 0.6 >= + PWCC;


s.t. hsExtraTotal: HHEX = HHEXAB + HHEXEM;
s.t. hsNormalesTotal: HHN = HHNAB + HHNFG;


/* Armado Bolsa 1 */
s.t. antonB1: B1 = AB1;
s.t. paqWillB1: B1 * 2 = PWB1;
s.t. surtidoB1: B1 = M + CS1;


/* Armado Bolsa 2 */
s.t. antonB2: 2 * B2 = AB2;
s.t. paqWillB2: B2 = PWB2;
s.t. cervanteB2: B2 = CB2;

/* Armado Bolsa 3 */
s.t. antonB3: B3 = AB3;
s.t. paqWillB3: B3 * 2 = PWB3;
s.t. surtidoB3: B3 * 2 = AS3 + WS3 + CS3;


/* Produccion */
s.t. dispMaxHsHom: HHN <= 320;
s.t. dispMinHHArmadoBolsas: HHNAB >= 20 * 8 * 5;
s.t. dispMaxHsHomExtra: HHEX <= 2*8*5;

s.t. demandaHorasMaq: HM = A*0.8 + 0.7*W + 0.5*C + 0.4*M;
s.t. relHHyHM: HM = 3*HHNFG;
s.t. demandaHHArmarBolsa: HHNAB = B1*0.5 + B2*0.10+B3*0.15;
s.t. demandaHHExtraEmp: HHEXEM = 0.02 * PWF;

/* Bolsa mas vendida */
s.t. bolsa1MasVendida: P >= B1;
s.t. bolsa2MasVendida: P >= AB2;
s.t. bolsa3MasVendida: P >= B3;

/* Demanda min */
s.t. dmb1: B1 >= 300;
s.t. dmb2: B2 >= 100;
s.t. dmb3: B3 >= 200;


end
```

**Solución:**
```
Problem:    ej
Rows:       32
Columns:    31
Non-zeros:  89
Status:     UNDEFINED
Objective:  z = 0 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 z            B              0                             
     2 antonTotal   B              0            -0             = 
     3 cervanteTotal
                    B              0            -0             = 
     4 willTotal    B              0            -0             = 
     5 paqWillTotalProvenientes
                    B              0            -0             = 
     6 paqWillTotalDestino
                    B              0            -0             = 
     7 paqWillFallados
                    B              0            -0             = 
     8 willFallCanjeados
                    B              0            -0               
     9 hsExtraTotal B              0            -0             = 
    10 hsNormalesTotal
                    B              0            -0             = 
    11 antonB1      B              0            -0             = 
    12 paqWillB1    B              0            -0             = 
    13 surtidoB1    B              0            -0             = 
    14 antonB2      B              0            -0             = 
    15 paqWillB2    B              0            -0             = 
    16 cervanteB2   B              0            -0             = 
    17 antonB3      B              0            -0             = 
    18 paqWillB3    B              0            -0             = 
    19 surtidoB3    B              0            -0             = 
    20 dispMaxHsHom B              0                         320 
    21 dispMinHHArmadoBolsas
                    B              0           800               
    22 dispMaxHsHomExtra
                    B              0                          80 
    23 demandaHorasMaq
                    B              0            -0             = 
    24 relHHyHM     B              0            -0             = 
    25 demandaHHArmarBolsa
                    B              0            -0             = 
    26 demandaHHExtraEmp
                    B              0            -0             = 
    27 bolsa1MasVendida
                    B              0            -0               
    28 bolsa2MasVendida
                    B              0            -0               
    29 bolsa3MasVendida
                    B              0            -0               
    30 dmb1         B              0           300               
    31 dmb2         B              0           100               
    32 dmb3         B              0           200               

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 A            NL             0             0                       < eps
     2 C            NL             0             0                       < eps
     3 M            NL             0             0                       < eps
     4 W            NL             0             0                       < eps
     5 B1           NL             0             0                       < eps
     6 B2           NL             0             0                       < eps
     7 B3           NL             0             0                       < eps
     8 PW           NL             0             0                       < eps
     9 PWC          NL             0             0                       < eps
    10 PWF          NL             0             0                       < eps
    11 AB1          NL             0             0                       < eps
    12 AB2          NL             0             0                       < eps
    13 AB3          NL             0             0                       < eps
    14 PWB1         NL             0             0                       < eps
    15 PWB2         NL             0             0                       < eps
    16 PWB3         NL             0             0                       < eps
    17 AS3          NL             0             0                       < eps
    18 WS3          NL             0             0                       < eps
    19 CS1          NL             0             0                       < eps
    20 CS3          NL             0             0                       < eps
    21 CB2          NL             0             0                       < eps
    22 PWCV         NL             0             0                       < eps
    23 PWCC         NL             0             0                       < eps
    24 HHN          NL             0             0                       < eps
    25 HHEX         NL             0             0                       < eps
    26 HHEXEM       NL             0             0                       < eps
    27 HHEXAB       NL             0             0                       < eps
    28 HHNAB        NL             0             0                       < eps
    29 HHNFG        NL             0             0                       < eps
    30 HM           NL             0             0                       < eps
    31 P            NL             0             0                       < eps

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 8.00e+02 on row 21
        max.rel.err = 9.99e-01 on row 21
        PRIMAL SOLUTION IS INFEASIBLE

KKT.DE: max.abs.err = 3.00e+01 on column 7
        max.rel.err = 9.68e-01 on column 7
        DUAL SOLUTION IS WRONG

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
```