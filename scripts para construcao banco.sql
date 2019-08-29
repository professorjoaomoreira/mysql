create database prova;
use prova;
drop database prova;
show databases;
show table cidade;
use prova;

CREATE TABLE fornecedor (
codigo_forn integer(10) PRIMARY KEY,
razao_forn varchar(50),
nome_forn varchar(50),
cnpj integer (20),
telefone integer(11),
codigo_cid integer(10)
);

CREATE TABLE produto (
cod_prod integer(10) PRIMARY KEY,
Desc_prod integer(10),
Valor_unit_prod float(2.4)
);

CREATE TABLE cliente (
nomeSoci_cli varchar(50),
nomeReal_cli varchar(50),
cod_cli integer(10) PRIMARY KEY,
cpf_cli integer(10),
codigo_cid integer(10)
);

CREATE TABLE estado (
nomeEstado varchar(50),
sigla varchar(2),
codigo_Estado integer(10) PRIMARY KEY
);

CREATE TABLE cidade (
nome_cid varchar(50),
codigo_cid integer(10) PRIMARY KEY,
populacao_cid integer(10),
codigo_Estado integer(10),
FOREIGN KEY(codigo_Estado) REFERENCES estado (codigo_Estado)
);

CREATE TABLE fornece (
cod_prod integer(10),
codigo_forn integer(10),
FOREIGN KEY(cod_prod) REFERENCES produto (cod_prod),
FOREIGN KEY(codigo_forn) REFERENCES fornecedor (codigo_forn)
);

ALTER TABLE fornecedor ADD FOREIGN KEY(codigo_cid) REFERENCES cidade (codigo_cid);

ALTER TABLE cliente ADD FOREIGN KEY(codigo_cid) REFERENCES cidade (codigo_cid);
/*xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

trabalho joazinho*/

/*a.	Varchar para textos
b.	Integer para números inteiros
c.	Float para números com vírgula*/

create database bdtrabalho;
show databases;
use bdtrabalho;

create table estado
(
  codigo_estado integer auto_increment not null primary key,
  Nome varchar(35) not null,
  Sigla varchar(3)
);
describe estado;

create table cidade
(
  codigo_cidade integer auto_increment not null primary key,
  nome varchar(35) not null,
  populacao float,
  codigo_estado integer not null,
  constraint fk_estado_cidade
  foreign key(codigo_estado)
  references estado(codigo_estado)
);
describe cidade;
create table cliente
(
  codigo_cliente integer auto_increment not null primary key,
  nome_social varchar(35) not null,
  nome_real varchar(35)not null,
  CPF integer,
  codigo_cidade integer not null,
  constraint fk_cidade_cliente
  foreign key(codigo_cidade)
  references cidade(codigo_cidade)
);
describe cliente;

create table fornecedor
(
  codigo_fornecedor integer auto_increment not null primary key,
  razao_social varchar(35) not null,
  nome_fantasia varchar(35)not null,
  CNPJ integer,
  telefone integer,
  codigo_cidade integer not null,
  constraint fk_cidade_fornecedor
  foreign key(codigo_cidade)
  references cidade(codigo_cidade)
);

describe fornecedor;

create table produto
(
  codigo_produto integer auto_increment not null primary key,
  descricao varchar(35) not null,
  valor_unitario float
);

describe fornecedor;

create table fornece
(
codigo_fornecedor integer,
codigo_produto integer,
foreign key (codigo_fornecedor) references fornecedor(codigo_fornecedor),
foreign key (codigo_produto) references produto(codigo_produto)
);

describe fornece;

INSERT INTO estado
(
Nome,
sigla
)
VALUES
("rio grande do sul","rs");

select * from estado;

INSERT INTO cidade
(
nome,
populacao,
codigo_estado
)
VALUES
("porto alegre",2,1);
select * from cidade;

INSERT INTO cliente
(
nome_social,
nome_real,
CPF,
codigo_cidade
)
VALUES
("lucas monteiro1","lucas luiz monteiro2",1234567891,3),
("lucas monteiro2","lucas luiz monteiro3",1234567892,4),
("lucas monteiro3","lucas luiz monteiro4",1234567893,5),
("lucas monteiro4","lucas luiz monteiro5",1234567894,6);


INSERT INTO cliente
(
nome_social,
nome_real,
CPF,
codigo_cidade
)
VALUES
("lucas monteiro7","lucas luiz monteiro8",1234567895,7);

describe cliente;
select * from cliente;

INSERT INTO fornecedor
(
razao_social,
nome_fantasia,
CNPJ,
telefone,
codigo_cidade
)
VALUES
("lucas monteiro","sao jorge",123456789,123456789,1);
describe fornecedor;
select * from fornecedor;

INSERT INTO produto
(
descricao,
valor_unitario
)
VALUES
("upaupaupahe",5.68);
describe produto;
select * from produto;

INSERT INTO fornece
(
codigo_fornecedor,
codigo_produto
)
VALUES
(1,1),
(2,2),
(3,3),
(4,4);


describe fornece;
select * from fornece;

/*xxxxxxxxxxxxxxxxxxxxxxxxx*/
create database cadastro;
create table pessoas(
nome varchar(30),
idade tinyint,
sexo char(1),
peso float,
altura float,
nacionalidade varchar (30));

describe pessoas;

create database cadastro2
default character set utf8
default collate utf8_general_ci;
use cadastro2;
create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(5,2),
nacionalidade varchar(20) default 'Brasil',
primary key (id)
) default charset = utf8;
describe pessoas;
/*--inserir dados na tabela pessoas--*/
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('1','godofredo','1984-01-02','M','78.5','1.83','Brasl');
select * from pessoas;
/*inserindo agora usando o autoincrement, ou seja não entrei com 
o comando id e mesmo assim ele colocou*/
INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('joaomoreira','1984-01-02','M','78.5','1.83','Brasl');
select * from pessoas;

/*agora usando o comando default*/
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT,'JULIETA','1984-01-02','M','78.5','1.83',DEFAULT),
(DEFAULT,'MARIA','1984-01-02','M','78.5','1.83',DEFAULT);
select * from pessoas;

/*agora encurtando o código*/
INSERT INTO pessoas VALUES
(DEFAULT,'edson','1984-01-02','M','78.5','1.83',DEFAULT),
(DEFAULT,'jorge','1984-01-02','M','78.5','1.83','portugal');
select * from pessoas;
/*ddl, data definition language, são comandos de definição
create database
create table
DML, Data manipulation language, 
insert into*/

/*describe e ou desc é a mesma coisa*/
desc pessoas;
/*alterando uma tabela com o comando alter
e com add column*/
alter table pessoas
add column profissao varchar(10);
desc pessoas;
/*agora eliminar uma coluna com 
drop column*/

alter table pessoas
drop column profissao;
desc pessoas;
/*colocando um campo na ordem que eu quiser*/
alter table pessoas
add column profissao varchar(10) after nome;
select * from pessoas;
desc pessoas;
/*colocando um campo antes do outro*/
alter table pessoas
drop column nome;

alter table pessoas
add column nome int FIRST;

desc pessoas;
select * from pessoas;
/*modify muda o tipo do dado*/
alter table pessoas
modify column profissao varchar(50);
modify column profissao varchar(20) not null default '';
 
/*como modificar o nome da coluna*/
alter table pessoas
change column profissao prof varchar(20);
change column profissao prof varchar(20) not null default '';
desc pessoas;
select * from pessoas;
/* modify para modificar coluna
change que para modificar coluna
rename to para modificar o nome da tabela*/
alter table pessoas
rename to gafanhotos;
desc gafanhotos;
select * from gafanhotos;
/*CREATE TABLE IF NOT EXISTS
verificar se existe e então criar
unique não repitir
text =  texto grande
unsigned = sem sinal
DEFAULT = colocar como padrãoptimize
utf8 = permitir texto acentuados
*/
CREATE TABLE IF NOT EXISTS cursos( 
nome varchar(30) NOT NULL UNIQUE,
descricao text,
carga int UNSIGNED,
totaulas int,
ano year DEFAULT '2016'
)DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS cursos1( 
nome varchar(30));
desc cursos1;
select * from cursos;
desc cursos;
/*se esqueci como faz um comando procuro 
https://www.w3schools.com/
*/
/*se eu esqueci de criar chave primaria posso resolver*/
alter table cursos
add column idcurso int FIRST;
desc cursos;

ALTER TABLE cursos
ADD PRIMARY KEY(idcurso);
desc cursos;

/* comando para apagar a tabela é o drop table*/
/*vou criar uma tabela inserir dados e apaga-la*/
create table if not exists teste(
id int,
nome varchar(10),
idade int
);
insert into teste value
('1','pedro','22'),
('2','maria','22'),
('3','maricota','77');

select * from teste;
desc teste;
drop table if exists teste;
show tables;
show databases;

/*DDL = 
CREATE DATABASE
CREATE TABLE
ALTER TABLE
DROP TABLE

DML =
INSERT INTO
*/
select * from gafanhotos;
select * from cursos;
desc cursos;
INSERT INTO cursos VALUES
('11','joao11','texto grande','10','2','2017'),
('2','Marco','texto grande','10','2','2017'),
('3','joao1','texto grande','10','2','2017'),
('4','joao2','texto grande','10 ','2','2000'),
('5','joao3','texto grande','10','2','2017'),
('6','joao4','texto grande','10','2','2017'),
('7','joao5','texto grande','10','2','2021'),
('8','joao6','texto grande','10','2','2017'),
('9','joao7','texto grande','10','2','2017'),
('10','joao8','texto grande','10','2','2020');
/* update cursos set nome = 'html5' where idcurso = '1';
atualize  a tabela cursos configurando para html5 onde o id curos é 1
*/

update cursos
set nome = 'HTML5'
where idcurso = '1';

update cursos
set descricao = 'curso para fazer sites'
where idcurso = '1';

update cursos
set nome = 'PHP', ano = '2015'
where idcurso = '4';

update cursos
set nome = 'JAVA', carga = '40', ano = '2020'
where idcurso = '5'
LIMIT 1;
select * from cursos;

delete from cursos
where idcurso = '2'
limit 2;
select * from cursos;
/*DDL = 
CREATE DATABASE
CREATE TABLE
ALTER TABLE
DROP TABLE

DML = 
INSERT INTO
UPDATE
DELETE
TRUNCATE
*/
USE cadastro2;
select * from cursos;
select * from gafanhotos;
desc gafanhotos;
desc cursos;






























 
 

















































