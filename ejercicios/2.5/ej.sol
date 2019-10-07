Problem:    ej
Rows:       5
Columns:    4
Non-zeros:  12
Status:     UNDEFINED
Objective:  z = 0 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 z            B              0                             
     2 demMinSn     B              0         10000               
     3 demMaxSc     B              0          9000               
     4 dispMaqRap   B              0                         560 
     5 dispMaqLen   B              0                         480 

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 x_r_sn       NL             0             0                       < eps
     2 x_l_sn       NL             0             0                       < eps
     3 x_r_sc       NL             0             0                       < eps
     4 x_l_sc       NL             0             0                       < eps

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 1.00e+04 on row 2
        max.rel.err = 1.00e+00 on row 2
        PRIMAL SOLUTION IS INFEASIBLE

KKT.DE: max.abs.err = 7.20e+02 on column 4
        max.rel.err = 9.99e-01 on column 4
        DUAL SOLUTION IS WRONG

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
