CREATE TABLE Enfermeiro (
Coren INT PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
);
INSERT INTO Enfermeiro VALUES
(11111, 'Enfermeiro 1'),
(22222, 'Enfermeiro 2'),
(33333, 'Enfermeiro 3');
SELECT * FROM enfermeiro;

CREATE TABLE Paciente (
Num INT PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
);
INSERT Paciente VALUES
(1000, 'Paciente A'),
(1001, 'Paciente B'),
(1002, 'Paciente C'),
(1003, 'Paciente D'),
(1004, 'Paciente E'),
(1005, 'Paciente F'),
(1006, 'Paciente G'),
(1007, 'Paciente H'),
(1008, 'Paciente I');
SELECT * FROM Paciente;

CREATE TABLE Remedio (
Cod INT PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
);
INSERT Remedio VALUES
(100, 'Controle de pressão'),
(101, 'Problema no estomago'),
(102, 'Soro'),
(103, 'Calmante'),
(104, 'Analgésico'),
(105, 'Rins');
SELECT * FROM Remedio;

CREATE TABLE Medicacao (
Id INT PRIMARY KEY AUTO_INCREMENT,
	Data DATE NOT NULL,
    Hora TIME NOT NULL,
    Paciente_Num INT NOT NULL,
    Remedio_Cod INT NOT NULL,
    Enfermeiro_Coren INT NOT NULL,
    FOREIGN KEY (Paciente_Num) REFERENCES Paciente (Num),
    FOREIGN KEY (Remedio_Cod) REFERENCES Remedio (Cod),
    FOREIGN KEY (Enfermeiro_Coren) REFERENCES Enfermeiro (Coren)
);
INSERT Medicacao VALUES
(0, current_date, '05:00:00', 1003, 104, 11111),
(0, current_date, '08:00:00', 1001, 100, 11111),
(0, current_date, '08:20:00', 1007, 102, 11111),
(0, current_date, '08:30:00', 1007, 105, 11111),
(0, current_date, '09:00:00', 1004, 104, 22222),
(0, current_date, '09:30:00', 1005, 105, 33333),
(0, current_date, '10:20:00', 1001, 103, 11111),
(0, current_date, '12:00:00', 1008, 102, 22222),
(0, current_date, '12:20:00', 1002, 105, 22222),
(0, current_date, '13:30:00', 1001, 100, 11111),
(0, current_date, '15:00:00', 1003, 104, 22222),
(0, current_date, '16:00:00', 1001, 103, 11111),
(0, current_date, '20:30:00', 1008, 100, 22222),
(0, current_date, '21:00:00', 1002, 105, 11111),
(0, current_date, '21:10:00', 1006, 102, 11111),
(0, current_date, '23:00:00', 1003, 104, 33333);

SELECT Medicacao.Id AS 'Registro', Medicacao.Data, Medicacao.Hora, Paciente.Nome AS 'Paciente', Remedio.Nome AS 'Medicação', Enfermeiro.Nome AS 'Enfermeiro'
FROM Medicacao 
INNER JOIN Paciente ON Medicacao.Paciente_Num = Paciente.Num
INNER JOIN Remedio ON Medicacao.Remedio_Cod = Remedio.Cod
INNER JOIN Enfermeiro ON Medicacao.Enfermeiro_Coren = Enfermeiro.Coren
ORDER BY Medicacao.Id ASC;






























