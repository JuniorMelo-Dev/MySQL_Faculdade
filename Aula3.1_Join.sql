CREATE DATABASE Loja;
USE Loja;

CREATE TABLE Categoria (
Id INT(3) PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL
);
INSERT Categoria VALUES 
(0, 'DVD'),
(0, 'Livro'),
(0, 'Informática');

CREATE TABLE Produto (
Codigo INT(3) PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
    Valor DECIMAL(6,2) NOT NULL,
    Id_Categoria INT(3) NOT NULL,
    FOREIGN KEY (Id_Categoria) REFERENCES Categoria (Id)
);
INSERT Produto VALUES
(0, 'Código da Vinci', '39.99', 2),
(0, 'Hancok', '89.99', 1),
(0, 'Diário de um Mago', '19,99', 2),
(0, 'Eu sou a Lenda', '39.99', 1);

SELECT * FROM Categoria;
SELECT * FROM Produto;

SELECT categoria.nome, produto.nome FROM Categoria INNER JOIN Produto ON Categoria.Id = Produto.Id_Categoria;

SELECT categoria.nome as 'Tipo', produto.nome as 'Produto', produto.valor as 'Valor' 
FROM Categoria INNER JOIN Produto ON Categoria.Id = Produto.Id_Categoria WHERE produto.valor < 50;

SELECT categoria.nome as 'Tipo', produto.nome as 'Produto', produto.valor as 'Valor'
FROM Categoria LEFT JOIN Produto ON Categoria.Id = Produto.Id_Categoria;

SELECT categoria.nome as 'Tipo', produto.nome as 'Produto', produto.valor as 'Valor'
FROM Categoria RIGHT JOIN Produto ON Categoria.Id = Produto.Id_Categoria;
















