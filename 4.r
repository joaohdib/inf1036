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


nsamples <- 1000
contB <- 0
maria <- 150
gustavo <- 70
jorge <- 240

for (i in 1:nsamples) {
  
  vencedor <- sample(c("maria","gustavo","jorge"), 1, prob = c(0.3,0.4,0.3))
  
  if (vencedor == "maria") {
    maria <- maria + 2
    gustavo <- gustavo - 1
    jorge <- jorge - 1
  }
  if (vencedor == "gustavo") {
    gustavo <- gustavo + 2
    maria <- maria - 1
    jorge <- jorge - 1
  }
  if (vencedor == "jorge") {
    jorge <- jorge + 2
    maria <- maria - 1
    gustavo <- gustavo - 1
  }
  
  
  if (maria == 0 | gustavo == 0 | jorge == 0) {
    break;
  }
  
}

print(maria)
print(gustavo)
print(jorge)

