.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create view A as 
select distinct Sala.idSala as numSala, Sala.tipoSala as tipo,  Sala.idPessoaF, PessoaFuncionario.nome as funcionarioResponsavel 
from Sala, PessoaFuncionario, Horario 
where Sala.idPessoaF = PessoaFuncionario.idPessoaF and PessoaFuncionario.idHorario = Horario.idHorario and Horario.entradaH <= '17:00:00' and Horario.saidaH >= '17:00:00';

create view B as 
select distinct numSala, tipo, funcionarioResponsavel, Filme.titulo 
from A, Sessao, Filme 
where A.numSala = Sessao.sala and Sessao.idFilme = Filme.idFilme and Sessao.inicioH < '17:00:00';
