# Resolucion 1 - Contenido del archivo 1.mod.
/* Declaraci´on de variables */
var A >= 0;
var B >= 0;
var Al >= 0;
var C >= 0;

/* Definicion del funcional */
maximize z: 1200 * A + 400 * B;

/* Restricciones */

/* Procesamiento de cada equipo */
s.t. procEq1: Al = 3 * A + 2/3 * B;
s.t. procEq2: C = A + 2 * B;

/* Demandas maximas y mınimas */
s.t. demMinAl: Al >= 40;
s.t. demMaxB: C <= 20;
end
