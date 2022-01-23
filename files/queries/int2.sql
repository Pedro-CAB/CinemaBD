.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

select distinct Filme.titulo, Filme.genero, Filme.avaliacao, Filme.classEtaria, count(Bilhete.idBilhete) as bilhetesComprados, sum(Bilhete.preco) as LucroBilhetes, sum(PublicidadePatrocinador.valorPago) as LucroPublicidade, (LucroBilhetes + LucroPublicidade) as LucroTotal 
from Filme,Bilhete,Sessao, SessaoPublicidade, Publicidade, PublicidadePatrocinador 
where Filme.idFilme == Sessao.idFilme and Sessao.idSessao == Bilhete.idSessao and Sessao.idSessao == SessaoPublicidade.idSessao and Publicidade.idPublicidade == SessaoPublicidade.idPublicidade and Publicidade.idPublicidade == PublicidadePatrocinador.idPublicidade 
group by Filme.idFilme 
order by bilhetesComprados DESC;

