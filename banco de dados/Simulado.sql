# SIMULADO

CREATE TABLE editora (
id INTEGER PRIMARY KEY,
nm_editora VARCHAR (50)
);

CREATE TABLE livro (
id INTEGER PRIMARY KEY,
nm_titulo VARCHAR (50),
ano_publicado INTEGER,
vl_livro DECIMAL (8,2),
cd_editaulasora INTEGER REFERENCES editora (id)
);

CREATE TABLE autor (
id INTEGER PRIMARY KEY,
nm_autor VARCHAR (100),
dt_nascimento DATE
);

CREATE TABLE autor_livro (
cd_livro INTEGER REFERENCES livro (id),
cd_autor INTEGER REFERENCES autor (id),
papel_no_livro VARCHAR (200),
ano_contribuicao INTEGER
);

INSERT INTO editora (
id,
nm_editora
) VALUES ( 
1, 'Editora A'),
(2, 'Editora B'),
(3, 'Editora C');

INSERT INTO livro (
id, 
nm_titulo,
ano_publicado,
vl_livro,
cd_editaulasora
) VALUES (
1, 'Livro 1', 2020, 50, 1),
(2, 'Livro 2', 2018, 45.5, 2),
(3, 'Livro 3', 2022, 60.75, 3),
(4, 'Livro 4', 2010, 42.5, 2),
(5, 'Livro 5', 2015, 56.77, 3);

INSERT INTO autor (
id,
nm_autor,
dt_nascimento
) VALUES (
1, 'Autor A', '1990-01-15'),
(2, 'Autor B', '1985-07-20'),
(3, 'Autor C', '1987-03-10'),
(4, 'Autor D', '1995-10-25'),
(5, 'Autor E', '1992-06-27');

INSERT INTO autor_livro (
cd_livro,
cd_autor,
papel_no_livro,
ano_contribuicao
) VALUES (
1, 1, NULL, 2020),
(1, 2, NULL, 2020),
(2, 3, NULL, 2018),
(3, 1, NULL, 2022),
(3, 3, NULL, 2022),
(4, 4, NULL, 2010),
(5, 5, NULL, 2015);

# QUESTAO A
UPDATE livro SET vl_livro = 55.00
WHERE cd_editaulasora = 2;

# QUESTAO B
DELETE FROM autor_livro 
WHERE cd_livro = (SELECT cd_livro FROM livro WHERE nm_titulo = 'Livro 4');

DELETE FROM livro 
WHERE id = 4;

# QUESTAO C
SELECT nm_titulo FROM livro
WHERE ano_publicado > 2015;

# QUESTAO D
SELECT AVG(vl_livro), MAX(vl_livro), MIN(vl_livro) FROM livro;

# QUESTAO E ******
SELECT e.nm_editora, COUNT(l.id) AS total_livros
FROM editora e
LEFT JOIN livro l ON e.id = l.id
GROUP BY e.nm_editora
ORDER BY e.nm_editora;


# QUESTAO F ******
SELECT l.nm_titulo, COUNT(al.cd_autor)
FROM livro AS l, autor_livro AS al
WHERE l.id = al.cd_livro
GROUP BY l.nm_titulo;

# QUESTAO G
SELECT MIN(ano_publicado), MAX(ano_publicado) FROM livro;

# QUESTAO H
SELECT nm_autor, dt_nascimento FROM autor
WHERE dt_nascimento < '1991-01-01';

# QUESTAO I
SELECT nm_titulo FROM livro
WHERE cd_editaulasora = 2;

# QUESTAO J ******
SELECT a.* FROM autor AS a
JOIN autor_livro AS al ON a.id = al.cd_autor
JOIN livro l ON al.cd_livro = l.id
WHERE l.nm_titulo = 'Livro 3';
