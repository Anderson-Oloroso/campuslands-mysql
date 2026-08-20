-- creacion de la base de datos para restaurante de comida urbana
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla categorias
create table categorias (
    id int auto_increment primary key,
    nombre_categoria varchar(50) not null unique
);

-- creacion de la tabla productos
create table productos (
    id int auto_increment primary key,
    categoria_id int not null,
    nombre_producto varchar(80) not null,
    precio_venta decimal(10, 2) not null,
    stock_actual int default 0,
    estado_producto enum('disponible', 'agotado') default 'disponible',
    constraint fk_categoria_producto foreign key (categoria_id) references categorias(id),
    constraint chk_precio_positivo check (precio_venta > 0),
    constraint chk_stock_positivo check (stock_actual >= 0)
);