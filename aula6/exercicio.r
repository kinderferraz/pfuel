## Alkindar Rodrigues -- SP3029956
## Aula 6

## exercicio 1 A função Filtro atua aplicando um predicado (uma função
## que retorna verdadeiro ou falso) a cada elemento de vetor e
## selecionando aqueles que tem resultado Verdadeiro para uma cópia do
## vetor.  Assim, apenas os valores que satisfazem o predicado são retidos.

## exercio 2
impar <- function(n){
    n %% 2 == 1
}

## exercicio 3
impares <- Filter(impar, c(1:10))

## exercicio 4
## a
maior <- function(n, par){
    n > par
}

## b
multiplo <- function(n, par){
    n %% par == 0
}

## c
menor <- function(n, par){
    n < par
}

## d -- fiz este exercicio usando closure, pois achei mais elegante
## nao reparei que mais abaixo há um exercicio para usar closure.
predCombinados <- function(maiores, menores, multiplos){
    function (n){
        maior(n, maiores) && multiplo(n, multiplos) && menor(n, menores)
    }
}

multiplosFiltros <- function (arr, maiores, menores, multiplos) {
    pred <- predCombinados(maiores, menores, multiplos)
    Filter(pred, arr)
}

multiplosFiltros(c(1:100), 24, 76, 5)

## exercicio 5
filtroComplexo <- function(arr, maiores, menores, multiplos){
    Filter(function(n) {
        maior(n, maiores) && menor(n, menores) && multiplo(n, multiplos)
    }, c(1:100))
}
filtroComplexo(c(1:100), 24, 76, 5)

## exercicio 6 -> 4)d

## exercicio 7

## A função map aplica uma função a uma sequencia de elementos de um
## ou mais vetores e retorna outro vetor com o resultado das aplicações,
## em ordem. Quando mais de um vetor está presente, o primeiro
## argumento da função é proveniente do primeiro vetor, o segundo
## argumento do segundo vetor e assim sucessivamente. A documentação
## da linguagem R explica que os vetores são reciclados, isto é, se um
## for menor que os demais, ele volta para o início. Outras linguagens
## não implementam este comportamento.

## exercico 8
## como a função é um predicado, isto é, seu retorno é true ou false,
## estes valores sao guardados no vetor.
mapa <- Map(predCombinados(maiores=24, menores=26, multiplos=5),
            c(1:100))

## exercicio 8
duplica <- function(n){
    n * 2
}

## exercicio 9
duplicados <- unlist(Map(duplica, c(1:10)))

## exercicio 10
## A função reduce atua aplicando uma função a cada elemento de uma
## sequencia e acumulando o resultado em um valor. Para tanto, a
## função deve aceitar dois parametros:
## - um valor da sequencia
## - um acumulador
## este segundo parametro recebe o resultado da aplicação anterior da
## função. Segundo a implementação, ele pode receber tanto um valor
## inicial definido pelo programador quanto um segundo elemento da
## sequencia.

## exercicio 11
red <- function(f, seq){
    acc <- seq[1]
    for(idx in seq(2, length(seq))){
        aac <- f(seq[idx], acc)
    }
    acc
}

## exercicio 12
soma <- Reduce(sum, c(1:10))

## exercicio 13
library(sqldf)

cliente <- sample(c(1:10), 100, replace=TRUE)
compras <- sample(c(0:1000), 100, replace=TRUE)

df <- data.frame(cliente, compras)

dados <- sqldf("
select
  cliente,
  sum(compras) as total, -- reduce
  case
    when sum(compras) > 6000 then 0.2
    when sum(compras) > 4000 then 0.1
  end as desconto -- map
from
  df
where cliente > 5 -- filter
group by
  cliente
")

## exercicio 14
## A programação imperativa é baseada numa sequencia de
## instruções passadas ao computador. Nesta forma de progamação, nao há
## estruturas complexas (funções, objetos, laços) . O código
## fica, assim, reduzido às instruções que a máquina deve executar, e
## cada instrução altera o estado do programa, alterando os valores
## armazenados fisicamente.

## exercicio 15
## A programação procedural é aquela baseada na modularização do
## código em funções ou procedures. Existem também outras estruturas
## de controle do código, como condicionais e laços de
## repetição. Neste paradigma, existe o conceito de escopo de uma
## variável, que restringe quais partes do código tem acesso de
## leitura e escrita sobre uma variável, aumentando a segurança do
## código.

## exercicio 16
## A programação declarativa, ao contrário das anteriores, define
## apenas a lógica a ser usada para produzir o resultado, sem definir
## as estruturas de controle usadas para isso. Este paradigma, que
## inclui linguagens como SQL, html, e alguns frameworks em
## JavaScript, define a forma do resultado final e delega ao
## compilador ou interpretador que defina as sequencias de controle
## necessárias para chegar ao resultado.

## exercicio 17
## Uma função pura é aquela que independe do estado do programa para
## executar: ela nao o altera nem o lê, e seu resultado depende apenas
## do valor que lhe é passado como entrada.

## exercicio 18
## Uma função de alta ordem é aquela que pode receber outra função
## como parametro de entrada, e aplicá-la conforme achar necessário,
## ou mesmo modificá-la. Map, Reduce e Filter são funções de alta
## ordem clássicas.

## exercicio 19
## Closure é uma forma de definição de funções em tempo de execução, e
## é usada quando uma função depende de parametros ainda desconhecidos
## para ser definida. Para definir uma closure, uma função deve
## retornar outra, e com isso esta função tem acesso ao espaço de
## variáveis da função mãe.
