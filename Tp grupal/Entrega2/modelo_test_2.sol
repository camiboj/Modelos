Problem:    modelo
Rows:       29
Columns:    21 (20 integer, 20 binary)
Non-zeros:  104
Status:     INTEGER OPTIMAL
Objective:  z = 78 (MINimum)

   No.   Row name        Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 z                          78                             
     2 asignacion[tomi]
                                   1             1             = 
     3 asignacion[ceci]
                                   1             1             = 
     4 asignacion[ale]
                                   1             1             = 
     5 asignacion[juan]
                                   1             1             = 
     6 cantMax[medallia]
                                   0                          -0 
     7 cantMax[raico]
                                   0                          -0 
     8 cantMax[facebook]
                                   0                          -0 
     9 cantMax[twitter]
                                  -8                          -0 
    10 cantMin[medallia]
                                   0            -0               
    11 cantMin[raico]
                                   0            -0               
    12 cantMin[facebook]
                                   0            -0               
    13 cantMin[twitter]
                                   1            -0               
    14 maxDistancia[tomi,medallia]
                                  50            -0               
    15 maxDistancia[tomi,raico]
                                  50            -0               
    16 maxDistancia[tomi,facebook]
                                  50            -0               
    17 maxDistancia[tomi,twitter]
                                   0            -0               
    18 maxDistancia[ceci,medallia]
                                  50            -0               
    19 maxDistancia[ceci,raico]
                                  41            -0               
    20 maxDistancia[ceci,facebook]
                                  50            -0               
    21 maxDistancia[ceci,twitter]
                                  50            -0               
    22 maxDistancia[ale,medallia]
                                  50            -0               
    23 maxDistancia[ale,raico]
                                  50            -0               
    24 maxDistancia[ale,facebook]
                                  50            -0               
    25 maxDistancia[ale,twitter]
                                   0            -0               
    26 maxDistancia[juan,medallia]
                                  50            -0               
    27 maxDistancia[juan,raico]
                                  50            -0               
    28 maxDistancia[juan,facebook]
                                  47            -0               
    29 maxDistancia[juan,twitter]
                                  50            -0               

   No. Column name       Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 Y[tomi,medallia]
                    *              0             0             1 
     2 Y[tomi,raico]
                    *              0             0             1 
     3 Y[tomi,facebook]
                    *              0             0             1 
     4 Y[tomi,twitter]
                    *              1             0             1 
     5 Y[ceci,medallia]
                    *              0             0             1 
     6 Y[ceci,raico]
                    *              1             0             1 
     7 Y[ceci,facebook]
                    *              0             0             1 
     8 Y[ceci,twitter]
                    *              0             0             1 
     9 Y[ale,medallia]
                    *              0             0             1 
    10 Y[ale,raico] *              0             0             1 
    11 Y[ale,facebook]
                    *              0             0             1 
    12 Y[ale,twitter]
                    *              1             0             1 
    13 Y[juan,medallia]
                    *              0             0             1 
    14 Y[juan,raico]
                    *              0             0             1 
    15 Y[juan,facebook]
                    *              1             0             1 
    16 Y[juan,twitter]
                    *              0             0             1 
    17 YC[medallia] *              0             0             1 
    18 YC[raico]    *              1             0             1 
    19 YC[facebook] *              1             0             1 
    20 YC[twitter]  *              1             0             1 
    21 MAX                        50             0               

Integer feasibility conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
