.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create view oculosComprados
as 
select distinct PessoaCliente.nome, Extras.oculos3D 
from PessoaCliente, Extras 
where Extras.idPessoaC == PessoaCliente.idPessoaC;

/*
Select sum(oculos3D), Sessao.data From Extras, Bilhete, Sessao Where (Select data From Sessao, Bilhete Where Bilhete.idSessao = Sessao.idSessao) and 
Extras.idBilhete = Bilhete.idBilhete and Bilhete.idSessao = Sessao.idSessao Group by Sessao.data;
*/
