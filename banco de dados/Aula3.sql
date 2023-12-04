# * -> representa todos os campos
SELECT nm_categoria, ds_categoria FROM categoria;

SELECT * FROM categoria;

SELECT * FROM produto;

SELECT id FROM categoria;

SELECT nm_cliente, dt_nascimento FROM cliente;

SELECT * FROM cliente
WHERE nm_cliente = 'Joao Silva' OR
nm_cliente = 'Carlos Santos';

SELECT * FROM cliente
WHERE bl_coooperado = TRUE;

SELECT nm_cliente, ds_cpf, cd_endereco FROM cliente
WHERE dt_nascimento > '1990-12-30';

SELECT nm_cliente, ds_cpf, cd_endereco FROM cliente
WHERE cd_endereco = 2;

SELECT nm_cliente, dt_nascimento FROM cliente
ORDER BY dt_nascimento ASC;

SELECT nm_cliente, ds_cpf, cd_endereco FROM cliente
WHERE bl_coooperado = TRUE AND
cd_endereco = 1;

SELECT * FROM cliente
ORDER BY nm_cliente ASC; # ASC crescente

SELECT * FROM cliente
ORDER BY nm_cliente DESC; # DESC = decrescente

SELECT * FROM produto
ORDER BY vl_produto ASC;

SELECT * FROM produto
ORDER BY vl_produto DESC;

SELECT * FROM produto
WHERE vl_produto > 100;

SELECT nm_produto, qt_estoque FROM produto
WHERE cd_categoria = 1;

SELECT nm_produto, vl_produto, cd_categoria FROM produto
WHERE vl_produto > 9 AND vl_produto < 51;

SELECT nm_produto, cd_categoria FROM produto
WHERE qt_estoque < 50;

SELECT nm_produto, qt_estoque FROM produto
WHERE cd_categoria = 3 AND vl_produto < 30;

# JOIN 
# c = é um apelido para cliente
SELECT * FROM cliente AS c, endereco AS e WHERE
c.cd_endereco = e.id;

SELECT * FROM cliente AS c JOIN endereco AS e 
ON c.cd_endereco = e.id;

SELECT * FROM produto AS p JOIN categoria AS c 
ON p.cd_categoria = c.id;

SELECT nm_cliente, ds_cpf FROM cliente AS c JOIN endereco AS e ON c.cd_endereco = e.id
WHERE c.cd_endereco = 1; 

SELECT nm_cliente, dt_nascimento FROM cliente AS c JOIN endereco AS e ON c.cd_endereco = e.id
ORDER BY e.municipio ASC;

SELECT nm_cliente, dt_nascimento, bairro FROM cliente AS c JOIN endereco AS e ON c.cd_endereco = e.id
WHERE c.bl_coooperado = TRUE AND e.bairro = 'Centro'; 

SELECT nm_cliente, dt_nascimento, municipio, bairro FROM cliente AS c JOIN endereco AS e ON c.cd_endereco = e.id
WHERE c.dt_nascimento < '1990-12-30'
ORDER BY c.dt_nascimento ASC; 

SELECT nm_cliente, ds_cpf, municipio FROM cliente AS c JOIN endereco AS e ON c.cd_endereco = e.id
WHERE c.bl_coooperado = TRUE 
ORDER BY c.nm_cliente, e.municipio ASC; 

SELECT nm_produto, qt_estoque, vl_produto FROM produto AS p JOIN categoria AS c ON p.cd_categoria = c.id
WHERE c.id = 1;

SELECT nm_produto, vl_produto, ds_categoria FROM produto AS p JOIN categoria AS c ON p.cd_categoria = c.id
ORDER BY p.vl_produto DESC;

SELECT nm_produto, qt_estoque, ds_categoria FROM produto AS p JOIN categoria AS c ON p.cd_categoria = c.id
WHERE p.qt_estoque < 60
ORDER BY p.qt_estoque ASC;

SELECT nm_produto, vl_produto, qt_estoque FROM produto AS p JOIN categoria AS c ON p.cd_categoria = c.id
WHERE p.cd_categoria = 3 AND p.vl_produto > 15;

SELECT nm_produto, qt_estoque, ds_categoria FROM produto AS p JOIN categoria AS c ON p.cd_categoria = c.id
WHERE p.qt_estoque > 50 AND p.cd_categoria = 2
ORDER BY p.qt_estoque DESC;

