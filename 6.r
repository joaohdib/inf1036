#tentar implementar a função sample
# sample(c("n","c1","c2","c3","c4"), 1, prob = c(0.8,0.04,0.04,0.06,0.06)) FALTA ACABAR

vetor <- c("cara","coroa", "sla")
qtd <- 1
prob <- c(0.3,0.3,0.4)
nsamples <- 100000

for (j in 1:nsamples) {
    for (i in 1:qtd) {
    n <- runif(1)
    print(n)
    for (i in 1:length(vetor)) {
      if (n >= sum(prob[1:i-1])) {
        result <- vetor[i]
      }
    }
    print(result)
    }
  }
