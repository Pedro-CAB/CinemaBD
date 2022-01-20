.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

Select sum(valorPago) as total_publicidade
From PublicidadePatrocinador;
