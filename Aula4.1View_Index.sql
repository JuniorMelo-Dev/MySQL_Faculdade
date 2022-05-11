CREATE DATABASE Car;
USE Car;

CREATE TABLE Fabricante (
Codigo INT(3) PRIMARY KEY AUTO_INCREMENT,
	Marca CHAR(20) NOT NULL
);

CREATE TABLE Veiculo (
RENAVAN INT(8) PRIMARY KEY,
	Nome VARCHAR(30) NOT NULL,
    Cor VARCHAR(20) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    fabricante_Codigo INT(3) NOT NULL,
    FOREIGN KEY (fabricante_Codigo) REFERENCES Fabricante(Codigo)
);

INSERT INTO Fabricante (Codigo, Marca) VALUES
(0, 'Volk'),
(0, 'Fiat'),
(0, 'Chevrolet'),
(0, 'Ford'),
(0, 'Audi'),
(0, 'Hyundai');
select * from fabricante;

INSERT INTO Veiculo (RENAVAN, Nome, Cor, Preco, fabricante_Codigo) VALUES
(1234567, 'Corsa', 'Azul', 15000.00, 3),(1444558, 'Ká', 'Verde', 49000.00, 4),(2582582, 'Montana', 'Lilás', 62000.00, 3),(2589967, 'Idea', 'Prata', 44000.00, 2),
(4445566, 'AAR5', 'Azul', 80000.00, 5),(10102020, 'Saveiro', 'Preto', 22000.00, 1),(11111111, 'EspaceFox', 'Amarelo', 39000.00, 1),
(11122255, 'S10', 'Preto', 33000.00, 3),(12312312, 'Corsa', 'Rosa', 18000.00, 3),(12345678, 'AAR3', 'Prata', 44000.00, 5),
(14714714, 'Jetta', 'Prata', 45000.00, 1),(22222222, 'Siena', 'Preto', 18000.00, 2),(30303030, 'Strada', 'Preto', 27000.00, 2),
(33333333, 'Spin', 'Preto', 40000.00, 3),(36544477, 'Linea', 'Prata', 35000.00, 2),(44444444, 'Spin', 'Prata', 38000.00, 3),
(45645645, 'Idea', 'Branco', 42000.00, 2),(55220044, 'Fiesta', 'Branco', 25000.00, 4),(65465465, 'AAR3', 'Verde', 54000.00, 5),
(66666666, 'Ká', 'Preto', 19000.00, 4),(74174174, 'S10', 'Azul', 23000.00, 3),(77889966, 'Montana', 'Preto', 32000.00, 3),
(78889994, 'Jetta', 'Prata', 55000.00, 1),(78978998, 'Gol', 'Dourado', 82000.00, 1);
select * from veiculo;

CREATE VIEW v_select1 AS
	SELECT veiculo.nome AS 'Veiculo', fabricante.marca AS 'Marca', veiculo.cor AS 'Cor', veiculo.preco AS 'Valor'
    FROM veiculo INNER JOIN fabricante
    WHERE veiculo.fabricante_Codigo = fabricante.Codigo AND veiculo.preco <= 50000;
    
select * from v_select1;

CREATE INDEX idx_Renavan ON Veiculo(RENAVAN);
SHOW INDEX FROM veiculo;

SELECT nome AS 'Veiculo', cor AS 'Cor', Preco AS 'Valor'
FROM Veiculo
USE INDEX(idx_Renavan)
WHERE preco <= 50000;




























