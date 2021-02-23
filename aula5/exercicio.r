## Alkindar Rodrigues -- SP3029956
## Exercicio Aula 5

## exercicio 1
df <- data.frame(replicate(7, sample(c(1:30), 6, rep = TRUE)))
names(df) <- letters[1:7]

## exercicio 2
## Construa uma funcao que calcule a media aritmetica
## de uma coluna do data frame.
mediaColuna <- function(col){
    sum(col) / length(col)
}
media <- lapply(df, mediaColuna)
print(media)

## exercicio 3
## Faca o mesmo calculo usando a funcao mean
mediaColuna <- function(col){
    mean(col)
}
media <- lapply(df, mediaColuna)
print(media)

## exercicio 4
## Calcule o desvio padrao
desvioPadrao <- c()
i <- 1
for (col in colnames(df)){
    desvioPadrao[i] <- sd(df[,col])
    i <- i + 1
}
print(desvioPadrao)

## exercicio 5
## lapply + sd
desvioPadrao <- lapply(df, sd)
print(desvioPadrao)

## exercicio 6
## desvio padrao seletivo
colunasAlterar <- c(2:3)
desvioPadrao <- lapply(df[,colunasAlterar], sd)
print(desvioPadrao)

## exercicio 7
## desvio padrao proprio
meuSD <- function(x){
    sqrt(sum((x - mean(x)) ** 2) / (length(x) - 1))
}
desvioPadrao <- lapply(df[,2:3], meuSD)
print(desvioPadrao)

## exercicio 8
## sbstituir abaixo da media
substituiMenores <- function (arr) {
    media <- mean(arr)
    arr[arr < media] <- media
    arr
}

df[] <- lapply(df, substituiMenores)
