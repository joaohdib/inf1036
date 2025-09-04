#tentar implementar a função sample
# sample(c("n","c1","c2","c3","c4"), 1, prob = c(0.8,0.04,0.04,0.06,0.06)) FALTA ACABAR

vetor <- c("cara","coroa", "sla")
qtd <- 1
prob <- c(0.3,0.3,0.4)
nsamples <- 100




sample2 <- function(qtd, prob, vetor) {
    result <- character(0)
    somaAnterior <- 0 
    for (i in 1:qtd) {
      n <- runif(1)
      for (i in 1:length(vetor)) {
        soma <- somaAnterior + prob[i]
        if (n >= somaAnterior && n <= soma) {
          result <- c(result,vetor[i])
          break
        } 
      somaAnterior <- soma
      }
  }
    
    if (qtd == 1) {
      return (result[1])
    } else {
      return (result)
    }
}

for (j in 1:nsamples) {
  print(sample2(qtd,prob,vetor))
}
