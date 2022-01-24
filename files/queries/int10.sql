.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

CREATE VIEW TAB1 AS
select Bilhete.idSessao,sum(preco) as LucroDosBilhetes
FROM Bilhete
GROUP BY Bilhete.idSessao;

CREATE VIEW TAB2 AS
select TAB1.idSessao,TAB1.LucroDosBilhetes,Sessao.sala
FROM TAB1,Sessao
WHERE TAB1.idSessao = Sessao.idSessao
ORDER BY TAB1.LucroDosBilhetes ASC;

CREATE VIEW TAB3 AS
select TAB2.idSessao,TAB2.LucroDosBilhetes,Sala.idPessoaF
FROM TAB2,Sala
WHERE (TAB2.sala = Sala.idSala);

CREATE VIEW TAB4 AS
select TAB3.idSessao,TAB3.LucroDosBilhetes,PessoaFuncionario.salario,PessoaFuncionario.idHorario
FROM TAB3,PessoaFuncionario
WHERE (TAB3.idPessoaF = PessoaFuncionario.idPessoaF);

CREATE VIEW TAB5 AS
select TAB4.idSessao,TAB4.LucroDosBilhetes,TAB4.salario,SUBSTRING(Horario.entradaH,1,2) as horaEntrada,SUBSTRING(Horario.saidaH,1,2) as horaSaida
FROM TAB4,Horario
WHERE (TAB4.idHorario = Horario.idHorario);

CREATE VIEW TAB6 AS
select TAB5.idSessao,TAB5.LucroDosBilhetes,TAB5.salario,TAB5.horaEntrada,TAB5.horaSaida,Sessao.idFilme
FROM TAB5,Sessao
WHERE (TAB5.idSessao = Sessao.idSessao);

CREATE VIEW TAB7 AS
select TAB6.idSessao,TAB6.LucroDosBilhetes,TAB6.salario,TAB6.horaEntrada,TAB6.horaSaida,Filme.duracao
FROM TAB6,Filme
WHERE (TAB6.idFilme = Filme.idFilme);

CREATE VIEW TAB8 AS
select TAB7.idSessao,TAB7.LucroDosBilhetes,TAB7.salario,(TAB7.horaSaida-TAB7.horaEntrada) as horasTrabalhadas,TAB7.duracao
FROM TAB7;

CREATE VIEW TAB9 AS
select TAB8.idSessao,TAB8.LucroDosBilhetes,round(( (TAB8.salario*TAB8.duracao) / (31*TAB8.horasTrabalhadas*60) ),2) as custoFuncionario
FROM TAB8;

CREATE VIEW calculateGain AS
select TAB9.idSessao,TAB9.LucroDosBilhetes,TAB9.custoFuncionario,(TAB9.LucroDosBilhetes-TAB9.custoFuncionario) as LucroSessao
FROM TAB9
ORDER BY LucroSessao ASC;
