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
idPessoaF integer primary key not null,
nome varchar(30) not null,
nif char(9) unique,
morada varchar(100) not null,
telefone char(9) unique,
funcao varchar(20),
salario integer check (salario>0),
idHorario references Horario on update cascade
);
CREATE TABLE PessoaCliente(
idPessoaC integer primary key not null,
nome varchar(30) not null,
nif char(9) unique,
morada varchar(100) not null,
telefone char(9) unique,
dataDeNascimento date not null,
idade integer check (idade >= 14)
);
CREATE TABLE Horario(
idHorario integer primary key not null,
entradaH time,
saidaH time
);
CREATE TABLE Sala(
idSala integer primary key not null,
numLugares integer check (numLugares>=30),
tipoSala varchar(30),
idPessoaF integer references PessoaFuncionario on update cascade
);
CREATE TABLE Sessao(
idSessao integer primary key not null,
inicioH time,
data date,
sala integer references Sala on update cascade,
idFilme integer references Filme on update cascade on delete cascade
);
CREATE TABLE Filme(
idFilme integer primary key not null,
titulo varchar(40) not null,
sinopse varchar(500),
genero varchar(20) not null,
duracao integer,
avaliacao integer check (avaliacao>0 and avaliacao<=5),
classEtaria integer not null
);
CREATE TABLE Publicidade(
idPublicidade integer primary key not null,
tipo varchar(30),
duracao float check (duracao <= 3.0)
);
CREATE TABLE SessaoPublicidade(
idSessao integer references Sessao,
idPublicidade integer references Publicidade
);
CREATE TABLE Patrocinador(
idPatrocinador integer primary key not null,
nomeEmpresa varchar(30),
refBancaria char(25)
);
CREATE TABLE PublicidadePatrocinador(
idPublicidade integer references Publicidade,
idPatrocinador integer references Patrocinador,
valorPago integer check (valorPago > 0)
);
CREATE TABLE Bilhete(
idBilhete integer primary key not null,
preco float,
numLugar integer,
idSessao integer references Sessao on update cascade on delete cascade
);
CREATE TABLE Extras(
idPessoaC char(9) references PessoaCliente on update cascade on delete cascade,
idBilhete integer references Bilhete on update cascade on delete cascade,
comidaSolicitada varchar(50),
oculos3D integer,
primary key(idPessoaC, idBilhete)
);
CREATE TABLE Promocao(
idPessoaC char(9) references PessoaCliente on update cascade on delete cascade,
idBilhete integer references Bilhete on update cascade on delete cascade,
nome varchar(30),
primary key(idBilhete)
);