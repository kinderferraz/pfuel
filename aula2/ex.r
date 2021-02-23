## carregar a biblioteca purrrlyr, pois esta fornece uma função map que
## retorna um data frame
library("purrrlyr")

## Exercicio 1
df <- data.frame(replicate(7, sample(c(1:100, -9, -99, -999, -9999), 7, rep= TRUE)))
colnames(df) <- letters[1:7]

## Exercicio 2
df <- dmap_at(.d = df, .f = function(x, cols){
  x[x < 0] <- NA
  return(x)
}, .at = letters[3:4])
df

## Exerccio 3
## Esta função filtra contra valores nulos.  A ideia é
## parte da linguagem Clojure, que é baseada em Java.
## Esta closure impede NullPointerExceptions do Java
## ao fornecer um argumento padrão em algumas funções.
fnil <- function (f, s){
  function(a){
    if (is.null(a) || is.na(a))
      f(s)
    else
      f(a)
  }
}

inc <- function(n){n+1}
finc <- fnil(inc, 10)
finc(NULL)      # 11
