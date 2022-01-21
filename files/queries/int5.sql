.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;
create view A 
as 
select PessoaCliente.nome as nomeC, Promocao.nome as nomeP 
from PessoaCLiente, Promocao 
where Promocao.idPessoaC == PessoaCliente.idPessoaC;



select B.nomeP, max(B.numUsos) as numMaxUsos 
from (select A.nomeP, count(A.nomeP) as numUsos 
      from A 
      group by A.nomeP 
      order by numUsos DESC) as B;
