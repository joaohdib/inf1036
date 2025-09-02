criarCupom <- function() { 
  cupom <- character(0) 
  for (i in 1:6) {
    letra <- sample(c("A", "B", "C", "D", "E", "F"), 1, prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))
    cupom <- c(cupom, letra)
  }
  return(cupom)
}

nsamples <- 10000
qtdSemLetrasEmComum <- 0
qtdTresLetras <- 0 
qtdComecoVogais <- 0
vogais <- c("A","E")

for (i in 1:nsamples) {
  cupom1 <- criarCupom()
  cupom2 <- criarCupom()
  letrasIguais <- 0
  letrasIguaisPosicoesDifer <- 0
  
  while (identical(cupom2, cupom1)) {
    cupom2 <- criarCupom()
  }
  
  index <- 1
  achou <- 0
  
  for (c in cupom1) {
    if (c %in% cupom2) {
      if (match(c, cupom2) != index) {
        letrasIguaisPosicoesDifer <- letrasIguaisPosicoesDifer + 1
      }
      letrasIguais <- letrasIguais + 1 
    }
    index <- index + 1
  }
  
  if (letrasIguaisPosicoesDifer == 3) {
    qtdTresLetras <- qtdTresLetras + 1
  }
  
  if (letrasIguais == 0) {
    qtdSemLetrasEmComum <- qtdSemLetrasEmComum + 1
  }
  
  if ((cupom1[1] %in% vogais) & (cupom2[1] %in% vogais)) {
    qtdComecoVogais <- qtdComecoVogais + 1
  }
  
}

print((qtdSemLetrasEmComum / nsamples) * 100)
print((qtdTresLetras / nsamples) * 100)
print((qtdComecoVogais / nsamples) * 100)
