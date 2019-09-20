/* Declaracion de variables */
var A >= 0;
var C >= 0;
var M >= 0;
var W >= 0;
var B1 >= 0;
var B2 >= 0;
var B3 >= 0;
var PW >= 0;
var PWC >= 0;
var PWF >= 0;
var AB1 >= 0;
var AB2 >= 0;
var AB3 >= 0;
var PWB1 >= 0;
var PWB2 >= 0;
var PWB3 >= 0;
var AS3 >= 0;
var WS3 >= 0;
var CS1 >= 0;
var CS3 >= 0;
var CB2 >= 0;
var PWCV >= 0;
var PWCC >= 0;


var HHN >= 0;
var HHEX >= 0;
var HHEXEM >= 0;
var HHEXAB >= 0;
var HHNAB >= 0;
var HHNFG >= 0;
var HM >= 0;

var P >= 0;

/* Definicion del funcional */
maximize z: 10*B1 + 20*B2 + 30*B3 + 3.6*PWCV - P*0.5 - (A*(1.5+0.8) + W*3 + C*(0.8+0.6) + M*(0.9+0.5)) - 3.5*PWC - HHEX*10;


/* Relaciones de variables */
s.t. antonTotal: A = AB1 + AB2 + AB3 + AS3;
s.t. cervanteTotal: C = CB2 + CS1 + CS3;
s.t. willTotal: W = WS3 + PW * 1/2;
s.t. paqWillTotalProvenientes: PW = PWC - PWCC * 1/(1-0.1)+ PWF;
s.t. paqWillTotalDestino: PW = PWB1 + PWB2 + PWB3 + PWCV;
s.t. paqWillFallados: PWC * 0.1 = PWCV + PWCC;

s.t. willFallCanjeados: PWC * 0.1 * 0.6 >= + PWCC;


s.t. hsExtraTotal: HHEX = HHEXAB + HHEXEM;
s.t. hsNormalesTotal: HHN = HHNAB + HHNFG;


/* Armado Bolsa 1 */
s.t. antonB1: B1 = AB1;
s.t. paqWillB1: B1 * 2 = PWB1;
s.t. surtidoB1: B1 = M + CS1;


/* Armado Bolsa 2 */
s.t. antonB2: 2 * B2 = AB2;
s.t. paqWillB2: B2 = PWB2;
s.t. cervanteB2: B2 = CB2;

/* Armado Bolsa 3 */
s.t. antonB3: B3 = AB3;
s.t. paqWillB3: B3 * 2 = PWB3;
s.t. surtidoB3: B3 * 2 = AS3 + WS3 + CS3;


/* Produccion */
s.t. dispMaxHsHom: HHN <= 320;
s.t. dispMinHHArmadoBolsas: HHNAB >= 20 * 8 * 5;
s.t. dispMaxHsHomExtra: HHEX <= 2*8*5;

s.t. demandaHorasMaq: HM = A*0.8 + 0.7*W + 0.5*C + 0.4*M;
s.t. relHHyHM: HM = 3*HHNFG;
s.t. demandaHHArmarBolsa: HHNAB = B1*0.5 + B2*0.10+B3*0.15;
s.t. demandaHHExtraEmp: HHEXEM = 0.02 * PWF;

/* Bolsa mas vendida */
s.t. bolsa1MasVendida: P >= B1;
s.t. bolsa2MasVendida: P >= AB2;
s.t. bolsa3MasVendida: P >= B3;

/* Demanda min */
s.t. dmb1: B1 >= 300;
s.t. dmb2: B2 >= 100;
s.t. dmb3: B3 >= 200;


end



