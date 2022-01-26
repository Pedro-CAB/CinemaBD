.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger checkNewBilhete
before insert on Bilhete
when exists(select * from Bilhete where idSessao = New.idSessao and numLugar = New.numLugar)
begin
insert into Bilhete values (new.idBilhete, new.preco, new.numLugar + 1, new.idSessao);
end;
