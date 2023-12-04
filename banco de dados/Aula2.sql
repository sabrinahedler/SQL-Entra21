# INSERIR DADOS NA TABELA

# insira na nome_tabela
INSERT INTO sala_de_aula (qt_alunos,
nm_professor, 
periodo,
media_turma
#especificar dentro dos parenteses quais atributos terâo novo valor
) VALUES (
# agora informo os valores de cada atributo na respectiva ordem
20, 'Maju', 'Noturno', 6.5
);

INSERT INTO categoria ( 
id,
nm_categoria,
ds_categoria
) VALUES (
1, 'Eletronicos', 'Dispositivos eletronicos, como smartphones, laptops, tables'
);

INSERT INTO categoria (
id,
nm_categoria,
ds_categoria
) VALUES (
2, 'Moda', 'Roupas e acessorios de moda para homens e mulheres'
);

INSERT INTO categoria (
id,
nm_categoria,
ds_categoria
) VALUES (
3, 'Livros', 'Diversos generos de livros, incluindo ficcao, nao ficcao e literatura classica'
);

INSERT INTO categoria (
id,
nm_categoria,
ds_categoria
) VALUES (
4, 'Casa e Jardim', 'Produtos para decoracao, moveis e itens de jardinagem'
);

INSERT INTO categoria (
id,
nm_categoria,
ds_categoria
) VALUES (
5, 'Esportes e Outdoor', 'Equipamentos esportivos, roupas esportivas e acessorios para atividades ao ar livre'
);

aulasINSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria
) VALUES (
1, 'Smartphone XYZ', 50, 899.99, 1
); 

aulasINSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria
) VALUES (
2, 'Camiseta Casual', 100, 29.99, 2
);

INSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria
) VALUES (
3, 'Livro "Aventuras Fantasticas"', 30,  15.50, 3
);

INSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria
) VALUES (
4, 'Conjunto de Sofa Moderno', 10, 799.99, 4
);

INSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria
) VALUES (
5, 'Bicicleta de Montanha', 20, 349.99, 5
);

# UPDATE
# seleciona a tabela   -   seleciono a coluna
UPDATE sala_de_aula SET nm_professor = 'Henrique' 
WHERE qt_alunos = 1;

UPDATE produto SET vl_produto = 799.99
WHERE cd_categoria = 1;

DELETE FROM produto 
WHERE qt_estoque < 15;

UPDATE categoria SET ds_categoria = 'Roupas e acessorios de moda para homens, mulheres e criancas'
WHERE nm_categoria = 'Moda';

INSERT INTO endereco (
id,
municipio,
bairro
) VALUES (
1, 'Cidade A', 'Centro'),
(2, 'Cidade B', 'Novo Bairro'),
(3, 'Cidade A', 'Suburbio'
);

INSERT INTO cliente (
id,
nm_cliente,
ds_cpf,
bl_coooperado,
dt_nascimento,
cd_endereco
) VALUES ( 
1, 'Joao Silva', '12345678901', TRUE, '1985-03-10', 1),
(2, 'Maria Oliveira', '98765432101', FALSE, '1992-07-22', 2),
(3, 'Carlos Santos', '45678901234', TRUE, '1978-11-05', 3),
(4, 'Ana Rocha', '87654321089', FALSE, '1989-05-15', 1),
(5, 'Paula Souza', '23456789012', TRUE, '1995-09-30', 1
);

UPDATE cliente SET cd_endereco = 2
WHERE id = 1;

DELETE FROM cliente 
WHERE bl_coooperado = FALSE;

INSERT INTO cliente (
id,
nm_cliente,
ds_cpf,
bl_coooperado,
dt_nascimento,
cd_endereco
) VALUES ( 
6, 'Maria Silva', 12345678901, FALSE, '1990-05-15', 1
);