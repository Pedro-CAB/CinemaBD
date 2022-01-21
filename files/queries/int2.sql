.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

select distinct Filme.titulo, Filme.genero, Filme.avaliacao, Filme.classEtaria, count(Bilhete.idBilhete) as bilhetesComprados 
from Filme,Bilhete, Sessao 
where Filme.idFilme == Sessao.idFilme and Sessao.idSessao == Bilhete.idSessao 
group by Filme.idFilme 
order by bilhetesComprados DESC;
