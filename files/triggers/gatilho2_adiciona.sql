.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger compareHorarios
before insert on Horario
when exists(select * from Horario where Horario.entradaH = new.entradaH and Horario.saidaH = new.saidaH)
begin
select raise(abort,'Esse horário já existe.');
end;
