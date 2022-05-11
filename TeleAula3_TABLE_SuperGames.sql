CREATE DATABASE SuperGames;
USE SuperGames;

CREATE TABLE localizacao (
Id INT(3) PRIMARY KEY AUTO_INCREMENT,
	Secao VARCHAR(50) NOT NULL,
    Preteleira INT(3) ZEROFILL NOT NULL
);
INSERT localizacao VALUES
(0, 'Guerra', '001'),
(0, 'Guerra', '002'),
(0, 'Aventura', 100),
(0, 'Aventura', '101'),
(0, 'RPG', '150'),
(0, 'RPG', '151'),
(0, 'Plataforma', '200'),
(0, 'Plataforma', '201');

CREATE TABLE jogo (
Cod INT(3) PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Valor DECIMAL(6,2) NOT NULL,
    localizacao_Id INT(3) NOT NULL,
    FOREIGN KEY (localizacao_Id) REFERENCES localizacao (Id) 
);
INSERT jogo VALUES
(0, 'COD 3', 125.00, 1),
(0, 'BF 1', 150.00, 2),
(0, 'Zelda BotW', 200.00, 3),
(0, 'Zelda Oot', 99.00, 4),
(0, 'Chrono T', 205.00, 5);
INSERT jogo VALUES
(0, 'Super Metroid', 205.00, 7),
(0, 'DKC 2', 100.00, 8),
(0, 'FF XV', 120.00, 5),
(0, 'Xenoblade 2', 199.00, 6);

SELECT * FROM localizacao;
DESC localizacao;
SELECT * FROM jogo;
DESC jogo;

-- Identificando o nome do jogo e a prateleira
SELECT jogo.nome, localizacao.preteleira
FROM jogo INNER JOIN localizacao
ON localizacao.id = jogo.localizacao_id;

-- Identificar o nome dos jogos da seção Aventura
SELECT jogo.nome, localizacao.preteleira
FROM jogo INNER JOIN localizacao
ON localizacao.id = jogo.localizacao_id
WHERE secao = 'Aventura';

-- Identificar todas as seções e os respectivos nomes dos jogos, ordenando as seleções em ordem crescente pelo nome dos jogos
SELECT localizacao.secao AS 'SEÇÂO', localizacao.preteleira AS 'PRATELEIRA', jogo.nome AS 'JOGO'
FROM localizacao LEFT JOIN jogo
ON localizacao.Id = jogo.localizacao_Id
ORDER BY jogo.nome ASC;

-- Desenvolver uma função de agregação que retorne a quantidade de registros na tabela jogo
SELECT COUNT(*) FROM jogo;

-- Desenvolver uma função de agregação que retorne o valor do jogo de maior preço(valor)
SELECT MAX(valor) AS 'Maior Valor' FROM jogo;

-- Desenvolver uma função de agregação que retorne o valor do jogo de menor preço(valor)
SELECT MIN(valor) AS 'Menor Valor' FROM jogo;

-- Desenvolver uma função de agregação que retorne o valor médio dos jogos de guerra
SELECT AVG(valor) AS 'Média Seção "Guerra"' 
FROM jogo INNER JOIN localizacao ON localizacao.Id = jogo.localizacao_Id
WHERE localizacao.secao = 'Guerra';

-- Desenvolver uma função de agregação que retorne o valor total em estoque na loja de jogos
SELECT SUM(valor) AS 'Total' FROM jogo;

-- Alterar o valor dos jogos em promoção
UPDATE jogo SET valor = valor * 0.5 WHERE nome = 'BF 1';
UPDATE jogo SET valor = valor * 0.5 WHERE nome = 'COD 3';

SELECT * FROM localizacao;
SELECT * FROM jogo;
SELECT * FROM promocao;

-- Criar tabela 'Promoção'
CREATE TABLE promocao (
Promo INT(3) PRIMARY KEY AUTO_INCREMENT,
	Cod_Jogo INT(3) NOT NULL,
    FOREIGN KEY (Cod_Jogo) REFERENCES jogo(Cod)
);

-- Inserção dos jogos em promoção
INSERT promocao VALUES (0,1),(0,2);

-- Selecionar os jogos em promoção usando 'IN'
SELECT jogo.nome, jogo.valor FROM jogo WHERE jogo.Cod IN (SELECT Cod_Jogo FROM promocao);
-- Selecionar os jogos em promoção usando 'JOIN'
SELECT jogo.nome AS 'JOGO', jogo.valor AS 'PREÇO' FROM jogo INNER JOIN promocao ON jogo.Cod = promocao.Cod_Jogo;

-- Selecionar os jogos que não estão em promoção
SELECT jogo.nome, jogo.valor FROM jogo WHERE jogo.Cod NOT IN (SELECT Cod_Jogo FROM promocao);

-- Selecionar o jogo mais barato usando subconsultas e função de agregação
SELECT nome AS 'MAIS BARATO!' FROM jogo WHERE valor = SOME (SELECT MIN(valor) FROM jogo);
















