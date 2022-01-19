.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;
select B.nomeP, max(B.numUsos) as numMaxUsos 
from (select A.nomeP, count(A.nomeP) as numUsos 
      from (select PessoaCliente.nome as nomeC, Promocao.nome as nomeP 
            from PessoaCliente, Promocao
            where Promocao.idPessoaC == PessoaCliente.idPessoaC) as A 
      group by A.nomeP 
      order by numUsos DESC) as B;
