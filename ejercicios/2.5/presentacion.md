# 2.5
---

### Hipotesis:
1. Los estampados del mismo tipo pero de diferenctes maquinas son indistinguibles
2. No hay inflación
3. Las fracciones de productos se venden a un precio porporcional al de la unidad
4. Se vende todo lo que se produce


### Objetivo
Detenrmina la cantidad de horas de cada tipo de máquina que se usarán para hacer ambos estampados para máximizar las ganancias en un periodo de un día 

### Constantes:
$$M_{SC} (\$/día)$$: precio ($$\$$$) de la tela de Scooby por metro ($$m$$)
$$L_{SC} (m/hs)$$: metros ($$m$$) de tela de Scooby producidos por hora ($$hs$$) en la maquina lenta
$$R_{SC} (m/hs)$$: metros ($$m$$) de tela de Scooby producidos por hora ($$hs$$) en la maquina rápida
$$K_{SN} (\$/día)$$: precio ($$\$$$) de la tela de Snoopy por metro ($$m$$)
$$L_{SN} (m/hs)$$: metros ($$m$$) de tela de Snoopy producidos por hora ($$hs$$) en la maquina lenta
$$R_{SN} (m/hs)$$: metros ($$m$$) de tela de Snoopy producidos por hora ($$hs$$) en la maquina rápida

$$R_{SC}  = 7 m/hs$$
$$L_{SN} = 2 m/hs$$

### Variables:
$$x_{i,j} (hs)$$: horas ($$hs$$) de maquina $$i$$ usadas en estampado $$k$$ donde $$i \epsilon \{r, l\}$$ y $$i \epsilon \{sn, sc\}$$
$$r$$ = rapida
$$l$$ = lenta 
$$sn$$ = snoopy
$$sc$$ = scooby



### Objetivo funcional:
$$Z_{MAX} = K_{SN}(\$) * (R_{SN} (m/hs) * x_{r, sn} (hs) + L_{SN} (m/hs) * x_{l, sn} (hs)) + M_{SC}(\$) * (R_{SC} (m/hs) * x_{r, sc} (hs)+ L_{SC} (m/hs) * x_{l, sc} (hs))$$ 


### Restricciones:
**Demanda mínima:**
$$R_{SN} (m/hs) * x_{r, sn} (hs) + L_{SN} (m/hs) * x_{l, sn} (hs) \geq 10.000$$
$$R_{SC} (m/hs) * x_{r, sc} (hs)+ L_{SC} (m/hs) * x_{l, sc} (hs) \geq 9.000$$

**Horas disponibles máximas de cada maquina:**
$$x_{r, sn} (hs) + x_{r, sc} (hs) \leq 70 (maq) * 8 (hs/maq)$$
$$x_{l, sn} (hs) + x_{l, sc} (hs) \leq 60 (maq) * 8 (hs/maq)$$
