.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

 create view oculosComprados as
        select distinct Extras.idBilhete, Extras.oculos3D
        from Extras;

Select sum(oculos3D) as numero_oculos_por_dia, Sessao.data 
From Extras, Bilhete, Sessao 
Where (Select data 
       From Sessao, Bilhete 
       Where Bilhete.idSessao = Sessao.idSessao) and Extras.idBilhete = Bilhete.idBilhete and Bilhete.idSessao = Sessao.idSessao 
Group by Sessao.data;
