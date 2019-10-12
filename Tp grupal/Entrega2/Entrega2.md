---
geometry: margin=1in
header-includes:  \usepackage[spanish]{babel}
---

## Enunciado provisto

_Debido a las recurrentes quejas de los votantes por las distancias que deben recorrer desde sus domicilios hasta los lugares de votación, la Dirección Nacional Electoral desea rever la forma en que se asignan los ciudadanos a las mesas de votación. Se realizará una prueba piloto en un circuito electoral de la Ciudad de Buenos Aires._

## Análisis de la situación problemática

A modo de simplificación el modelo se limitará a asignar cada votante a un cupo de un centro de votación ya que una vez realizada esta tarea la división de votantes en mesas dentro de cada centro es trivial. El enfoque a seguir asigna votantes a centros de votación, es decir, a cada centro se le asignan los `n` votantes (siendo `n` la disponibilidad máxima del centro) más cercanos a él. De esta forma se asegura que cada votante se asigne al centro más cercano si es que el mismo no llenó su cupo con votantes aún más cercanos al mismo.

El tipo de problema detectado es de asignación ya que consiste en encontrar la forma de asignar ciertos recursos disponibles (votantes) para la realización de determinadas tareas al menor costo (distancia de cada votante al centro de votación). Se puede pensar en forma gráfica como un grafo bipartito, expuesto en la _Figura 1_, en el que los puntos superiores serían los votantes y los inferiores los cupos asignados en los centros de votación.

![Grafo bipartito del problema de asignación](/home/cecix/Documents/Modelos/Tp grupal/Modelos/Tp grupal/Entrega2/grafo.png){ width=250px }

## Objetivo

Determinar los votantes que votarán en cada centro de votación de manera de minimizar la distancia de los votantes a los centros de votación y la máxima distancia recorrida por un votante durante el día de elecciones.

## Hipótesis y Supuestos

- La votación debe realizarse en un único día para asegurar la transparencia electoral, por lo que la disponibilidad por centro es máxima y no puede reutilizarse.
- No hay restricciones respecto al tiempo que tarda un votante en ir al centro de votación o en votar.
- No hay restricciones respecto a la distancia máxima que debe recorrer un votante en tanto cada circuito electoral tiene distinta área por la densidad demográfica de la región. 
- Se conoce la distancia de cada votante a todos los centros de votación.
- Los votantes tomarán el camino que consideren más corto para ir a votar.
- Los votantes conocerán el camino más corto a su respectivo centro de votación.
- Hay suficiente capacidad entre todos los centros dentro del circuito para recibir a todos los votantes de dicho circuito.
- Las capacidades de los centros de votación son constantes conocidas y varían circuito a circuito.
- El domicilio registrado de los votantes se mantiene por todo el proceso electoral.
- Cada persona se encuentra en su domicilio legal al momento de salir hacia su centro de votación asignado.
- La vuelta a casa del votante no es tenida en cuenta en el modelo planteado.
- No se tendrá en cuenta las condiciones físicas de los votantes.
- Hay libertad de asignar cualquier apellido a cualquier centro de votación. No es necesario mantener el _status quo_.
- Los votantes se mueven desde la puerta de su domicilio hasta la puerta del centro de votación sin ningún desvío. No se pueden tomar un colectivo que los deje a 2 cuadras.
- Cada votante se asigna a un único centro de votación (ocupa un único cupo).
- Los cupos de votantes no son reutilizables.
- Todo votante deberá ser asignado a un centro de votación. 
- Las elecciones son obligatorias.
- No se tomará en cuenta la asignación de votantes a sus respectivas mesas sino a su centro de votación.
- Los centros de votación requieren de una cantidad mínima de votantes asignados para ser abiertos.
- No hay restricciones respecto al presupuesto asignado a la votación.
- No hay restricciones respecto al costo de traslado de un votante al centro de votación.
- Todos los centros cuentan con una disponibilidad máxima. 
- Los presidentes de mesa o fiscales disponibles son infinitos en tanto se puede convocar a cualquier ciudadano por ley. El único limitante es la capacidad máxima del establecimiento. 
- Los votantes siempre tendrán un medio de transporte para ir a votar.
- Todos los votantes tienen la misma dificultad en recorrer la misma distancia. Por ejemplo: a un ciudadano A le es igual de difícil recorrer n metros que a ciudadano B, sin importar el valor de n.
- Se consideran votantes a las personas de 16 a 18 años empadronadas y a todos los mayores de 18.
- La métrica utilizada para calcular las distancias es la de Vincenty.
- Las unidad de medición para las distancias es de kilómetros. 

## Constantes y parámetros

`Dij` = distancia de cada votante `i` al centro `j` asociado $[km]$

`Cj` = capacidad máxima de votantes del centro `j` $[votante/centro]$

`i = {0..n}, j = {0.. m}, n = cantidad de votantes, m = cantidad de centros`

`CAP_MIN` = capacidad mínima de votantes para abrir un centro $[votante/centro]$

## Variables

`Yij` = \{1 si el votante `i` es asignado al centro `j`, 0 sino}

`YCj` = \{1 si el centro `j` se abre, 0 sino}

`i = {0..n}, j = {0.. m}, n = cantidad de votantes, m = cantidad de centros`

`MAX` = distancia máxima que recorre un votante $[km]$

## Restricciones

- Solo se asigna un votante a un centro 

$$\sum_{j=1}^{m} Y_\text{ij} = 1$$
$$ \forall i = 0..n$$

- No se excede la capacidad de un centro en la asignación

$$\sum_{i=1}^{n} Y_\text{ij} \leq YC_{j} * C_{j}$$
$$\forall j = 0..m$$

- Se cumple la cantidad mínima para abrir un centro 
$$\sum_{i=1}^{n} Y_\text{ij} \geq CAP\_MIN * YC_{j}$$
$$\forall j = 0..m$$

- Se obtiene la maxima distancia que recorre un votante asignado a un centro 
$$MAX \geq Y_\text{ij} * D_\text{ij}$$
$$ \forall i=0..n, j=0..m$$

## Funcional

$$MIN Z => \sum_{i=1}^{n} \sum_{j=1}^{m} \frac{D_\text{ij} * Y_\text{ij}}{n} + MAX$$

## Modelo de Programación Lineal

La resolución del problema se realizó con GLPK.

- **Modelo completo**:

```

/* Definición de conjuntos */

set DISTANCIAS dimen 2; /* id_votante, id_centro, distancia */

set VOTANTES; /* id_votante */

set CENTROS; /* centro */

set CAPACIDADES; /* capacidad */

/* Definición de parámetros */

param d{v in VOTANTES, c in CENTROS}; /* par votante-centro */

param k{v in CENTROS}; /* capacidad máxima de cada centro */

param CAP_MIN := 120; 

/* Lecturas de CSV */

table tab_centros IN "CSV" "centros.csv" :
  CENTROS <- [id_centro];

table tab_votantes IN "CSV" "votantes.csv" :
  VOTANTES <- [id_votante];

table tab_distancias IN "CSV" "constantes.csv" :
  DISTANCIAS <- [id_votante, id_centro], d ~ distancia;

table tap_capacidad IN "CSV" "capacidades.csv" :
   CAPACIDADES <- [id], k ~ cap;

/* Definición de variables */

var Y{i in VOTANTES, j in CENTROS} >= 0, binary;

var YC{j in CENTROS} >= 0, binary;

var MAX >= 0;

/* Funcional */
minimize z: sum{i in VOTANTES, j in CENTROS} d[i,j]*Y[i,j]/card(VOTANTES) + MAX;

/* Restricciones */

/* Solo se asigna un votante a un centro */
s.t. asignacion{i in VOTANTES}: sum{j in CENTROS} Y[i,j] = 1;

/* No se excede la capacidad de un centro en la asignación */
s.t. cantMax{j in CENTROS}: sum{i in VOTANTES} Y[i,j] <= YC[j] * k[j]; 

/* Se cumple la cantidad mínima para abrir un centro */
s.t. cantMin{j in CENTROS}: sum{i in VOTANTES} Y[i,j] >= CAP_MIN * YC[j]; 

/* Se obtiene la maxima distancia que recorre un votante asignado a un centro */
s.t. maxDistancia{i in VOTANTES, j in CENTROS}: MAX >= Y[i,j] * d[i,j]; 

end;

```
\newpage

- **Modelo reducido**:

```

/* Definición de conjuntos */

set DISTANCIAS dimen 2; /* id_votante, id_centro, distancia */

set VOTANTES; /* id_votante */

set CENTROS; /* id_centro */

set CAPACIDADES; /* capacidad */

/* Definición de parámetros */

param d{v in VOTANTES, c in CENTROS}; /* par votante-centro */

param k{v in CENTROS}; /* capacidad máxima de cada centro */

param CAP_MIN := 30; 

/* Lecturas de CSV */

table tab_centros IN "CSV" "centros_reducido.csv" :
  CENTROS <- [id_centro];

table tab_votantes IN "CSV" "votantes_reducido.csv" :
  VOTANTES <- [id_votante];

table tab_distancias IN "CSV" "constantes_reducido.csv" :
  DISTANCIAS <- [id_votante, id_centro], d ~ distancia;

table tap_capacidad IN "CSV" "capacidades_reducido.csv" :
   CAPACIDADES <- [id], k ~ cap;

/* Definición de variables */

var Y{i in VOTANTES, j in CENTROS} >= 0, binary;

var YC{j in CENTROS} >= 0, binary;

var MAX >= 0;

/* Funcional */
minimize z: sum{i in VOTANTES, j in CENTROS} d[i,j]*Y[i,j]/card(VOTANTES) + MAX;

/* Restricciones */

/* Solo se asigna un votante a un centro */
s.t. asignacion{i in VOTANTES}: sum{j in CENTROS} Y[i,j] = 1;

/* No se excede la capacidad de un centro en la asignación */
s.t. cantMax{j in CENTROS}: sum{i in VOTANTES} Y[i,j] <= YC[j] * k[j]; 

/* Se cumple la cantidad mínima para abrir un centro */
s.t. cantMin{j in CENTROS}: sum{i in VOTANTES} Y[i,j] >= CAP_MIN * YC[j]; 

/* Se obtiene la maxima distancia que recorre un votante asignado a un centro */
s.t. maxDistancia{i in VOTANTES, j in CENTROS}: MAX >= Y[i,j] * d[i,j]; 

end;

```

## Resultados

Como la salida obtenida cuando se corre el modelo con ambos set de datos es muy grande se expone una salida recortada de ambos y luego se analizan los resultados obtenidos. Igualmente se indexa a la entrega las dos salidas obtenidas.

```
Problem:    modelo_reducido
Rows:       35215
Columns:    34051 (34050 integer, 34050 binary)
Non-zeros:  204181
Status:     INTEGER OPTIMAL
Objective:  z = 2.514095006 (MINimum)
```

Agrego el grande en el próximo commit

## Análisis de los resultados

En un primer lugar, se eligió el funcional utilizado para que cumpla los dos factores requeridos: que sea óptimo y que sea equitativo. Para que sea óptimo se decidió minimizar la distancia recorrida por un votante y para que sea equitativo se decidió minimizar la distancia máxima recorrida por un votante. De esta manera se consideró que se podían cumplir ambos criterios con la minimización de la suma del promedio y del máximo mencionados.

Agregar gráficos y resultados obtenidos.

Cosas a agregar:

- distancia máxima recorrida por un votante
- distancia máxima de cada centro
- distancia promedio

