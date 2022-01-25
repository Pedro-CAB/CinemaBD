.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger checkNewBilhete
before insert on Bilhete
when exists(select * from Bilhete where idSessao = New.idSessao and numLugar = New.numLugar)
begin
select raise(abort,'Lugar Ocupado. Por favor, selecione outro.');
end;
