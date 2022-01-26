.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;
create trigger checkIdCliente
before insert on PessoaCliente
when exists ( select * from PessoaCliente where PessoaCliente.idPessoaC = new.idPessoaC)
begin
insert into PessoaCliente values(max(PessoaCliente.idPessoaC)+1, new.nome, new.nif, new.morada , new.telefone, new.dataDeNascimento, new.idade);
end;
