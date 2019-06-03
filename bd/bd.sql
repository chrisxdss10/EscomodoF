drop database if exists escomodo;
create database escomodo;
use escomodo;

create table cliente
(
	idcliente int not null auto_increment primary key,
    nombre nvarchar(60) not null,
    boleta nvarchar(10) not null,
    email nvarchar(40) not null,
    tel nvarchar(20) not null,
    contra varbinary(255) not null,
    foto nvarchar(80) not null,
    confirmado boolean not null
);

create table establecimiento
(
	idest int not null auto_increment primary key,
    nombre nvarchar(60) not null,
    ubicacion nvarchar(100) not null,
    representante nvarchar(60) not null,
    email nvarchar(40) not null,
    tel nvarchar(20) not null,
    horario nvarchar(40) not null,
    contra varbinary(255) not null,
    foto nvarchar(80) not null,
    confirmado boolean not null
);

create table platillo 
(
	idplatillo int not null auto_increment primary key,
    nombre nvarchar(60) not null,
    valoracion float(2,1) not null,
    precio float(5,2) not null,
    descripcion tinytext not null,
    foto nvarchar(80) not null,
    establecimiento int not null,
    foreign key(establecimiento) references establecimiento(idest) on delete cascade on update cascade
);

create table estpedido
(
	idestado int not null auto_increment primary key,
    descripcion nvarchar(30) not null
);

create table pedido 
(
	idpedido int not null auto_increment primary key,
    cliente int not null,
    platillo int not null,
    establecimiento int not null,
    fecha date not null,
    hora time not null,
    preciotot float(5,2) not null,
    cantidad int not null,
    lugar nvarchar(60) not null,
    estado int not null,
    calificacion float(2,1) not null,
    especif tinytext, 
    foreign key(cliente) references cliente(idcliente) on delete cascade on update cascade,
    foreign key(platillo) references platillo(idplatillo) on delete cascade on update cascade,
    foreign key(estado) references estpedido(idestado) on delete cascade on update cascade
);

create table repartidor 
(
	idrepartidor int not null auto_increment primary key,
    nombre nvarchar(60) not null,
    boleta nvarchar(10) not null,
    email nvarchar(40) not null,
    tel nvarchar(20) not null,
    horario nvarchar(150) not null,
    contra varbinary(255) not null,
    foto nvarchar(80) not null,
    valoracion float(2,1) not null,
    confirmado boolean not null
);

create table aceptpedido 
(
	idapedido int not null auto_increment primary key,
    repartidor int not null,
    pedido int not null,
    valrep float(2,1) not null,
    foreign key(repartidor) references repartidor(idrepartidor) on delete cascade on update cascade,
    foreign key(pedido) references pedido(idpedido) on delete cascade on update cascade
);