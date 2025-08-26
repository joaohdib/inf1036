# Suponha que a fábrica de um certo equipamento fez uma pesquisa e classificou as 4 principais causas de defeito no
# equipamento, quando o mesmo possui entre 2 e três anos de uso como C1, C2, C3 e C4. Considere ainda que:
# • sem a manutenção preventiva no período recomendado pela fábrica, o equipamento pode apresentar os defeitos C1,
# C2, C3 e C4, com as probabilidades, respectivamente, de 4%, 4%, 6% e 6%;
# • realizar a manutenção preventiva no período indicado pela fábrica diminui o risco dos defeitos C3 e C4 em 50%, mas
# não afeta o risco de C1 e C2;
# • as eventuais ocorrências de defeito (com ou sem manutenção) são independentes;
# • 40% dos equipamentos realizam a manutenção preventiva no prazo certo.
# Um equipamento é selecionado aleatoriamente. Calcule, usando simulação, a probabilidade de que:
# A. o equipamento:
# i. apresente defeito;
# ii. apresente algum defeito se não for feita manutenção preventiva;
# iii. apresente algum defeito se for feita a manutenção preventiva.
# B. tenha sido feita manutenção preventiva dado que o equipamento apresentou o defeito:
# i. C 1;
# ii. C 3


nsamples <- 10000
c1 <- 0
c2 <- 0
c3 <- 0
c4 <- 0
c1m <- 0
c2m <- 0
c3m <- 0
c4m <- 0
qtdManutencao <- 0
qtdSemManutencao <- 0
qtdDefeitoSemManutencao <- 0
qtdDefeitoComManutencao <- 0
qtdDefeitoSemManutencaoc1 <- 0
qtdDefeitoComManutencaoc1 <- 0
qtdDefeitoSemManutencaoc3 <- 0
qtdDefeitoComManutencaoc3 <- 0

for (i in 1:nsamples) {
  
  manutencao <- sample(c("s","n"), 1, prob = c(0.4,0.6))
  
  if (manutencao == "s") {
    qtdManutencao <- qtdManutencao + 1
    defeitoc1 <- sample(c("n","s"), 1, prob = c(0.96,0.04))
    defeitoc2 <- sample(c("n","s"), 1, prob = c(0.96,0.04))
    defeitoc3 <- sample(c("n","s"), 1, prob = c(0.97,0.03))
    defeitoc4 <- sample(c("n","s"), 1, prob = c(0.97,0.03))
    if (defeitoc1 == "s" | defeitoc2 == "s" | defeitoc3 == "s" | defeitoc4 == "s") {
      qtdDefeitoComManutencao<-qtdDefeitoComManutencao+1
      if (defeitoc3 == "s") {
        qtdDefeitoComManutencaoc3 <- qtdDefeitoComManutencaoc3 + 1
      }
      if (defeitoc1 == "s") {
        qtdDefeitoComManutencaoc1 <- qtdDefeitoComManutencaoc1 + 1
      }
    }
  }
  
  else {
    qtdSemManutencao <- qtdSemManutencao + 1
    defeitoc1 <- sample(c("n","s"), 1, prob = c(0.96,0.04))
    defeitoc2 <- sample(c("n","s"), 1, prob = c(0.96,0.04))
    defeitoc3 <- sample(c("n","s"), 1, prob = c(0.94,0.06))
    defeitoc4 <- sample(c("n","s"), 1, prob = c(0.94,0.06))
    if (defeitoc1 == "s" | defeitoc2 == "s" | defeitoc3 == "s" | defeitoc4 == "s") {
      qtdDefeitoSemManutencao<-qtdDefeitoSemManutencao+1
      if (defeitoc3 == "s") {
        qtdDefeitoSemManutencaoc3 <- qtdDefeitoSemManutencaoc3 + 1
      }
      if (defeitoc1 == "s") {
        qtdDefeitoSemManutencaoc1 <- qtdDefeitoSemManutencaoc1 + 1
      }
    }
  }
  
}


#A
probDefeito <- ((qtdDefeitoComManutencao + qtdDefeitoSemManutencao) / nsamples) * 100
probDefeitoManutencao <- (qtdDefeitoComManutencao / qtdManutencao) * 100
probDefeitoSemManutencao <- (qtdDefeitoSemManutencao / qtdSemManutencao) * 100

print(probDefeito)
print(probDefeitoManutencao)
print(probDefeitoSemManutencao)

#B
probC1 <- (qtdDefeitoComManutencaoc1 / qtdManutencao) * 100
probC3 <- (qtdDefeitoComManutencaoc3 / qtdManutencao) * 100

print(probC1)
print(probC3)

