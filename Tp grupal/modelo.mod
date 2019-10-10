set DISTANCIAS dimen 2;
/* id_votante, id_centro, distancia */

set VOTANTES;
/* id_votante */

set CENTROS;
/* id_centro */

set CAPACIDADES;
/* capacidad */

param d{v in VOTANTES, c in CENTROS}; /* par votante-centro */
/* distancia en kilometros */

param k{v in CAPACIDADES};
/* capacidad de cada centro */

table tab_centros IN "CSV" "centros_reducido.csv" :
  CENTROS <- [id];

table tab_votantes IN "CSV" "votantes_reducido.csv" :
  VOTANTES <- [id];

table tab_distancias IN "CSV" "test.csv" :
  DISTANCIAS <- [id_votante, id_centro], d ~ distancia;

table tap_capacidad IN "CSV" "centros_reducido_cap.csv" :
   CAPACIDADES <- [id], k ~ cap;

for{(i_1, i_2) in DISTANCIAS} {
    printf "%s,%s\n", i_1, i_2;
    printf "%d\n", d[i_1, i_2]; 
}

for{i in CAPACIDADES} {
   printf "Ahora la capacidad: %d\n", k[i];
}

end;
