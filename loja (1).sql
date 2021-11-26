-- Criar o banco de dados.
create database loja;

use loja;

-- phpmyadmim 
create table cliente (
    id_cli int identity(1,1) PRIMARY KEY,
    nome_cli varchar(40) not null,
    endereco_cli varchar(40),
    cidade_cli varchar(30),
    cep_cli varchar(8),
    uf_cli varchar(2)
);

create table vendedor (
    id_vendedor int identity(1,1) primary key, -- Sql server identity(1, 1)
    nome_vend varchar(40),
    salario decimal(10,2),
    comissao decimal(10,2)
);

create table pedido (
    num_pedido int identity(1,1) primary key, -- Sql server identity(1, 1)
    id_cli int,
    id_vendedor int,
    prazo_entrega date,
    data_pedido datetime not null DEFAULT current_timestamp,

    foreign key (id_cli) references cliente (id_cli),
    foreign key (id_vendedor) references vendedor (id_vendedor)
);

create table produto (
    id_produto int identity(1,1) primary key, -- Sql server identity(1, 1)
    unidade varchar(4),
    descricao varchar(100),
    val_unit decimal(10, 2)
);

create table itens_pedido (
    id_item_pedido int primary key identity(1,1), -- Sql server identity(1, 1)
    fk_num_pedido int,
    fk_id_produto int,
    quantidade int,

    foreign key (fk_num_pedido) references pedido (num_pedido),
    foreign key (fk_id_produto) references produto (id_produto)
);


-- Adicionar coluna na tabela
Alter table pedido add quantidade int null;
-- Apagar coluna na tabela.
Alter table pedido drop column quantidade;

-- Inserir os dados 
insert into cliente (nome_cli, endereco_cli, cidade_cli, cep_cli, uf_cli) values
('Amanda Silva', 'Rua A', 'Campinas', '08700023', 'SP'),
('Andre Fonseca', 'Rua B', 'Rio de janeiro', '08700124', 'RJ'),
('João Antonio', 'Rua C', 'São Paulo', '08700125', 'SP'),
('Bernadete Oliveira', 'Rua D', 'Suzano', '08700126', 'SP'),
('Carlos Soares', 'Rua E', 'Salvador', '08700126', 'BA');

insert into vendedor (nome_vend, salario, comissao) values
('Eleuterio Quispe', '3500.00', '20.00'),
('Ramiro Da Silva', '2500.00', '10.00'),
('Camilo Cesto', '1500.00', '15.00'),
('Ricardo Arjona', '4500.00', '5.00'),
('Fidel Castro', '4500.00', '5.00');

insert into produto (unidade, descricao, val_unit) values
('un', 'notebook', 35000.00),
('kg', 'Silicone', 50.00),
('un', 'Caixa de som', 500.00),
('pct', 'Cabo de red', 150.00),
('ml', 'Tinta de impressora', 10.00);

insert into pedido (id_cli, id_vendedor, prazo_entrega) values
(3, 2, '2021/10/15'), 
(2, 2, '2021-10-24'),
(2, 3, '2021-10-22'),
(4, 3, '2021-10-28'),
(5, 4, '2021-10-29');

insert into itens_pedido (fk_num_pedido, fk_id_produto, quantidade) values
(1, 3, 2),
(2, 4, 1),
(3, 1, 1),
(4, 2, 2),
(5, 5, 500);



-- Quantidade de vendedores na tabela vendedores.
select count(*) as quantidade_de_vendedor from vendedor;

-- Buscar o cliente da cidade de São Paulo.
select * from cliente where cidade_cli = 'São Paulo';
-- ou
select * from cliente where cidade_cli in('São Paulo');

-- Buscar o cliente com o nome que inicia na letra "B"
select * from cliente where nome_cli like '%Silva%';


-- selecionar colunas da tabela
select *
-- tabela com os relacionamentos (Foreign Key)
from pedido
-- segunda tabela
inner join cliente
on pedido.id_cli = cliente.id_cli
-- terceiro tabela
inner join vendedor
on pedido.id_vendedor = vendedor.id_vendedor;


-- Mostrar o cliente, o vendedor e prazo de entrega
select c.nome_cli, v.nome_vend, p.prazo_entrega
-- tabela com os relacionamentos (Foreign Key)
from pedido as p
-- segunda tabela
inner join cliente as c
on p.id_cli = c.id_cli
-- terceiro tabela
inner join vendedor as v
on p.id_vendedor = v.id_vendedor
-- mostrar de ordem crescente
order by p.prazo_entrega asc; -- ou para decrescente: order by p.prazo_entrega desc;


-- Mostrar o cliente, o vendedor e prazo de entrega
select c.nome_cli, v.nome_vend, p.prazo_entrega
-- tabela com os relacionamentos (Foreign Key)
from pedido as p
-- segunda tabela
inner join cliente as c
on p.id_cli = c.id_cli
-- terceiro tabela
inner join vendedor as v
on p.id_vendedor = v.id_vendedor
-- mostrar uma condição
where c.nome_cli = 'Andre Fonseca' and prazo_entrega >= '2021-10-23';


-- codigo SQL usados para CRUD insert, select, update e delete

-- update de salário
update vendedor set salario = 2000 where id_vendedor = 3;


-- update da comissão
update vendedor set comissao = 10 where comissao = 5.00;


-- delete de dados
delete from vendedor where id_vendedor = 5;

-- select de dados

select * from cliente;
select * from vendedor;
select * from pedido;