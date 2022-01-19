.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;
select nome, idade, nif
from PessoaCliente
where idade<23
order by nome ASC;
