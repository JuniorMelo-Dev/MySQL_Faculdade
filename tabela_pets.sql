-- Banco de dados para auxilio no gerenciamento das hospedagens, criando-se um filtro que retorne o número da hospedagem (como 'Registro'), o nome do animal (como 'Pet'), o nome do respectivo dono (como 'Proprietário') e o nome do cuidador ('Cuidador'). A seleção deve ser exibida em ordem crescente pelo nome do Pet.

CREATE DATABASE pets;

CREATE TABLE pet (
Id INT(3) PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Raca VARCHAR(50) NOT NULL
);
CREATE TABLE dono (
Cod INT(3) PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
    Pet_Id INT(3) NOT NULL,
    FOREIGN KEY (Pet_Id) REFERENCES pet(Id)
);
CREATE TABLE cuidador (
Codigo INT(3) PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
    Telefone INT(10) NOT NULL
);
CREATE TABLE hospedagem (
Num INT(3) PRIMARY KEY AUTO_INCREMENT,
	Pet_Id INT(3) NOT NULL,
    Cuidador_Codigo INT(3) NOT NULL,
    FOREIGN KEY (Pet_Id) REFERENCES pet(Id),
    FOREIGN KEY (Cuidador_Codigo) REFERENCES Cuidador(Codigo)
);

SELECT hospedagem.num as 'Registro', pet.nome as 'Pet', dono.nome as 'Proprietário', cuidador.nome as 'Cuidador' FROM hospedagem INNER JOIN pet on hospedagem.pet_id = pet.id INNER JOIN dono on dono.pet_id = pet.id INNER JOIN cuidador on hospedagem.Cuidador_Codigo = cuidador.codigo ORDER BY pet.nome;


