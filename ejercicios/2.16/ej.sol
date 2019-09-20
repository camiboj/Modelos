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
