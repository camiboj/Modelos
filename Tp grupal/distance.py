from vincenty import vincenty
import csv

RUTA_VOTANTES = "votantes_reducido.csv"
RUTA_CENTROS = "centros_reducido.csv"
RUTA_MERGE = "constantes_reducido.csv"
LATITUD = 1
LONGITUD = 2

def procesarDistancias():
    header = ["id_votante", "id_centro", "distancia"]
    with open(RUTA_MERGE, 'w') as merge:
        with open(RUTA_VOTANTES) as votantes:
            with open(RUTA_CENTROS) as centros:
                votantes_reader = csv.reader(votantes, delimiter=',')
                centros_reader = csv.reader(centros, delimiter=',')
                merge_csv = csv.writer(merge)
                merge_csv.writerow(header)
                header_votante = True
                header_centro = True
                for votante in votantes_reader:
                    if header_votante:
                        header_votante = False
                        continue
                    centros.seek(0)
                    for centro in centros_reader:
                        if header_centro:
                            header_centro = False
                            continue
                        distancias = []
                        distancias.append(votante[0]) #id_votante
                        distancias.append(centro[0]) #id_centro
                        posicion_votante = (float(votante[LATITUD]), float(votante[LONGITUD]))
                        posicion_centro = (float(centro[LATITUD]), float(centro[LONGITUD]))
                        distancia = vincenty(posicion_centro, posicion_votante)
                        distancias.append(distancia) #distancia
                        merge_csv.writerow(distancias)
                    header_centro = True
                    
procesarDistancias()