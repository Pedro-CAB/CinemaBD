.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

Select nome, funcao
From PessoaFuncionario, Horario
Where (PessoaFuncionario.idHorario = Horario.idHorario and entradaH <= '18:00:00' and saidaH >= '18:00:00')
Order by nome asc;
