
somaPFAj <- 0
somaTempo <- 0
somaCusto <- 0
qtdMenorQ15 <- 0 
qtdMenorQ450S <- 0 

vetorPfAj <- c()
vetorTempo <- c()
vetorCusto <- c()

for (i in 1:10000) {
  
  dados <- sample(c(2,3,4), 1, TRUE, prob=c(0.2,0.6,0.2))
  desempenho <- sample(c(3,4,5), 1, TRUE, prob=c(0.1,0.7,0.2))
  reusa <- sample(c(1,2,3), 1, TRUE, prob=c(0.1,0.7,0.2))
  process <- sample(c(2,3,4,5), 1, TRUE, prob=c(0.1,0.6,0.2,0.1))
  caracteristicas <- sample(c(1,2,3), 10, TRUE, prob=c(0.2,0.6,0.2))
  
  
  FA <- 0.65 + 0.01 * (dados+desempenho+reusa+process+sum(caracteristicas))
  pfAj <- 3500 * FA
  somaPFAj <- somaPFAj + pfAj
  vetorPfAj <- c(vetorPfAj, pfAj)
  
  produtiv <- sample(c(4,5,6),1,TRUE,prob=c(0.2,0.7,0.1))
  custo <- sample(c(80,100,120),1,TRUE,prob=c(0.2,0.6,0.2))
  
  produtivFinal <- produtiv * pfAj
  tempo <- produtivFinal/40
  somaTempo <- somaTempo + tempo
  vetorTempo <- c(vetorTempo, tempo)
  
  custoFinal <- custo * produtivFinal
  somaCusto <- somaCusto + custoFinal
  vetorCusto <- c(vetorCusto, custoFinal)
  
  if (custoFinal < 1500000) {
    
    qtdMenorQ15 <- qtdMenorQ15 + 1
    
  }
  
  if (tempo < 450) {
    
    qtdMenorQ450S <- qtdMenorQ450S + 1
    
  }
  

  
}


print(somaPFAj/10000)
print(somaTempo/10000)
print(somaCusto/10000)
print((qtdMenorQ15/10000)*100)
print((qtdMenorQ450S/10000)*100)


hist(vetorPfAj, 
     main = "Distribuição dos pontos de função ajustados", 
     xlab = "Pontos de função ajustados",
     col = "red")

hist(vetorTempo, 
     main = "Distribuição dos tempos em semanas", 
     xlab = "Tempo me semanas",
     col = "green")

hist(vetorCusto, 
     main = "Distribuição dos custos", 
     xlab = "Custo",
     col = "blue")

