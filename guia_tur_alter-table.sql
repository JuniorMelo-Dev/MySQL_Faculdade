create table if not exists linguagemPais (
	id int(11) not null auto_increment primary key,
    codigoPais int(11),
    linguagem varchar(30) not null default '',
    oficial enum('Sim', 'Não') not null default 'Não'
);
select * from linguagempais;
desc linguagempais;

/* Criar integridade referencial entre as tabelas linguagemPais e pais */
alter table linguagempais add constraint FK_linguagemPais foreign key (codigoPais) references pais(id);

/* Modificar o codigoPais para ser obrigatório a inclusão */
alter table linguagempais modify codigoPais int(11) not null;

show create table linguagempais;