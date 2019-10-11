/* Definición de conjuntos */

set DISTANCIAS dimen 2;
/* id_votante, id_centro, distancia */

set VOTANTES;
/* id_votante */

set CENTROS;
/* id_centro */

set CAPACIDADES;
/* capacidad */

/* Definición de parámetros */

param d{v in VOTANTES, c in CENTROS}; /* par votante-centro */
/* distancia en kilometros */

param k{v in CENTROS};
/* capacidad máxima de cada centro */

param CAP_MIN := 2; 

param M := 10000000;

/* Lecturas de CSV */

table tab_centros IN "CSV" "test_centros.csv" :
  CENTROS <- [id];

table tab_votantes IN "CSV" "test_votantes.csv" :
  VOTANTES <- [id];

table tab_distancias IN "CSV" "test_distancia.csv" :
  DISTANCIAS <- [id_votante, id_centro], d ~ distancia;

table tap_capacidad IN "CSV" "test_capacidad.csv" :
   CAPACIDADES <- [id], k ~ cap;

/* Definición de variables */

var Y{i in VOTANTES, j in CENTROS: i<>j} >= 0, binary;

var YC{j in CENTROS} >= 0, binary;

/* Funcional */
minimize z: sum{(i, j) in DISTANCIAS: i<>j} d[i,j]*Y[i,j];

/* Restricciones */

/* Solo se asigna un votante a un centro */
s.t. asignacion{i in VOTANTES}: sum{j in CENTROS: i<>j} Y[i,j] = 1;

/* No se excede la capacidad de un centro en la asignación */
s.t. cantMax{j in CENTROS}: sum{i in VOTANTES: i<> j} Y[i,j] <= YC[j]*k[j]; 

/* Se cumple la cantidad mínima para abrir un centro */
s.t. cantMin{j in CENTROS}: sum{i in VOTANTES: i<> j} Y[i,j] >= CAP_MIN*YC[j]; 

end;
