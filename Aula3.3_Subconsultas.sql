CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Aluno (
RA INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL,
    Telefone VARCHAR(11) NOT NULL
);
INSERT Aluno VALUES
('11223', 'Serj Tankian', '987658899'),
('12345', 'Joye Ramone', '991213344'),
('54321', 'Lars Ulrich', '977889966'),
('56789', 'Corey Taylor', '901238525'),
('98765', 'Vicky Psarakis', '922556688');

CREATE TABLE Funcionario (
Matricula INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL,
    Cargo VARCHAR(20) NOT NULL
);
INSERT Funcionario VALUES
('1', 'Melvil Dewey', 'Bibliotecario 1'),
('2', 'Manuel Bastos Tigre', 'Bibliotecario 2');

CREATE TABLE Livro (
ISBN INT(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL,
    Secao VARCHAR(20) NOT NULL
);
INSERT Livro VALUES
('11111', 'Vida Punk', 'musica'),
('22222', 'Mestres da Bateria', 'musica'),
('33333', 'Sexta-feira 13', 'terror'),
('44444', 'Mulheres do Rock', 'musica'),
('55555', 'O Exorcista', 'terror'),
('66666', 'O Chamado', 'terror'),
('77777', 'Mascaras', 'musica'),
('88888', 'ToxiCity', 'musica'),
('99999', 'Diário de um Mago', 'esoterismo');

CREATE TABLE Emprestimo (
Numero INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Retirada DATE NOT NULL,
    Devolucao DATE NOT NULL,
    Aluno_RA INT(5) NOT NULL,
    Funcionario_Matricula INT(5) NOT NULL,
    Livro_ISBN INT(8) NOT NULL,
    FOREIGN KEY (Aluno_RA) REFERENCES Aluno(RA),
    FOREIGN KEY (Funcionario_Matricula) REFERENCES Funcionario(Matricula),
    FOREIGN KEY (Livro_ISBN) REFERENCES Livro(ISBN)
);
INSERT INTO Emprestimo VALUES
(0, '2018-01-02', '2018-01-17', '12345', '1', '11111'),
(0, '2018-01-15', '2018-02-01', '11223', '2', '88888'),
(0, '2018-04-05', '2018-04-20', '56789', '2', '77777'),
(0, '2018-03-15', '2018-03-30', '98765', '1', '44444'),
(0, '2018-06-06', '2018-06-21', '56789', '1', '55555'),
(0, '2018-08-01', '2018-08-16', '12345', '2', '22222'),
(0, '2018-10-10', '2018-10-25', '11223', '1', '66666');

CREATE TABLE Restricao (
Id INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Aluno_RA INT(5) NOT NULL,
    Livro_ISBN INT(8) NOT NULL
);
INSERT Restricao VALUES
(1, '12345', 22222);

-- Gerar consulta para encontrar nome de alunos que efetuaram empréstimos, porém estão com restrição para locar novos livros
SELECT Aluno.nome FROM Aluno WHERE Aluno.RA IN (SELECT Aluno_RA FROM Restricao);

-- Consultar o livro que o aluno 'Joey Ramone' não entregou, deixando-o com restrição para novas locações
SELECT Aluno.nome as 'Aluno', Livro.nome as 'Livro' FROM Aluno, Livro WHERE Aluno.RA IN 
(SELECT Aluno_RA FROM Restricao) AND Livro.ISBN IN (SELECT Livro_ISBN FROM Restricao);

-- Selecione os nomes dos alunos que numca tomaram livros emprestados
SELECT Aluno.nome as 'Aluno' FROM Aluno WHERE Aluno.RA NOT IN (SELECT  Aluno_RA FROM Emprestimo);

-- Fazer seleção dos livros, em que são ignorados os livros da seção 'música'
SELECT nome as 'Livro' FROM Livro WHERE Secao NOT IN (SELECT Secao FROM Emprestimo WHERE Secao = 'musica');

-- Realizar consulta a nomes dos livros e a seção, se a quantidade de livros da seção 'esoterismo' for menor doq eu a quantidade de livros
SELECT nome as 'Livro', secao as 'Seção' FROM Livro WHERE NOME > some (SELECT nome FROM Livro WHERE secao = 'esoterismo');
















