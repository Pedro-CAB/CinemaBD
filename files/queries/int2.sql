.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create view A as 
select distinct Filme.titulo, Filme.genero, Filme.avaliacao, Filme.classEtaria, count(Bilhete.idBilhete) as bilhetesComprados, sum(Bilhete.preco) as LucroBilhetes, sum(PublicidadePatrocinador.valorPago) as LucroPublicidade 
from Filme,Bilhete,Sessao, SessaoPublicidade, Publicidade, PublicidadePatrocinador 
where Filme.idFilme == Sessao.idFilme and Sessao.idSessao == Bilhete.idSessao and Sessao.idSessao == SessaoPublicidade.idSessao and Publicidade.idPublicidade == SessaoPublicidade.idPublicidade and Publicidade.idPublicidade == PublicidadePatrocinador.idPublicidade 
group by Filme.idFilme 
order by bilhetesComprados DESC;

select *, (A.LucroBilhetes + A.LucroPublicidade) as LucroTotal from A;
