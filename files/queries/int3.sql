.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

Create view Pessoas_Publicidades as 
Select count(idBilhete) as numero_bilhetes, SessaoPublicidade.idPublicidade, Publicidade.tipo 
From Bilhete, SessaoPublicidade, Publicidade Where Bilhete.idSessao = SessaoPublicidade.idSessao and SessaoPublicidade.idPublicidade = Publicidade.idPublicidade 
Group by SessaoPublicidade.idPublicidade;

Create view ValorPublicidades as 
Select sum(valorPago) as valor, Publicidade.tipo, PublicidadePatrocinador.idPublicidade 
From PublicidadePatrocinador, SessaoPublicidade, Publicidade 
Where PublicidadePatrocinador.idPublicidade = SessaoPublicidade.idPublicidade and Publicidade.idPublicidade = SessaoPublicidade.idPublicidade 
Group by PublicidadePatrocinador.idPublicidade;

Select sum(ValorPublicidades.valor) as total_publicidade, Patrocinador.nomeEmpresa, Publicidade.tipo, max(ValorPublicidades.valor) as 
maximo_valor_pago, round(max(ValorPublicidades.valor)/sum(ValorPublicidades.valor) *100, 2) as percentagem_max_na_receita, Pessoas_Publicidades.numero_bilhetes 
as assistencia_publicidade_mais_cara 
From PublicidadePatrocinador, Patrocinador, Publicidade, Pessoas_Publicidades, ValorPublicidades 
Where PublicidadePatrocinador.idPatrocinador  =Patrocinador.idPatrocinador and PublicidadePatrocinador.idPublicidade = Publicidade.idPublicidade and 
ValorPublicidades.idPublicidade = Publicidade.idPublicidade and Publicidade.idPublicidade = Pessoas_Publicidades.idPublicidade;
