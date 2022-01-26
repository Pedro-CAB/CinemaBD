.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger correctHorarios
after insert on Horario
when (time(new.saidaH-new.entradaH)) <> time('08:00:00')
begin
update Horario 
set saidaH = time(new.entradaH) + time('08:00:00')
where saidaH = time(new.saidaH);
end;
