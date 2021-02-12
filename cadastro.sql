create database	cadastro
default character set utf8
default collate utf8_general_ci;


create table funcionarios (
id int not null auto_increment,
nome varchar(30),
nascimento date,
sexo enum ('M' , 'F'),
nascionalidade varchar(20),
salario decimal (5,2),
cargo varchar(15),
primary key (id)
);




