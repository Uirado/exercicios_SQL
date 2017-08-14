drop database unicap_bd2;

create database unicap_bd2;

use unicap_bd2;

create table Departamentos(
	codigo int auto_increment not null,
    nome varchar(20) not null unique,
    localizacao varchar(20),
    codigoFuncionarioGerente int,
    primary key (codigo)
);

create table Funcionarios(
	codigo int auto_increment not null,
    primeiroNome varchar(20) not null,
    segundoNome varchar(20),
    ultimoNome varchar(20) not null,
    dataNasc date,
    cpf char(11) not null unique,
    rg varchar(13) unique,
    endereco varchar(144),
    cep char(8),
    cidade varchar(30),
    fone varchar(15),
    codigoDepartamento int,
    funcao varchar(20),
    salario double,
    primary key(codigo),
    foreign key(codigoDepartamento) references Departamentos(codigo)
);

alter table Departamentos add foreign key (codigoFuncionarioGerente) references Funcionarios(codigo);


-- insert into Funcionarios (primeiroNome, segundoNome, ultimoNome, dataNasc, cpf, rg, endereco, cep, cidade, fone, codigoDepartamento, funcao, salario)
-- values ('Uirá', null, 'Veríssimo', '1989/05/16', '07291237408', '7761778', 'Rua Sete de Setembro, 464 - Boa Vista', '50050030', '81987212344', 'Recife', null, 'Desenvolvedor', 2000);

-- insert into Departamentos (nome, localizacao, codigoFuncionarioGerente) values ('Pessoal', 'Bloco 1', 1);

select * from Funcionarios;

select * from Departamentos;

