Problem:    modelo
Rows:       7
Columns:    6 (6 integer, 6 binary)
Non-zeros:  20
Status:     INTEGER OPTIMAL
Objective:  z = 50 (MINimum)

   No.   Row name        Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 z                          50                             
     2 asignacion[cami]
                                   1             1             = 
     3 asignacion[ceci]
                                   1             1             = 
     4 cantMax[medallia]
                                 -98                          -0 
     5 cantMax[mulesoft]
                                   0                          -0 
     6 cantMin[medallia]
                                   0            -0               
     7 cantMin[mulesoft]
                                   0            -0               

   No. Column name       Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 Y[cami,medallia]
                    *              1             0             1 
     2 Y[cami,mulesoft]
                    *              0             0             1 
     3 Y[ceci,medallia]
                    *              1             0             1 
     4 Y[ceci,mulesoft]
                    *              0             0             1 
     5 YC[medallia] *              1             0             1 
     6 YC[mulesoft] *              0             0             1 

Integer feasibility conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
