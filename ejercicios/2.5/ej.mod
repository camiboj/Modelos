/* Declaracion de variables */
var x_r_sn >= 0;
var x_l_sn >= 0;
var x_r_sc >= 0;
var x_l_sc >= 0;

/* Definicion del funcional */
maximize z: 50 * (1 * x_r_sn + 2 * x_l_sn) + 80 * (7 * x_r_sc + 9 * x_l_sc);

/* Restricciones */


/* Demanda mınima */
s.t. demMinSn: 1 * x_r_sn + 2 * x_l_sn >= 10000;
s.t. demMaxSc: 7 * x_r_sc + 9 * x_l_sc >= 9000;
/* Hs disponibles de maquinas */
s.t. dispMaqRap: 1 * x_r_sn + 7 * x_r_sc <= 70 * 8;
s.t. dispMaqLen: 2 * x_l_sn + 9 * x_l_sc <= 60 * 8;
end



