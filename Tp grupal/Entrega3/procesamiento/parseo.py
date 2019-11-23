VALUE = 3
NAME = 1
I = 2
J = 4
INDEX_START = 2
INDEX_END = -1

def parsear():
    with open("bivalente_encendidas_reducido.csv", "w") as writer:
        with open("bivalente_reducido.txt") as file:
            for line in file:
                parameters = line.split()
                if parameters[VALUE] == "1":
                    variable_name = parameters[NAME]
                    writer.write(f"{variable_name[INDEX_START:INDEX_END]}\n")

parsear()