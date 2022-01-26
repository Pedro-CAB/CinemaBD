.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger correctHorarios
after insert on Horario
when (new.saidaH-new.entradaH) <> '08:00:00'
begin
update Horario 
set saidaH = time(new.entradaH + '08:00:00') 
where saidaH = time(new.saidaH);
end;
