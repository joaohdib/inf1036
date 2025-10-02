import random

amostras = 10000
maisDeTres = 0
vencedores = []
qtdVenceu = [0, 0]
quasePerdendo = None
quasePerdeuMasGanhou = 0

for i in range(amostras):
    vencedor = random.choices(['time1', 'time2'], weights=[0.4, 0.6])[0]
    vencedores.append(vencedor)
    if (vencedores.count(vencedor) == 3):
        if len(vencedores) > 3:
            maisDeTres += 1
        vencedores = []
        if vencedor == 'time1':
            qtdVenceu[0] += 1
        else:
            qtdVenceu[1] += 1
        if quasePerdendo == vencedor:
            quasePerdeuMasGanhou += 1
            quasePerdendo = None
            
    elif (len(vencedores) == 2 and (vencedores[0] == vencedores[1])):
        if vencedores[0] == 'time1':
            quasePerdendo = 'time2'
        else:
            quasePerdendo = 'time1'


print((qtdVenceu[0]/amostras)*100)
print((qtdVenceu[1]/amostras)*100)
print((maisDeTres/amostras)*100)
print((quasePerdeuMasGanhou/amostras)*100)
    