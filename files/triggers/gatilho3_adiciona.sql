.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger checkSessao
before insert on Sessao
when exists (select * from Sessao where inicioH = new.inicioH and data = new.data and sala = new.sala)
begin
select raise(abort,'Sala já ocupada com outra sessão. Por favor, selecione outra hora.');
end;
