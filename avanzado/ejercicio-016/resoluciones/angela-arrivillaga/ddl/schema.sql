create database if not exists restaurante_urbano_db;
use restaurante_urbano_db;

create table inventario_ingredientes (
    id_ingrediente int primary key auto_increment,
    nombre_ingrediente varchar(50) not null unique,
    stock_actual int not null,
    unidad_medida varchar(20) not null,
    constraint chk_stock_positivo check (stock_actual >= 0)
);

create table menu_comida_urbana (
    id_producto int primary key auto_increment,
    nombre_producto varchar(60) not null,
    categoria enum('hamburguesa', 'salchipapa', 'perro caliente', 'bebida', 'acompañamiento') not null,
    precio_dolares decimal(8,2) not null,
    disponible boolean not null default true,
    constraint chk_precio_producto check (precio_dolares >= 0.00)
);

create table ordenes_pedido (
    id_orden int primary key auto_increment,
    cliente_nombre varchar(60) not null,
    total_pagar decimal(10,2) not null,
    estado_orden enum('pendiente', 'en preparacion', 'completada', 'cancelada') default 'pendiente',
    fecha_pedido datetime not null default current_timestamp,
    constraint chk_total_orden check (total_pagar >= 0.00)
);

create table detalle_orden (
    id_detalle int primary key auto_increment,
    id_orden int not null,
    id_producto int not null,
    cantidad int not null,
    subtotal_dolares decimal(10,2) not null,
    constraint fk_detalle_orden foreign key (id_orden) references ordenes_pedido(id_orden) on delete cascade on update cascade,
    constraint fk_detalle_producto foreign key (id_producto) references menu_comida_urbana(id_producto) on delete restrict on update cascade,
    constraint chk_cantidad_positiva check (cantidad > 0)
);