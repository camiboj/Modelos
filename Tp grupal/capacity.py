import csv

RUTA_CENTROS = "centros_reducido.csv"
RUTA_CAPACIDAD = "capacidades_reducido.csv"
LATITUD = 1
LONGITUD = 2

def procesarCapacidades():
    header = ["id", "cap"]
    with open(RUTA_CAPACIDAD, 'w') as capacidades:
        with open(RUTA_CENTROS) as centros:
            centros_reader = csv.reader(centros, delimiter=',')
            cap_csv = csv.writer(capacidades)
            cap_csv.writerow(header)
            header_centro = True
            for centro in centros_reader:
                if header_centro:
                    header_centro = False
                    continue
                cap_csv.writerow([centro[0], centro[-1]])
                    
procesarCapacidades()