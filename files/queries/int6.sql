.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

CREATE VIEW B AS 
select Bilhete.idSessao as idSessao2,count(Bilhete.idBilhete) as occupiedPlaces 
from Bilhete 
group by idSessao order by occupiedPlaces;

CREATE VIEW S AS 
select Sessao.idSessao, Sessao.sala 
from Sessao;

CREATE VIEW TAB2 AS 
select * from (B join S) 
WHERE B.idSessao2=S.idSessao;

CREATE VIEW TAB3 AS 
select TAB2.idSessao,TAB2.sala,TAB2.occupiedPlaces,Sala.numLugares 
from TAB2,Sala 
WHERE TAB2.Sala=Sala.idSala;

CREATE VIEW TAB4 AS 
select TAB3.idSessao,TAB3.sala,TAB3.numLugares,TAB3.occupiedPlaces,(TAB3.numLugares-TAB3.occupiedPlaces) as vagas 
from TAB3;

CREATE VIEW TAB5 AS 
select TAB4.idSessao,TAB4.sala,Sessao.idFilme,TAB4.numLugares,TAB4.occupiedPlaces,TAB4.vagas 
from TAB4,Sessao 
WHERE TAB4.idSessao=Sessao.idSessao;

CREATE VIEW LOTSESSAO AS 
select TAB5.idSessao,TAB5.sala,Filme.titulo,TAB5.numLugares,TAB5.occupiedPlaces,TAB5.vagas 
from TAB5,Filme 
WHERE TAB5.idFilme=Filme.idFilme;

select * from LOTSESSAO;
