.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

select * from Horario;
insert into Horario values (10, '08:00:00', '16:00:00');
select * from Horario;
