.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

CREATE VIEW TAB1 AS
select idPessoaF,nome,funcao,PessoaFuncionario.idHorario
from PessoaFuncionario, Horario
WHERE (PessoaFuncionario.idHorario = Horario.idHorario and entradaH <= '18:00:00' and saidaH >= '18:00:00');

CREATE VIEW TAB2 AS
select TAB1.idPessoaF,TAB1.nome,TAB1.funcao,Horario.entradaH,Horario.saidaH
from TAB1,Horario
WHERE (TAB1.idHorario = Horario.idHorario);

CREATE VIEW TAB3 AS
select TAB2.idPessoaF,TAB2.nome,TAB2.funcao,SUBSTRING(TAB2.entradaH,1,2) as horaEntrada,SUBSTRING(TAB2.saidaH,1,2) as horaSaida
from TAB2;

CREATE VIEW TAB4 AS
select TAB3.nome,TAB3.funcao,(18 - TAB3.horaEntrada) as horasTrabalhadas
from TAB3
ORDER BY TAB3.nome ASC;
