DROP TABLE IF EXISTS PessoaFuncionario;
DROP TABLE IF EXISTS PessoaCliente;
DROP TABLE IF EXISTS Horario;
DROP TABLE IF EXISTS Sala;
DROP TABLE IF EXISTS Sessao;
DROP TABLE IF EXISTS Filme;
DROP TABLE IF EXISTS Publicidade;
DROP TABLE IF EXISTS SessaoPublicidade;
DROP TABLE IF EXISTS Patrocinador;
DROP TABLE IF EXISTS PublicidadePatrocinador;
DROP TABLE IF EXISTS Bilhete;
DROP TABLE IF EXISTS Extras;
DROP TABLE IF EXISTS Promocao;
CREATE TABLE PessoaFuncionario(
idPessoaF integer primary key,
nome varchar(30) not null,
nif char(9) unique,
morada varchar(100) not null,
telefone char(9) unique,
funcao varchar(20) not null,
salario integer check (salario>0) not null,
idHorario references Horario on update cascade
);
CREATE TABLE PessoaCliente(
idPessoaC integer primary key,
nome varchar(30) not null,
nif char(9) unique,
morada varchar(100) not null,
telefone char(9) unique,
dataDeNascimento date not null,
idade integer check (idade >= 14)
);
CREATE TABLE Horario(
idHorario integer primary key,
entradaH time not null,
saidaH time not null
);
CREATE TABLE Sala(
idSala integer primary key,
numLugares integer check (numLugares>=30),
tipoSala varchar(30),
idPessoaF integer references PessoaFuncionario on update cascade
);
CREATE TABLE Sessao(
idSessao integer primary key,
inicioH time not null,
data date not null,
sala integer references Sala on update cascade,
idFilme integer references Filme on update cascade on delete cascade
);
CREATE TABLE Filme(
idFilme integer primary key,
titulo varchar(40) not null unique,
sinopse varchar(500),
genero varchar(20) not null,
duracao integer not null,
avaliacao integer check (avaliacao>0 and avaliacao<=5),
classEtaria integer not null
);
CREATE TABLE Publicidade(
idPublicidade integer primary key,
tipo varchar(30) not null,
duracao float check (duracao <= 3.0) not null
);
CREATE TABLE SessaoPublicidade(
idSessaoPublicidade integer primary key,
idSessao integer references Sessao on update cascade on delete cascade,
idPublicidade integer references Publicidade on update cascade on delete cascade
);
CREATE TABLE Patrocinador(
idPatrocinador integer primary key,
nomeEmpresa varchar(30),
refBancaria char(25) not null
);
CREATE TABLE PublicidadePatrocinador(
idPublicidadePatrocinador integer primary key,
idPublicidade integer references Publicidade on update cascade on delete cascade,
idPatrocinador integer references Patrocinador on update cascade on delete cascade,
valorPago float check (valorPago > 0)
);
CREATE TABLE Bilhete(
idBilhete integer primary key,
preco float not null,
numLugar integer not null,
idSessao integer references Sessao on update cascade on delete cascade
);
CREATE TABLE Extras(
idExtras integer primary key,
idPessoaC char(9) references PessoaCliente on update cascade on delete cascade,
idBilhete integer references Bilhete on update cascade on delete cascade,
comidaSolicitada varchar(50) not null,
oculos3D integer not null
);
CREATE TABLE Promocao(
idPromocao integer primary key
idPessoaC char(9) references PessoaCliente on update cascade on delete cascade,
idBilhete integer references Bilhete on update cascade on delete cascade,
nome varchar(30)
);
