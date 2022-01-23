.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;
select PessoaFuncionario.funcao, count(PessoaFuncionario.nome) as numFuncionarios, sum(PessoaFuncionario.salario) as Orçamento 
from PessoaFuncionario 
group by PessoaFuncionario.funcao 
order by Orçamento DESC;
