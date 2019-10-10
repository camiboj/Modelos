set D dimen 2;
/* id_votante, id_centro, distancia */

set V;
/* id_votante */

set C;
/* id_centro */

set K;
/* capacidad */

param a{v in V};
/* leo id_votante */

param b{c in C};
/* leo id_centro */

param d{v in V, c in C};
/* distancia en kilometros */

param k{v in V};
/* capacidad de cada centro */

table tab_centros IN "CSV" "centros_reducido.csv" :
  C <- [id];

table tab_votantes IN "CSV" "votantes_reducido.csv" :
  V <- [id];

table tab_distancias IN "CSV" "test.csv" :
  D <- [id_votante, id_centro], d ~ distancia;

table tap_capacidad IN "CSV" "centros_reducido_cap.csv" :
   K <- [id], k ~ cap;

for{(i_1, i_2) in D} {
    printf "%s,%s\n", i_1, i_2;
    printf "%d\n", d[i_1, i_2]; 
}

for{i in K} {
   printf "Ahora la capacidad: %d\n", k[i];
}

end;
