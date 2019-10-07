from vincenty import vincenty
import csv

RUTA_VOTANTES = "votantes_reducido.csv"
RUTA_CENTROS = "centros_reducido.csv"
RUTA_MERGE = "constantes_reducido.csv"
LATITUD = 1
LONGITUD = 2

def procesarDistancias():
    posiciones_centros = []
    cantidad_centros = 0
    header = ["id_votante"]
    with open(RUTA_MERGE, 'w') as merge:
        with open(RUTA_VOTANTES) as votantes:
            with open(RUTA_CENTROS) as centros:
                votantes_reader = csv.reader(votantes, delimiter=',')
                centros_reader = csv.reader(centros, delimiter=',')
                for centro in centros_reader:
                    posiciones_centros.append((float(centro[LATITUD]), float(centro[LONGITUD])))
                    cantidad_centros += 1
                    header.append(f"centro_{cantidad_centros}")
                
                merge_csv = csv.writer(merge)
                merge_csv.writerow(header)

                for votante in votantes_reader:
                    distancias = []
                    distancias.append(votante[0])
                    posicion_votante = (float(votante[LATITUD]), float(votante[LONGITUD]))
                    for posicion_centro in posiciones_centros:
                        distancia = vincenty(posicion_centro, posicion_votante)
                        distancias.append(distancia)
                    merge_csv.writerow(distancias)
                    
        
procesarDistancias()