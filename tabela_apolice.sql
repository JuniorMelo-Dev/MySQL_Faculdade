create database seguros; 
use seguros;

create table proprietario (
Id int(3) primary key auto_increment,
	Nome varchar(50) not null,
    CPF int(11) not null
);
create table veiculo (
RENAVAN int(15) not null,
	Placa varchar(7) not null,
    Marca varchar(30) not null,
    Modelo varchar(30) not null
);
ALTER TABLE veiculo MODIFY RENAVAN int(15) primary key not null;

create table apolice (
Numero int(3) primary key auto_increment,
	Proprietario_Id int(3),
	veiculo_RENAVAN int(15) not null,
    foreign key (Proprietario_Id) references proprietario (Id),
    foreign key (veiculo_RENAVAN) references veiculo (RENAVAN)
);

select proprietario.nome as 'Segurado', veiculo.placa as 'Placa', apolice.numero from apolice  right join proprietario on apolice.proprietario_id = proprietario.id inner join veiculo on apolice.veiculo_RENAVAN = veiculo.RENAVAN where proprietario.nome = 'Jhonny' order by apolice.numero asc;







