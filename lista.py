import random

random.seed(123)

qtd = 0
amostras = 10000
for i in range(amostras):
    x = random.random()
    y = random.random()
    
    if (((x-0)**2+(y-0)**2) <= 1) and (((x-1)**2+(y-1)**2) <= 1):
        qtd += 1


print(qtd/amostras*200*12)