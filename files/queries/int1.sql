.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create view Estudantes as 
select idPessoaC, nome, idade, nif 
from PessoaCliente 
where idade < 23 ;

create view ExtrasDeEstudantes as 
select Estudantes.idPessoaC, nome, Extras.comidaSolicitada as comidaSolicitada
from Estudantes,Extras 
where Estudantes.idPessoaC = Extras.idPessoaC;

create view EstudantesSemExtras as 
select idPessoaC as id1, nome as n1, comidaSolicitada from ExtrasDeEstudantes where ExtrasDeEstudantes.comidaSolicitada = 'Nenhum';

create view EstudantesComExtras as 
select idPessoaC as id2, nome as n2, comidaSolicitada from ExtrasDeEstudantes where ExtrasDeEstudantes.comidaSolicitada != 'Nenhum';

create view EstudantesQueConsomemExtras as 
select count(EstudantesComExtras.id2) as EstudantesQueConsomemExtras 
from EstudantesComExtras, Estudantes 
where Estudantes.idPessoaC = EstudantesComExtras.id2;

create view EstudantesQueNaoConsomemExtras as 
select count(EstudantesSemExtras.id1) as EstudantesQueNaoConsomemExtras 
from EstudantesSemExtras, Estudantes 
where Estudantes.idPessoaC = EstudantesSemExtras.id1;

create view TotalEstudantes as 
select count(Estudantes.idPessoaC) as Total 
from Estudantes;

select EstudantesQueConsomemExtras, EstudantesQueNaoConsomemExtras, Total from EstudantesQueConsomemExtras, EstudantesQueNaoConsomemExtras, TotalEstudantes;
