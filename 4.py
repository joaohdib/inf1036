#Suponha que 𝟑 jogadores, Maria, Gustavo e Jorge, com dólares para gastar,
#decidiram criar um torneio de baralho que consiste na realização de uma
#sequência de rodadas de partidas onde cada um participa, a cada rodada, com
#a mesma quantia, no caso 1 dólar, sendo que o vencedor da rodada fica com os
#dólares apostados por todos na rodada. O valor que cada jogador possui para
#gastar é um número inteiro e em cada rodada cada um tem uma probabilidade
#constante de vencer e se um dos jogadores perder todo o seu dinheiro o
#torneio termina. Supondo que os jogadores Maria, Gustavo e Jorge iniciarão o
#torneio com 150, 70 e 240 dólares respectivamente e que apresentam
#probabilidade de vitória em cada rodada dada por 0,3, 0,4 e 0,3
#respectivamente, simule um torneio de até 1000 rodadas e calcule a quantia
#final com que cada um ficou.

import numpy as np


nsamples = 1000
contB = 0
maria = 150
gustavo = 70
jorge = 240

for i in range(0,nsamples):
  
  vencedor = np.random.choice(['maria','gustavo','jorge'], p=[0.3,0.4,0.3])
  
  
  if (vencedor == "maria"):
    maria += 2
    gustavo -= 1
    jorge -= 1
    
  if vencedor == "gustavo":
    gustavo += 2
    maria -= 1
    jorge -= 1
  
  if (vencedor == "jorge"):
    jorge += 2
    maria -= 1
    gustavo -= 1
  
  if (maria == 0 or gustavo == 0 or jorge == 0):
    break



print(maria)
print(gustavo)
print(jorge)
