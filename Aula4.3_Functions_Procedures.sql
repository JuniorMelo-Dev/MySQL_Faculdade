CREATE DATABASE escola;
USE escola;

CREATE TABLE Aluno (
RA INT PRIMARY KEY NOT NULL,
	Nome VARCHAR(30) NOT NULL,
    Telefone BIGINT NOT NULL
);
INSERT Aluno VALUES
(1234, 'Aluno_A', 988776655),
(1235, 'Aluno_B', 997975566),
(1236, 'Aluno_C', 988225544),
(1237, 'Aluno_D', 966887744),
(1238, 'Aluno_E', 911223344),
(1239, 'Aluno_F', 922334455);
SELECT * FROM Aluno;

CREATE TABLE Disciplina (
Id INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL
);
INSERT Disciplina VALUES 
(0, 'Banco de Dados'),
(0, 'Programação Estruturada'),
(0, 'Redes de Computaadores'),
(0, 'LFA');
SELECT * FROM Disciplina;

CREATE TABLE Notas (
Aluno_RA INT NOT NULL,
Disciplina_Id INT NOT NULL,
Nota_P1 DECIMAL(3,1) NOT NULL,
Nota_P2 DECIMAL(3,1) NOT NULL,
FOREIGN KEY (Aluno_RA) REFERENCES Aluno(RA),
FOREIGN KEY (Disciplina_Id) REFERENCES Disciplina(Id)
);
INSERT Notas VALUES
(1234, 1, 7.0, 5.5),(1235, 1, 7.0, 5.5),(1236, 1, 6.0, 8.5),(1237, 1, 5.0, 3.5),(1238, 1, 2.5, 3.5),(1239, 1, 9.0, 5.5),
(1234, 2, 6.0, 7.5),(1235, 2, 6.5, 8.5),(1236, 2, 5.0, 4.5),(1237, 2, 8.0, 7.0),(1238, 2, 7.5, 6.5),(1239, 2, 6.0, 5.5),
(1234, 3, 8.5, 5.5),(1235, 3, 3.5, 7.5),(1236, 3, 7.0, 3.5),(1237, 3, 2.0, 7.0),(1238, 3, 2.5, 7.5),(1239, 3, 4.0, 9.5),
(1234, 4, 5.0, 6.5),(1235, 4, 7.5, 7.5),(1236, 4, 7.0, 6.5),(1237, 4, 6.0, 7.0),(1238, 4, 4.5, 3.5),(1239, 4, 2.0, 2.5);
SELECT * FROM Notas;

-- Desenvolver uma função para o calculo da média final
CREATE FUNCTION fn_media (x DECIMAL(3,1), y DECIMAL(3,1))
RETURNS DECIMAL(3,1)
RETURN (x * 0.4) + (y * 0.6);

-- Sintaxe para utilizar a função desenvolvida
SELECT Aluno.Nome, Disciplina.Nome AS 'Disciplina', fn_media(Nota_P1, Nota_P2) AS 'Média Final'
FROM Notas INNER JOIN Aluno ON Notas.Aluno_RA = Aluno.RA
INNER JOIN Disciplina ON Notas.Disciplina_Id = Disciplina.Id
WHERE fn_media(Nota_P1, Nota_P2) >= 4.0 AND fn_media(Nota_P1, Nota_P2) <= 6.9;

SHOW FUNCTION STATUS; -- retorn as functions criadas
SHOW CREATE FUNCTION fn_media; -- retorna detalhes da function criada

-- Desenvolver um procedimento armazenado para calcular a média geral dos alunos das disciplinas
CREATE PROCEDURE proc_MediaExame (var_DisciplinaId int)
SELECT AVG(fn_media(Nota_P1, Nota_P2)) AS 'Média Exame'
FROM Notas
WHERE Disciplina_Id = var_DisciplinaId AND (fn_media(Nota_P1, Nota_P2) >= 4.0
AND fn_media(Nota_P1, Nota_P2) <= 6.9);

-- Sintaxe para utilizar um procedimento armazenado, atribuindo valor a variável do tipo INT que foi criado
CALL proc_MediaExame (1); 
CALL proc_MediaExame (2);
CALL proc_MediaExame (3);
CALL proc_MediaExame (4);

SHOW PROCEDURE STATUS; -- retorna os procedimentos armazenados criados




















