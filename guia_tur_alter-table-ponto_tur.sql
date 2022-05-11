desc ponto_tur;
select * from ponto_tur;

-- Alterar a tabela de Elementos Turísticos, adicionando campos latitude e longitude 
alter table ponto_tur add coordenada point;
insert into ponto_tur (nome, coordenada) values ('Ponte da Amizade', point(1.123456,3.434343));
select *, astext(coordenada) from ponto_tur; /* utilizar esse comando para visualizar dados binarios tipo (BLOB) */

drop table coordenada; /* tabela 'coordenada' excluida e adicionado campo de mesmo nome a tabela 'ponto_tur' */

-- Alterar a tabela 'pais', adicionando nota de 0 a 10 com nível de interesse do cliente
alter table pais add interesse enum('0','1','2','3','4','5','6','7','8','9','10');

-- Alterar a tabela 'cidade', incluindo uma lista com os 3 melhores restaurantes
alter table cidade add melhoresRest varchar(300) default '';