CREATE TABLE Veiculos (
Id INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Marca VARCHAR(30) NOT NULL,
    Modelo VARCHAR(30) NOT NULL,
    Valor DECIMAL(10,2)
);

INSERT Veiculos VALUES
(0, 'BMW', '320i', 160000.00),
(0, 'Mercedes_Benz', 'C180', 140000.00),
(0, 'Hyundai', 'Azera', 120000.00),
(0, 'Mercedes_Benz', 'CLA 200', 140000.00),
(0, 'BMW', '328i', 210000.00),
(0, 'Volkswagem', 'Passat', 140000.00),
(0, 'BMW', '316i', 115000.00),
(0, 'Mercedes_Benz', 'Classe E', 248000.00),
(0, 'Mercedes_Benz', 'C 250', 180000.00),
(0, 'Jaguar', 'XF', 220000.00),
(0, 'BMW', '535i', 500000.00),
(0, 'Jaguar', 'VZ', NULL);


SELECT * FROM veiculos;
DESC veiculos;

SELECT COUNT(*) FROM Veiculos;
SELECT COUNT(DISTINCT Marca) FROM Veiculos;
SELECT Marca, Modelo, MIN(Valor) as 'Menor Valor' FROM Veiculos;
SELECT Marca, Modelo, MAX(Valor) as 'Maio Valor' FROM Veiculos;
SELECT AVG(Valor) as 'Valor Médio' FROM Veiculos;
SELECT Marca, AVG(Valor) as 'Valor Médio' FROM Veiculos GROUP BY Marca;
SELECT SUM(Valor) as 'Total' FROM Veiculos;












