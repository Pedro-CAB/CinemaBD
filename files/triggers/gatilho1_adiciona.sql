.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger checkNewBilhete
after insert on Bilhete
when exists(select * from Bilhete where idSessao = New.idSessao and numLugar = New.numLugar)
begin
update Bilhete
set numLugar = new.numLugar + 1 
where numLugar = new.numLugar;
end;
