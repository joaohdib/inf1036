set.seed(123)
somaPFAj <- 0
somaTempo <- 0
somaCusto <- 0
qtdMenorQ15 <- 0 
qtdMenorQ450S <- 0 

vetorPfAj <- c()
vetorTempo <- c()
vetorCusto <- c()

for (i in 1:10000) {
  
  ee <- sample(c(3,4,6),25,TRUE,prob=c(0.3,0.5,0.2))
  se <- sample(c(4,5,7),20,TRUE,prob=c(0.25,0.6,0.15))
  ce <- sample(c(3,4,6),15,TRUE,prob=c(0.4,0.4,0.2))
  ali <- sample(c(7,10,15),12,TRUE,prob=c(0.2,0.5,0.3))
  aie <- sample(c(5,7,10),8,TRUE,prob=c(0.35,0.45,0.2))
  
  ajuste = sample(c(1.05,1.15,1.25),1,TRUE,prob=c(0.2,0.6,0.2))
  
  pf <- sum(ee) + sum(se) + sum(ce) + sum(ali) + sum(aie)
  pfAj <- pf * ajuste
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
  
  if (custoFinal < 280000) {
    
    qtdMenorQ15 <- qtdMenorQ15 + 1
    
  }
  
  if (tempo < 60) {
    
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

