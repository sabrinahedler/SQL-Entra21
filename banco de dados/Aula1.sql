CREATE TABLE sala_de_aula(
qt_alunos INTEGER,
nm_professor VARCHAR (30),
periodo VARCHAR (25),
media_turma DECIMAL
);

ALTER TABLE sala_de_aula ADD fl_monitor INTEGER;
ALTER TABLE sala_de_aula DROP fl_monitor;

CREATE TABLE voo(
nr_numero INTEGER,
qnt_passagens INTEGER,
hr_decolagem DATETIME,
hr_prevista DATETIME,
ds_destino VARCHAR (150),
preco_passagem DECIMAL
);

CREATE TABLE departamento(
# o primeiro atributo tem que ser a PK
id INTEGER PRIMARY KEY, # define que é pk
ds_departamento VARCHAR (150)
);

CREATE TABLE chefe (
id INTEGER PRIMARY KEY,
ds_nome VARCHAR (50),
# no fim crio meus atributos estrangeiros
# chamo referencia para chamar a tabela - especifico a coluna (id(PK)
cd_departamento INTEGER REFERENCES departamento (id)
);

CREATE TABLE endereco(
id INTEGER PRIMARY KEY,
municipio VARCHAR (50),
bairro VARCHAR (50)
);

CREATE TABLE cliente (
id INTEGER PRIMARY KEY,
nm_cliente VARCHAR (150),
ds_cpf CHAR (11),
bl_coooperado BOOLEAN,
dt_nascimento DATE,
cd_endereco INTEGER REFERENCES endereco (id)
);

CREATE TABLE categoria(
id INTEGER PRIMARY KEY,
nm_categoria VARCHAR (50),
ds_categoria VARCHAR (150)
);

CREATE TABLE produto(
id INTEGER PRIMARY KEY,
nm_produto VARCHAR (50),
qt_estoque INTEGER,
vl_produto DECIMAL,
cd_categoria INTEGER REFERENCES categoria (id)
);

CREATE TABLE pessoa(
id INTEGER PRIMARY KEY,
nm_pessoa VARCHAR (50),
cpf CHAR (11),
gerente BOOLEAN,
empregado BOOLEAN
);

CREATE TABLE empresa(
id INTEGER PRIMARY KEY,
cnpj CHAR (18),
qntd_funcionarios INTEGER
);

CREATE TABLE pessoa_empresa(
cd_pessoa INTEGER REFERENCES pessoa (id),
cd_empresa INTEGER REFERENCES empresa (id)
);