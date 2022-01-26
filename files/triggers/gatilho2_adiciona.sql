.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger correctHorarios
before insert on Horario
when (new.saidaH-new.entradaH) <> '08:00:00'
begin
Select raise(ignore);
insert into Horario values (new.idHorario, new.entradaH, (new.entradaH + '08:00:00'));
end;
