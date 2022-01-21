.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create view oculosComprados
as 
select distinct PessoaCliente.nome, Extras.oculos3D 
from PessoaCliente, Extras 
where Extras.idPessoaC == PessoaCliente.idPessoaC;

