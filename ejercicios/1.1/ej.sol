Problem:    1_1
Rows:       5
Columns:    4
Non-zeros:  10
Status:     OPTIMAL
Objective:  z = 24000 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 z            B          24000                             
     2 procEq1      NS             0            -0             =         < eps
     3 procEq2      NS             0            -0             =         -1200 
     4 demMinAl     B             60            40               
     5 demMaxB      NU            20                          20          1200 

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 A            B             20             0               
     2 B            NL             0             0                       -2000 
     3 Al           B             60             0               
     4 C            B             20             0               

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
