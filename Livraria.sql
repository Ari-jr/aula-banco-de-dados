-- Criar o banco de dados da livraria

create database livraria;



-- Usar o banco de dados livraria

use livraria;



-- Criar as tabelas

create table autores (

    id_autor int not null identity(1,1) primary key,

    nome_autor varchar(30) not null,

    sobrenome_autor varchar(30) not null

);



create table editoras (

    id_editora int identity(1,1) primary key,

    nome_editora varchar(30) not null

);



create table livros (

    id_livro int identity(1,1) primary key,

    nome_livro varchar(50),

    isbn int,

    data_puclicacao date,

    preco decimal(5,2),

    id_autor int not null,

    id_editora int not null,



    foreign key (id_autor) references autores (id_autor),

    foreign key (id_editora) references editoras (id_editora)

);

-- Inserir dados em cada tabela



-- Livro: Harry Potter e a Pedra Filosofal

-- Autor: Joanne K. Rowling

-- Editora: Rocco

-- isbn: 123

-- Data Publicação: 2000/04/07

-- Preco: 25.90



-- Livro: A Guerra dos Tronos

-- Autor: George R. R. Martin

-- Editora: LeYa

-- isbn: 456

-- Data Publicação: 1996/08/06

-- Preco: 64.37



-- Livro: Cavaleiro da Armadura Enferrujada

-- Autor: Robert Fisher

-- Editora: Editorial Presenca

-- isbn: 789

-- Data Publicação: 2016/01/01

-- Preco: 107.00



-- Livro: O Leão, a Feiticeira e o Guarda-Roupa

-- Autor: Clive S. Lewis

-- Editora: Editorial Presenca

-- isbn: 321

-- Data Publicação: 1950/10/16

-- Preco: 24.90

insert into autores (nome_autor, sobrenome_autor) values
('Joanne', 'K. Rowling'),
('George', 'R. R. Martin'),
('Robert', 'Fisher'),
('Clive', 'S. Lewis');

insert into editoras (nome_editora) values
('Rocco'),
('LeYa'),
('Editorial Presenca'),
('Editorial Presenca');

insert into livros (nome_livro, isbn, data_puclicacao, preco, id_autor, id_editora) values
('Harry Potter e a Pedra Filosofal', 123, '2000/04/07', 25.90, 1, 1),
('A Guerra dos Tronos', 456, '1996/08/06', 64.37, 2, 2),
('Cavaleiro da Armadura Enferrujada', 789, '2016/01/01', 107.00, 3, 3),
('O Leão, a Feiticeira e o Guarda-Roupa', 321, '1950/10/16', 24.90, 4, 4);

select * from editoras;
select * from autores;
select * from livros;