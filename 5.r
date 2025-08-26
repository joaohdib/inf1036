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


nsamples <- 1000
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
    defeito <- sample(c("n","c1","c2","c3","c4"), 1, prob = c(0.8,0.04,0.04,0.06,0.06))
    if (defeito != "n") {
      qtdDefeitoComManutencao<-qtdDefeitoComManutencao+1
      if (defeito == "c3") {
        qtdDefeitoComManutencaoc3 <- qtdDefeitoComManutencaoc3 + 1
      }
      else if (defeito == "c1") {
        qtdDefeitoComManutencaoc1 <- qtdDefeitoComManutencaoc1 + 1
      }
    }
  }
  
  else {
    qtdSemManutencao <- qtdSemManutencao + 1
    defeito <- sample(c("n","c1","c2","c3","c4"), 1, prob = c(0.86,0.04,0.04,0.03,0.03))
    if (defeito != "n") {
      qtdDefeitoSemManutencao<-qtdDefeitoSemManutencao+1
      if (defeito == "c3") {
        qtdDefeitoSemManutencaoc3 <- qtdDefeitoSemManutencaoc3 + 1
      }
      else if (defeito == "c1") {
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

