import numpy as np
import matplotlib.pyplot as plt
from random import randint
import pandas as pd

# Calcular la funcion logistica para N interaciones, y a partir de un Xo inicial

N = 2000
Xo = 0.5
r = 0.3

def logistic_iteration(N, xinicial, r):
    logistic=0
    for i in range(N):
        logistic = r*xinicial*(1-xinicial)
        xinicial = logistic
    return logistic
    
valor_f = []
eje_r = []
valor_r = list(np.linspace(0, 4, 100000))

for elems in valor_r:
    print(elems)
    log = 0
    log = logistic_iteration(randint(100, N), Xo, elems)
    valor_f.append(log)
    eje_r.append(elems)

plt.scatter(eje_r, valor_f)
plt.show()

# Creamos un dataframe

datos = {'r':eje_r, 'xn':valor_f}

data = pd.DataFrame(datos, dtype = float)

data.to_csv('dataLogisticMap.csv', index = False)