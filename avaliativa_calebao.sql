create database suicidio;

use suicidio;
create table suicidios (
    id int auto_increment primary key,
    ano int not null,
    idade int not null,
    sexo char(1) not null,
    estado_id int,
    estado_civil_id int,
    escolaridade_id int,
    causa_id int,

    foreign key (estado_id) references estados(id_estado),
    foreign key (estado_civil_id) references estado_civil(id_estado_civil),
    foreign key (escolaridade_id) references escolaridade(id_escolaridade),
    foreign key (causa_id) references causas(id_causa)
);

create table estados (
    id_estado int auto_increment primary key,
    sigla_estado varchar(2) not null
);

create table estado_civil (
    id_estado_civil int auto_increment primary key,
    estciv varchar(100) not null
);

create table escolaridade (
    id_escolaridade int auto_increment primary key,
    esc varchar(100) not null
);

create table causas (
    id_causa int auto_increment primary key,
    causabas varchar(255),
    causabas_o varchar(255)
);
select * from vw_idade_sexo_estado;


create view vw_idade_sexo_estado as
select idade, sexo, sigla_estado
from suicidios
join estados
on suicidios.estado_id = estados.id_estado;

create view vw_total_suicidios_estado as
select sigla_estado, count(*) as total_casos
from suicidios
join estados
on suicidios.estado_id = estados.id_estado
group by sigla_estado;

create view vw_top10_estados as
select sigla_estado, count(*) as total_casos
from suicidios
join estados
on suicidios.estado_id = estados.id_estado
group by sigla_estado
order by total_casos desc
limit 10;

create view vw_escolaridade as
select esc, count(*) as quantidade
from suicidios
join escolaridade
on suicidios.escolaridade_id = escolaridade.id_escolaridade
group by esc;

create view vw_estado_civil as
select estciv, count(*) as quantidade
from suicidios
join estado_civil
on suicidios.estado_civil_id = estado_civil.id_estado_civil
group by estciv;

create view vw_media_idade_estado as
select sigla_estado, avg(idade) as media_idade
from suicidios
join estados
on suicidios.estado_id = estados.id_estado
group by sigla_estado;

create view vw_relatorio_completo as
select sigla_estado, estciv, esc, causabas, count(*) as quantidade_casos
from suicidios
join estados
on suicidios.estado_id = estados.id_estado
join estado_civil
on suicidios.estado_civil_id = estado_civil.id_estado_civil
join escolaridade
on suicidios.escolaridade_id = escolaridade.id_escolaridade
join causas
on suicidios.causa_id = causas.id_causa
group by sigla_estado, estciv, esc, causabas;

select * from vw_relatorio_completo;
insert into estados (sigla_estado) values
('AC'),
('AL'),
('AM'),
('AP'),
('BA');

insert into estado_civil (estciv) values
('solteiro'),
('casado'),
('viuvo'),
('separado'),
('ignorado');

insert into escolaridade (esc) values
('nenhuma'),
('fundamental'),
('medio'),
('superior'),
('ignorado');

insert into causas (causabas, causabas_o) values
('X700','X700'),
('X720','X720'),
('X780','X780'),
('X800','X800'),
('X810','X810');

insert into suicidios
(ano, idade, sexo, estado_id, estado_civil_id, escolaridade_id, causa_id)
values
(2010, 18, 'M', 1, 1, 2, 1),
(2010, 22, 'F', 2, 2, 3, 2),
(2011, 35, 'M', 3, 1, 3, 3),
(2011, 41, 'M', 4, 2, 2, 1),
(2012, 28, 'F', 5, 1, 4, 2),
(2012, 19, 'M', 1, 1, 2, 3),
(2013, 45, 'M', 2, 3, 1, 1),
(2013, 31, 'F', 3, 2, 3, 2),
(2014, 27, 'M', 4, 1, 2, 3),
(2014, 52, 'F', 5, 4, 1, 1),
(2015, 24, 'M', 1, 1, 3, 2),
(2015, 38, 'F', 2, 2, 4, 3),
(2016, 29, 'M', 3, 1, 2, 1),
(2016, 33, 'F', 4, 2, 3, 2),
(2017, 21, 'M', 5, 1, 2, 3),
(2017, 48, 'M', 1, 2, 1, 1),
(2018, 37, 'F', 2, 3, 3, 2),
(2018, 26, 'M', 3, 1, 2, 3),
(2019, 30, 'F', 4, 2, 4, 1),
(2019, 55, 'M', 5, 4, 1, 2),
(2010, 23, 'M', 1, 1, 2, 3),
(2010, 34, 'F', 2, 2, 3, 1),
(2011, 42, 'M', 3, 3, 1, 2),
(2011, 25, 'F', 4, 1, 4, 3),
(2012, 39, 'M', 5, 2, 2, 1),
(2012, 20, 'F', 1, 1, 3, 2),
(2013, 44, 'M', 2, 2, 1, 3),
(2013, 32, 'F', 3, 3, 4, 1),
(2014, 27, 'M', 4, 1, 2, 2),
(2014, 51, 'F', 5, 4, 1, 3),
(2015, 22, 'M', 1, 1, 2, 1),
(2015, 36, 'F', 2, 2, 3, 2),
(2016, 28, 'M', 3, 1, 4, 3),
(2016, 47, 'F', 4, 3, 1, 1),
(2017, 26, 'M', 5, 1, 2, 2),
(2017, 53, 'M', 1, 2, 1, 3),
(2018, 40, 'F', 2, 3, 3, 1),
(2018, 29, 'M', 3, 1, 2, 2),
(2019, 33, 'F', 4, 2, 4, 3),
(2019, 58, 'M', 5, 4, 1, 1),
(2010, 24, 'M', 1, 1, 2, 2),
(2011, 31, 'F', 2, 2, 3, 3),
(2012, 43, 'M', 3, 3, 1, 1),
(2013, 27, 'F', 4, 1, 4, 2),
(2014, 35, 'M', 5, 2, 2, 3),
(2015, 19, 'F', 1, 1, 3, 1),
(2016, 46, 'M', 2, 2, 1, 2),
(2017, 30, 'F', 3, 3, 4, 3),
(2018, 28, 'M', 4, 1, 2, 1),
(2019, 54, 'F', 5, 4, 1, 2);