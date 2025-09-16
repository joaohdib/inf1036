anterior <- 3
result <- numeric(30)  

for (i in 1:30) {
  n <- (39373 * anterior + 0) %% ((2^31) - 1)
  anterior <- n
  n <- n / ((2^31)-1)
  result[i] <- n
}

forcas <- numeric(10)
agilidades <- numeric(10)
inteligencia <- numeric(10)


for (i in 1:10) {
  valor <- (result[i]*10)+10 
  print(valor)
}
for (i in 10:20) {
  valor <- (result[i]*5)+10 
  print(valor)
}
for (i in 20:30) {
  valor <- (result[i]*8)+10 
  print(valor)
}

