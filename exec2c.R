set.seed(123)  # Semente para reprodutibilidade


custo <- 0
qtdS <- 0
qtdFalhas <- 0 

for (i in 1:1000) {
  vida <- 1.0
  defeito <- "n"
  
  for (j in 1:720) {
    
    if (vida <= 0) {
      qtdS <- qtdS + 1
      
      if (defeito == "l") {
        custo <- custo + 400
      }
      else if (defeito == "m") {
        custo <- custo + 500
      }
      else if (defeito == "s") {
        custo <- custo + 700
      }
      
      vida <- 1.0
      
    }
    
    falha <- sample(c("sim", "nao"), size = 1, replace = TRUE, prob = c(0.01, 0.99))
    if (falha == "sim") {
      qtdFalhas <- qtdFalhas + 1
      custo <- custo + 2000
      vida <- 1
      next
      
    }
    defeito <- sample(c("l","m","s"), size = 1, replace = TRUE, prob = c(0.7,0.2,0.1))
    
    if (defeito == "l") {
      vida <- vida - 0.01
    } 
    else if (defeito == "m") {
      vida <- vida - 0.03
    }
    else if (defeito == "s") {
      vida <- vida - 0.07
    }
    
  }
}


print(qtdFalhas / 1000)
print (custo / 1000)
print (qtdS / 1000)
