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

param CAP_MIN := 30; 

param M := 10000000;

param m := 0.000001;

/* Lecturas de CSV */

table tab_centros IN "CSV" "centros_reducido.csv" :
  CENTROS <- [id];

table tab_votantes IN "CSV" "votantes_reducido.csv" :
  VOTANTES <- [id];

table tab_distancias IN "CSV" "constantes_reducido.csv" :
  DISTANCIAS <- [id_votante, id_centro], d ~ distancia;

table tap_capacidad IN "CSV" "capacidades_reducido.csv" :
   CAPACIDADES <- [id], k ~ cap;

/* Definición de variables */

var Y{i in VOTANTES, j in CENTROS} >= 0, binary;

var YC{j in CENTROS} >= 0, binary;

var MAX >= 0;

var CANT_CENTRO{j in CENTROS} >= 0;

/* Funcional */
minimize z: sum{i in VOTANTES, j in CENTROS} (d[i,j]*Y[i,j]/card(VOTANTES)) + MAX;

/* Restricciones */

/* Solo se asigna un votante a un centro */
s.t. asignacion{i in VOTANTES}: sum{j in CENTROS} Y[i,j] = 1;

/* No se excede la capacidad de un centro en la asignación */
s.t. cantMax{j in CENTROS}: sum{i in VOTANTES} Y[i,j] <= YC[j] * k[j]; 

/* Se cumple la cantidad mínima para abrir un centro */
s.t. cantMin{j in CENTROS}: sum{i in VOTANTES} Y[i,j] >= CAP_MIN * YC[j]; 

/* Se obtiene la maxima distancia que recorre un votante asignado a un centro */
s.t. maxDistancia{i in VOTANTES, j in CENTROS}: MAX >= Y[i,j] * d[i,j]; 

/* Se obtiene la cantidad de votantes asignados a cada centro */
s.t. centroAsignacion{j in CENTROS}: sum{i in VOTANTES} Y[i,j] = CANT_CENTRO[j];

end;
