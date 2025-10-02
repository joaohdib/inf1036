import random

P = [[0.6, 0.3, 0.1], [0.2, 0.5, 0.3], [0.1, 0.3, 0.6]]
estados = [1, 2, 3]
samples = 1000
estado = 2

contador= [0, 0, 0]

for i in range(1000):
    estado = (random.choices(estados, weights=P[estado-1]))[0]
    contador[estado-1] += 1

for i in range(len(estados)):
    print(f'Estado {i+1}: {(contador[i]/1000)*100:.2f}%')
    
