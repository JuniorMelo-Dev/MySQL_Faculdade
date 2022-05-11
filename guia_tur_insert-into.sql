show tables from guiatur;  /* mostra todas tabelas no banco de dados */

insert into pais (nome, continente, codigo) values
('Brasil', 'América', 'BRA'),
('Índia', 'Ásia', 'IDN'),
('Japão', 'Ásia', 'JPN');
select * from pais;

/* Alterando o 'pais' 2 (Índia) para ter o 'codigo' (IND) */
update pais set codigo = 'IND' where id = 2;

insert into estado (nome, sigla) values
('Maranhão', 'MA'),
('São Paulo', 'SP'),
('Santa Catarina', 'SC'),
('Rio de Janeiro', 'RJ');
select * from estado;

insert into cidade (nome, populacao) values
('Sorocaba', 700000),
('Déli', 26000000),
('Xangai', 22000000),
('Tóquio', 38000000);
select * from cidade;

/* Deletando a primeira cidade */
delete from cidade where id = 1;

insert into ponto_tur (nome, tipo) values
('Quinzinho de Barros', 'Instituição'),
('Parque Estadual do Jalapão', 'Atrativo'),
('Torre Eiffel', 'Atrativo'),
('Fogo de Chão', 'Serviço');
select * from ponto_tur;

/* Alterando o ponto turistico 1 para 'Atrativo' */
update ponto_tur set tipo = 'Atrativo' where id = 1;

