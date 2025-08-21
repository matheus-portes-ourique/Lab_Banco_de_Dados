Fatec Sorocaba - ADS
Aula Prática de LBD
Prof. Maria Angélica C. de Andrade Cardieri
---------------------------------------------------

Preparar o script para a aula - criar o script com as tabelas paciente-consulta-medico (arquivo disponivel no Teams
==========

Uma visão é uma tabela lógica. Ela não existe fisicamente.

select text from user_views;
select view_name from user_views;
select * from user_views

1- Visão 1
===========
create or replace view pacsor
as select * from paciente 
where cidade = 'Sorocaba'
with check option;

select * from pacsor;

select * from paciente;

insert into pacsor
values (77,'Roberto souza',sysdate,'M','rua','Sorocaba','S');

insert into pacsor values (61,'Maria',sysdate,'F','rua x','itu','S');

update pacsor
 set nompaciente = 'Carlos Souza'
where codpaciente = 10;

select * from paciente

update pacsor
set nompaciente = 'DDDD'
where codpaciente = 61;

delete pacsor
where codpaciente = 61;

update pacsor
 set cidpaciente = 'KKKKK'
where codpaciente = 7;


2 Visão 2
===========

create or replace view pacsor_res
as select codpaciente,nompaciente,datanasc as data_nascimento, sexo
from pacsor;


insert into pacsor_res(codpaciente,nompaciente,data_nascimento,sexo)
values (49,'Ana',sysdate,'F');

update pacsor_res
 set nompaciente = 'KKKKK'
where codpaciente = 7;

select * from paciente;

update pacsor_res
 set cidpaciente = 'KKKKK'
where codpaciente = 7;

delete pacsor_res
where 

3 visão 3   => não é atualizável pq tem junção
==========

create or replace view consulta_pac
as select p.codpaciente, p.nompaciente, c.codconsulta
from paciente p, consulta c
where c.codpaciente = p.codpaciente;

4 visão 4   => não é atualizável porque tem campos calculados ou derivados
==========

create or replace view salario_liq
as select codmedico, (valconsulta * 0.75) as valorliq, 'medico bom'  as avaliacao
from consulta;

select * from salario_liq;

select valorliq from salario_liq

select codmedico, (valconsulta * 0.75) 
from consulta;


5 visão 5          =>  não é atualizável
============

create or replace view totalmed
as select codmedico, count(*) as totalconsultas
from consulta
group by codmedico;


select * from totalmed;

update pacsor_res
set data_nascimento = sysdate
where codpaciente = 5;

create view salario_liq
as select codmedico, (valconsulta * 0.75) as totliq
from consulta;


create view V_paciente
as select codpaciente, nompaciente from paciente;


ATENÇÃO:

uma visão é atualizável ( permite insert, update e delete) se:

não tiver junção
não tiver group by, having, funções (sum, count, max, etc..)
não tiver campos calculados

------------------------------------------------------------------------------



create or replace view trinta_dias
as select codmedico, codpaciente, dataconsulta, (dataconsulta + 30) as trinta_dias
from consulta;
select * from trinta_dias;

select * from user_views;

create or replace view v_sor
as select view_name from user_views
where view_name like '%SOR%';

select * from v_sor;

select avg(valconsulta) from consulta;

select * from consulta 
where valconsulta >= 270.15;

select * from consulta
where valconsulta >= (select avg(valconsulta) from consulta);