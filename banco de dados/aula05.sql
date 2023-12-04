##Imprimir a média da quantidade de alunos que tem na sala de aula
## AVG -->  calculou o valor médio da tabela "sala_de_aula"
## SUM --> Somou a quantidade de alunos tanto da sala da Maju, quanto Henrique e Dalton na tabela "sala_de_aula"
SELECT AVG(qt_alunos), SUM(qt_alunos) FROM sala_de_aula;

## Imprimir o valor médio dos produtos 
## MÉDIA
SELECT AVG(vl_produto) FROM produto;

## Imprimir o valor total da compra de todos os produtos 
## SOMA
SELECT SUM(vl_produto) FROM produto;

## Imprimir o produto com maior valor (mais caro)
SELECT MAX(vl_produto) FROM produto;

## Imprimir o produto com menor valor (mais barato)
SELECT MIN(vl_produto) FROM produto;

##Imprimir qual cliente é o mais novo e qual o mais velho 
# MAX(dt_nascimento) --> Imprime a pessoa mais nova 
# MIN(dt_nascimento) --> Imprime a pessoa mais velha 
# nm_cliente --> Tá errado, só coloquei p/ testar no código, mas não tá retornando o nome do cliente certo com a sua respectiva data de nascimento
SELECT MAX(dt_nascimento), nm_cliente, MIN(dt_nascimento), nm_cliente FROM cliente;

#Conta quantas linhas tem, quantos atributos possui a nossa tabela.
SELECT COUNT(*) FROM produto;

#GROUP BY - Tá agrupando os dados iguais 
#Com os dados iguais, tá rolando a contagem das linhas dos dados iguais 
#A "Maria Silva" que não é cooperada não tá sendo imprimida, pois todos possuem, menos ela, então não é um dado igual
SELECT COUNT(cd_endereco), cd_endereco
FROM cliente GROUP BY (cd_endereco);

##Quantos produtos eu possuo na categoria 1
#Só aparece UM produto, pois só temos UM produto na categoria 1 
#WHERE --> Criou uma condição para ser puxado apenas o produto que estiver UNICAMENTE na categoria 1 
SELECT COUNT(cd_categoria)
FROM produto WHERE cd_categoria = 1;

#Imprimir quantos clientes são cooperados 
#Apareceu "3", pois são 3 clientes cooperados
SELECT COUNT(bl_cooperado) 
FROM cliente 
WHERE bl_cooperado = TRUE;

#==========================================================================================================


#1) Média das datas de nascimento.
SELECT AVG(dt_nascimento) FROM cliente;

#1) Calcule a média de idade dos clientes.
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(dt_nascimento)) FROM cliente;

#2) Determine a quantidade total de produtos em estoque.
SELECT COUNT(qt_estoque) FROM produto;

#3) Encontre o valor máximo dos produtos.
SELECT MAX(vl_produto) FROM produto;

#4) Calcule a soma total dos valores dos produtos na categoria "Eletrônicos".
SELECT SUM(vl_produto) FROM produto
WHERE cd_categoria = 1;

#5) Encontre o produto mais barato.
#Criei mais um select no meu WHERE para ele poder me retornar qual é o nome do produto com valor mais barato
SELECT nm_produto FROM produto
WHERE vl_produto = (SELECT MIN(vl_produto) FROM produto);

#6) Determine a quantidade total de clientes por município.
SELECT e.ds_municipio, COUNT(c.id) 
FROM cliente AS c JOIN endereco AS e 
ON c.cd_endereco = e.id
#Agrupa por municipio 
GROUP BY(e.ds_municipio);

#7) Calcule a média de estoque por categoria.
SELECT c.nm_categoria, AVG(p.qt_estoque)
FROM produto AS p JOIN categoria AS c
ON p.cd_categoria = c.id
GROUP BY(c.nm_categoria);

#8) Encontre o cliente mais jovem em cada município. - (Não é para fazer)


#9) Determine a quantidade de produtos por categoria.
SELECT COUNT(c.id)
FROM produto AS p JOIN categoria AS c
ON p.cd_categoria = c.id;


#10) Calcule a soma total dos valores dos produtos por categoria. - (Não é para fazer)
SELECT SUM(vl_produto)