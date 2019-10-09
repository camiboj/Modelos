set I, dimen 12;
param  x{I};
table tin IN "CSV" "constantes_reducido.csv" :
I <- [id_votante,centro_1,centro_2,centro_3,centro_4,centro_5,centro_6,centro_7,centro_8,centro_9,centro_10,centro_11];
printf "Number of values: %d\n", card(I);

#Centros
set C := setof{(i_1, i_2, i_3, i_4, i_5, i_6, i_7, i_8, i_9, i_10, i_11, i_12) in I} (i_2, i_3, i_4, i_5, i_6, i_7, i_8, i_9, i_10, i_11, i_12);

for{(i_1, i_2, i_3, i_4, i_5, i_6, i_7, i_8, i_9, i_10, i_11) in C} {
    printf "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s", i_1, i_2, i_3, i_4, i_5, i_6, i_7, i_8, i_9, i_10, i_11;
    printf "\n";
}

end;
