# Prova

# 1.(4,0 Pontos) Criação das estruturas do modelo (tabelas, atributos e restrições);

CREATE TABLE usuario (
id INTEGER PRIMARY KEY,
nm_usuario VARCHAR (50),
ds_email VARCHAR (50),
nr_telefone VARCHAR (15)
);

CREATE TABLE ordem_servico (
nr_os INTEGER PRIMARY KEY,
cd_usuario INTEGER REFERENCES usuario (id),
dt_registro DATE,
ds_observacao VARCHAR (200)
);

CREATE TABLE servico (
id INTEGER PRIMARY KEY,
ds_servico VARCHAR (50),
ds_sugestao VARCHAR (200)
);

CREATE TABLE itens_ordem_servico (
nr_os INTEGER REFERENCES ordem_servico (nr_os),
cd_servico INTEGER REFERENCES servico (id),
dt_atendimento DATE,
ds_atendimento VARCHAR (100)
);

2.(1,0 Ponto) Inserção de dados: 03 usuários; 05 serviços; 05 ordens de serviço com data de registro em qualquer dia do
mês de novembro/2023 e com, no mínimo, 02 serviços em cada ordem;

INSERT INTO usuario (
id,
nm_usuario,
ds_email,
nr_telefone
) VALUES (
1,'Sabrina','saygames@gmail.com','4790914567'),
(2,'Nicole','nicplay@gmail.com','47984479966'),
(3,'Maju', 'mtjfurb@gmail.com','47982345869');

INSERT INTO ordem_servico (
nr_os,
cd_usuario, 
dt_registro,
ds_observacao
) VALUES 
(1, 1,'2023-11-04', 'Serviço bem feito'), 
(2, 2,'2023-11-26', 'Faltou organização'),
(3, 3,'2023-11-15', 'Limpar borda da piscina'),
(4, 2,'2023-11-08', 'Desligar o ar-condicionado ao sair'),
(5, 1,'2023-11-13', 'Sem chatGPT');

INSERT INTO servico (
id,
ds_servico,
ds_sugestao
) VALUES (
1, 'programa de computadores', 'reiniciar o computador'),
(2, 'arquitetura de apartamentos', 'criar modelo de apartamento B1'),
(3, 'limpezas de piscinas', 'colocar cloro na agua'),
(4, 'contador de banco', 'verificar contabilidade'),
(5, 'desenvolvedor de games', 'criar remodelacao');

# 02 serviços em cada ordem
INSERT INTO itens_ordem_servico(
nr_os,
cd_servico,
dt_atendimento,
ds_atendimento
) VALUES (
1, 3, '2023-11-12', 'funcionario muito eficiente'),
(1, 1, '2023-11-12', 'arrumou meu pc'),
(2, 2, '2023-11-10', 'apartamento mal planejado'),
(2, 3, '2023-11-10', 'funcionario cuidadoso'),
(3, 2, '2023-11-09', 'apartamento bem localizado'),
(3, 4, '2023-11-09', 'funcionario muito eficiente'),
(4, 4, '2023-11-13', 'atendente mal educado'),
(4, 5, '2023-11-13', 'jogo sem bugs!'),
(5, 5, '2023-11-15', 'jogo com graficos otimos'),
(5, 1, '2023-11-15', 'programador não conseguiu nem formatar meu pc!!!');

# 3.(1.0 Ponto) Exibir a quantidade média de serviços associados as ordens de serviço cadastradas;
 
#Explicação da questão 3. 

#para calcular a quantidade média de serviços deve-se:
  #pegar o número de ordens --> ordens == 10
    #Deveria pegar essa quantidade de ordens e "dividir" pela quantidade de serviços 
  #pegar o número de serviços -> serviços == 5
  
  #O AVG será necessário para tirar a média de serviços que tá associado as ordens 
  #A média total deveria ser == 2 
  
  #Unimos a tabela "serviço" com a tabela "itens_ordem_servico" 
SELECT AVG(s.id) AS quantidade_media
FROM servico AS s JOIN itens_ordem_servico AS ios
ON ios.cd_servico = s.id
WHERE ios.nr_os = (SELECT COUNT(ios.nr_os) FROM itens_ordem_servico WHERE s.id = AVG(s.id))
GROUP BY(nr_os);

 #Aqui tentamos fazer aparecer a média com apenas uma tabela 
SELECT AVG(nr_os) AS quantidade_media, AVG(cd_servico)
FROM itens_ordem_servico 
GROUP BY(nr_os);


# 4.(1.5 Pontos) Listar as ordens de serviço registradas entre os dias 10 e 15 de novembro de 2023 (inclusive estas datas),
# com respectivo nome de usuário que solicitou e respectivas descrições dos serviços associados a cada ordem;

SELECT u.nm_usuario, os.*, s.ds_servico  
FROM ordem_servico AS os JOIN usuario AS u 
ON os.cd_usuario = u.id
JOIN servico AS s 
ON s.id = os.cd_usuario
WHERE dt_registro >= '2023-11-10' 
AND dt_registro <= '2023-11-15';

# 5.(1,0 Ponto) Exibir o nome do usuário com a respectiva quantidade de ordens de serviço que solicitou;

SELECT u.nm_usuario, COUNT(os.ds_observacao) AS quantidade_de_ordens
FROM usuario AS u JOIN ordem_servico AS os 
ON u.id = os.cd_usuario 
GROUP BY (os.cd_usuario);

# 6.(1,5 Pontos) Listar o número da ordem de serviço, a data de registro da mesma e descrição do(s) serviço(s) associado(s)
# a respectiva ordem de serviço onde a descrição do serviço é diferente de “concluído”

SELECT os.nr_os, os.dt_registro, s.ds_servico
FROM ordem_servico AS os JOIN servico AS s 
ON os.nr_os = s.id
WHERE ds_servico <> 'concluido';