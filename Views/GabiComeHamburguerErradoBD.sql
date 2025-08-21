Fatec Sorocaba - ADS
Aula Pr�tica de LBD
Prof. Maria Ang�lica C. de Andrade Cardieri
---------------------------------------------------

Preparar o script para a aula - criar o script com as tabelas paciente-consulta-medico (arquivo disponivel no Teams
==========

Uma vis�o � uma tabela l�gica. Ela n�o existe fisicamente.

select text from user_views;
select view_name from user_views;
select * from user_views

1- Vis�o 1
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


2 Vis�o 2
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

3 vis�o 3   => n�o � atualiz�vel pq tem jun��o
==========

create or replace view consulta_pac
as select p.codpaciente, p.nompaciente, c.codconsulta
from paciente p, consulta c
where c.codpaciente = p.codpaciente;

4 vis�o 4   => n�o � atualiz�vel porque tem campos calculados ou derivados
==========

create or replace view salario_liq
as select codmedico, (valconsulta * 0.75) as valorliq, 'medico bom'  as avaliacao
from consulta;

select * from salario_liq;

select valorliq from salario_liq

select codmedico, (valconsulta * 0.75) 
from consulta;


5 vis�o 5          =>  n�o � atualiz�vel
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


ATEN��O:

uma vis�o � atualiz�vel ( permite insert, update e delete) se:

n�o tiver jun��o
n�o tiver group by, having, fun��es (sum, count, max, etc..)
n�o tiver campos calculados

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