
# Table of Contents

1.  [estruturas](#orgce8d9ea)
2.  [função 1 &#x2013; main](#orgd6448ba)
3.  [função 2 &#x2013; leitura do arquivo de parametros](#org3f65f22)
4.  [função 3 &#x2013; para listar o sistema de arquivos, filtrando por extensões](#org3abfb57)
5.  [função 4 &#x2013; leitura de arquivo, retorna uma tabela de palavras](#orgc8bb283)
6.  [função 5 &#x2013; redução, soma as palavras de num arquivo](#orge403567)

Alkindar Rodrigues &#x2013; SP3029956
Especificações para contagem de palavras no sistema de arquivos


<a id="orgce8d9ea"></a>

# estruturas

para este problema é necessário uma matriz mais flexível, capaz de
receber tanto strings quanto inteiros, assim como ser expandida
comforme necessário. desta forma, seria mais apropriado uma ou duas
estrtuturas que lidem com ponteiros. estas estruturas podem ser
declaradas em C da seguinte forma:

    /* Primeiro uma lista ligada em duas direções, pode representar uma
       linha.  A verticalidade é necessária no momento de totalizar quanto
       cada palavra aparece */
    typedef struct NoQuantidade NoQtd;
    struct NoQuantidade {
      NoQtd * proximo;
      NoQtd * abaixo;
      int quantidade;
    };
    
    /* Para representar a primeira linha e coluna, podemos usar uma lista
       ligada simples */
    typedef struct NoIentificadores NoId;
    struct NoIdentificadores {
      NoId * proximo;
      char * id;
    };
    
    /* Como as primeiras linha e coluna indicam o resto da matriz, é tudo
       que se precisa nela */
    typedef struct Matriz Matriz;
    struct Matriz {
      NoId * cabeçalho;
      NoId * documentos;
    };


<a id="orgd6448ba"></a>

# função 1 &#x2013; main

1.  declarar uma matriz
2.  ler o arquivo de parâmetros, com a função 2
3.  para cada par caminho/extensão retornado, listar o sistema de
    arquivos com a função 3 &#x2013; irá chamar a função 4 e popular a matriz
4.  reduzir a matriz com a função 5
5.  imprimir uma representação do dicionário em um local apropriado


<a id="org3f65f22"></a>

# função 2 &#x2013; leitura do arquivo de parametros

1.  declarar um vetor de retorno
2.  abrir o arquivo de parametros
3.  para cada linha:
    1.  ler o caminho
    2.  ler as extensões e separá-las em um vetor
    3.  montar um vetor de pares (caminho / extensão), mapeando a partir
        do vetor de extensões
    4.  adicionar este vetor de pares ao vetor de retorno
4.  retornar o vetor declarado


<a id="org3abfb57"></a>

# função 3 &#x2013; para listar o sistema de arquivos, filtrando por extensões

recebe uma pasta, uma extensão, e um ponteiro para matriz de resultados

1.  abrir uma nova trhead
2.  listar os arquivos dentro da pasta
3.  filtrar a lista com base na extensão do arquivo
4.  para cada arquivo, mapear a quantidade de palavras com a função 4,
    armazenando o resultado na matriz
5.  fechar a thread


<a id="orgc8bb283"></a>

# função 4 &#x2013; leitura de arquivo, retorna uma tabela de palavras

recebe como parametro um caminho de arquivo e um ponteiro para
matriz de resultados

1.  adicionar uma linha à matriz, com o primeiro campo identificando o
    documento, os demais campos zerados
2.  enquanto o arquivo nao terminar:
    1.  ler uma linha e separar as palavras
    2.  mapear a lista de palavras:
        1.  se a palavra estiver no cabeçalho da matriz:
            1.  na linha correspondente ao arquivo atual, incremente o
                valor em 1
        2.  se nao:
            1.  inserir a palavra ao final do cabeçalho
            2.  zerar toda a nova coluna
            3.  incrementar o valor referente ao documento atual em 1


<a id="orge403567"></a>

# função 5 &#x2013; redução, soma as palavras de num arquivo

recebe uma martiz de palvras como parâmetro

1.  declarar um dicionario
2.  para cada coluna da matriz:
    1.  reduzir seu valor somando-o
    2.  inserir a palavra como chave e o valor no dicionario
3.  retornar o dicionário

