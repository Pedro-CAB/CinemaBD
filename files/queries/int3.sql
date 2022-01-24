.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

Create view Pessoas_Publicidades as 
Select count(idBilhete) as numero_bilhetes, SessaoPublicidade.idPublicidade, Publicidade.tipo 
From Bilhete, SessaoPublicidade, Publicidade Where Bilhete.idSessao = SessaoPublicidade.idSessao and SessaoPublicidade.idPublicidade = Publicidade.idPublicidade 
Group by SessaoPublicidade.idPublicidade;

Select sum(valorPago) as total_publicidade, Patrocinador.nomeEmpresa, Publicidade.tipo, max(valorPago) as maximo_valor_pago, round(max(valorPago)/sum(valorPago) * 100, 2) 
as percentagem_receita, Pessoas_Publicidades.numero_bilhetes as pessoas_assistem_publicidade_cara
From PublicidadePatrocinador, Patrocinador, Publicidade, Pessoas_Publicidades 
Where PublicidadePatrocinador.idPatrocinador = Patrocinador.idPatrocinador and PublicidadePatrocinador.idPublicidade = Publicidade.idPublicidade 
and Publicidade.idPublicidade = Pessoas_Publicidades.idPublicidade;
