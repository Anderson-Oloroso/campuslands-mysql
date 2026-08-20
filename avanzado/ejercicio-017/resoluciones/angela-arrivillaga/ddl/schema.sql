create database if not exists tienda_ropa_db;
use tienda_ropa_db;

create table categorias_prendas (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(40) not null unique,
    descripcion varchar(100)
);

create table inventario_prendas (
    id_prenda int primary key auto_increment,
    nombre_prenda varchar(60) not null,
    id_categoria int not null,
    talla varchar(10) not null,
    color varchar(30) not null,
    stock_actual int not null default 0,
    precio_dolares decimal(8,2) not null,
    constraint fk_prenda_categoria foreign key (id_categoria) references categorias_prendas(id_categoria) on delete restrict on update cascade,
    constraint chk_stock_no_negativo check (stock_actual >= 0),
    constraint chk_precio_positivo check (precio_dolares >= 0.00)
);

create table auditoria_stock (
    id_auditoria int primary key auto_increment,
    id_prenda int not null,
    stock_anterior int not null,
    stock_nuevo int not null,
    fecha_modificacion datetime not null default current_timestamp
);