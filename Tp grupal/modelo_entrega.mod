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

param CAP_MIN := 1; 

param M := 10000000;

param m := 0.000001;

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

var Y{i in VOTANTES, j in CENTROS} >= 0, binary;

var YC{j in CENTROS} >= 0, binary;

var YMAX{i in VOTANTES, j in CENTROS} >= 0, binary;

var YMIN{i in VOTANTES, j in CENTROS} >= 0, binary;

var MAX_CENTRO{j in CENTROS} >= 0;

var MIN_CENTRO{j in CENTROS} >= 0;

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

/* Se obtiene la maxima distancia que recorre un votante asignado a un centro */
s.t. maxCentro1{i in VOTANTES, j in CENTROS}: MAX_CENTRO[j] >= Y[i,j] * d[i,j]; 
s.t. maxCentro2{i in VOTANTES, j in CENTROS}: MAX_CENTRO[j] <= Y[i,j] * d[i,j] + M * (1 - YMAX[i,j]);
s.t. bivalentesMaximo{j in CENTROS}: sum{i in VOTANTES} YMAX[i,j] <= 1;
s.t. bivalentesRelacion{i in VOTANTES, j in CENTROS}: YMAX[i,j] <= Y[i,j];

/* Se obtiene la minima distancia que recorre un votante asignado a un centro */
s.t. minCentro1{i in VOTANTES, j in CENTROS}: MIN_CENTRO[j] <= Y[i,j] * d[i,j]; 
s.t. minCentro2{i in VOTANTES, j in CENTROS}: MIN_CENTRO[j] >= Y[i,j] * d[i,j] - (1 - YMIN[i,j])*M;
s.t. bivalentesMinimo{j in CENTROS}: sum{i in VOTANTES} YMIN[i,j] <= 1;
s.t. bivalentesMinimoRelacion{i in VOTANTES, j in CENTROS}: YMIN[i,j] <= Y[i,j];

end;
