CREATE DATABASE litoral;
USE litoral;

CREATE TABLE escuna (
Numero INT PRIMARY KEY,
	Nome VARCHAR(30),
    Capitao_cpf CHAR(11)
);
INSERT escuna VALUES
(12345, 'Black Flag', 88888888899),(12346, 'Caveira', 66666666677),(12347, 'Brazuca', 44444444455),(12348, 'Rosa Brilhante 1', 12345678900),
(12349, 'Tubarão Ocean', 22222222233),(12340, 'Rosa Brilhante 2', 12345678900);
SELECT * FROM escuna;

CREATE TABLE Destino (
Id INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(30)
);
INSERT Destino VALUES
(0, 'Ilha Dourada'),(0, "Ilha D'Areia Fina"),(0, 'Ilha Encantada'),(0, 'Ilha dos Ventos'),(0, 'Ilhinha'),(0, 'Ilha Torta'),(0, 'Ilha dos Sonhos'),(0, 'Ilha do Sono');
SELECT * FROM Destino;

CREATE TABLE Passeio (
Id INT PRIMARY KEY AUTO_INCREMENT,
	Data DATE,
    Hora_Saida TIME,
    Hora_Chegada TIME,
    Escuna_Numero INT,
    Destino_Id INT,
    FOREIGN KEY (Escuna_Numero) REFERENCES escuna(Numero),
    FOREIGN KEY (Destino_Id) REFERENCES Destino(Id)
);
INSERT Passeio VALUES
(0,20180102,080000,140000,12345,1),(0,20180102,070000,170000,12346,8),(0,20180102,080000,140000,12340,3),(0,20180103,060000,120000,12347,2),
(0,20180103,070000,130000,12348,4),(0,20180103,080000,140000,12349,6),(0,20180103,090000,150000,12345,5),(0,20180104,070000,160000,12347,1),
(0,20180104,070000,170000,12345,3),(0,20180104,090000,130000,12349,7),(0,20180105,100000,180000,12340,8),(0,20180105,090000,130000,12347,7);
SELECT * FROM Passeio;

SELECT escuna.Nome, Destino.Nome, Hora_Saida, Hora_Chegada, Data
FROM Passeio INNER JOIN escuna ON Passeio.Escuna_Numero = escuna.Numero
INNER JOIN Destino ON Passeio.Destino_Id = Destino.Id
ORDER BY Passeio.Data;

-- Criando VIEW para dimninuir tempo de consulta
CREATE VIEW v_consulta AS
SELECT escuna.Nome AS 'Escuna', Destino.Nome AS 'Ilha', Hora_Saida AS 'Saída', Hora_Chegada AS 'Chegada', Data
FROM Passeio INNER JOIN escuna ON Passeio.Escuna_Numero = escuna.Numero
INNER JOIN Destino ON Passeio.Destino_Id = Destino.Id
ORDER BY Passeio.Data;

SELECT * FROM v_consulta;

-- Para criar um ponto de restauração no BD
SET AUTOCOMMIT = 0;
SAVEPOINT point1;

SELECT * FROM Destino;

-- Executando erro, para realizar a utilização do SAVEPOINT na Tabela 'Destino'
UPDATE Destino SET Nome = 'Pequena Ilha do Mar'; -- UPDATE usado sem a clausula WHERE, gerando erro na Tabela

-- Retornando a Tabela ao ponto anterior com o uso do ROLLBACK + SAVEPOINT Criado
ROLLBACK TO SAVEPOINT point1;

-- Tabela retornada ao estado anterior ao erro, refazer o UPDATE com os parâmetros certos 'WHERE' 
 UPDATE Destino Set Nome = 'Pequena Ilha do Mar' WHERE Id= 5;
 
 COMMIT;  -- Necessário utilizar o comando 'COMMIT' para executar o salvamento do UPDATE
 
 SAVEPOINT point2;  -- Criado novo 'SAVEPOINT' para segurança dos dados da Tabela e correções futuras
 
 -- Criando Tabela 'Vendas'
CREATE TABLE Vendas (
Numero INT PRIMARY KEY AUTO_INCREMENT,
	Destino_Id INT,
    Embarque DATE,
    Qtd INT,
    FOREIGN KEY (Destino_Id) REFERENCES Destino(Id)
);
INSERT Vendas VALUES
(0,1,20180203,3),(0,7,20180203,2),(0,5,20180203,1);

ALTER TABLE Destino ADD COLUMN Valor DECIMAL(5,2); -- Inserindo novo campo a Tabela 'Destino'

UPDATE Destino SET Valor = 100 WHERE Id = 1;
UPDATE Destino SET Valor = 120 WHERE Id = 2;
UPDATE Destino SET Valor = 80 WHERE Id = 3;
UPDATE Destino SET Valor = 90 WHERE Id = 4;
UPDATE Destino SET Valor = 100 WHERE Id = 5;
UPDATE Destino SET Valor = 150 WHERE Id = 6;
UPDATE Destino SET Valor = 120 WHERE Id = 7;
UPDATE Destino SET Valor = 180 WHERE Id = 8;

-- Criando 'Função' para aplicar o desconto de 30%
CREATE FUNCTION fn_desconto (x DECIMAL(5,2), y INT)
RETURNS DECIMAL(5,2)
RETURN ((x * y) * 0.7);
SHOW FUNCTION STATUS WHERE db = 'litoral'; -- Retorna as 'Funcões' criadas no BD

-- Criando 'Procedimento'
CREATE PROCEDURE proc_desconto (Var_Venda_Numero INT)
SELECT (fn_desconto(Destino.Valor, Vendas.Qtd)) AS 'Valor_Desconto', Destino.Nome AS 'Destino', Vendas.Qtd AS 'Passagens', Vendas.Embarque
FROM Vendas INNER JOIN Destino ON Vendas.Destino_Id = Destino.Id
WHERE Vendas.Numero = Var_Venda_Numero;

-- Sintaxe para utilizar um procedimento armazenado, atribuindo valor a variável que foi criada
CALL proc_desconto (1);
CALL proc_desconto (2);
CALL proc_desconto (3);

























