#tentar implementar a função sample
# sample(c("n","c1","c2","c3","c4"), 1, prob = c(0.8,0.04,0.04,0.06,0.06)) FALTA ACABAR

vetor <- c("cara","coroa")
qtd <- 1
prob <- c(0.5,0.5)
nsamples <- 0

for (i in 1:qtd) {
  n <- runif(1)
  print(n)
  for (i in 1:vetor) {
    if (n <= prob[1]) {
      result <- vetor[1]
    }
    else if (n > prob[2]) {
      result <- vetor[2]
    }
  }
  print(result)
}



