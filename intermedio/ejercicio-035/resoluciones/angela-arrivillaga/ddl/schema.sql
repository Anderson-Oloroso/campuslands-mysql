create database if not exists taller_mecanico_motos_db;
use taller_mecanico_motos_db;

create table clientes_taller (
    id_cliente int primary key auto_increment,
    nombre_cliente varchar(60) not null,
    telefono varchar(20) not null,
    correo varchar(80) unique
);

create table motos_cliente (
    id_moto int primary key auto_increment,
    id_cliente int not null,
    marca_modelo varchar(60) not null,
    placa varchar(15) not null unique,
    anio int not null,
    constraint fk_moto_cliente foreign key (id_cliente) references clientes_taller(id_cliente) on delete cascade on update cascade,
    constraint chk_anio_moto check (anio >= 1980)
);

create table ordenes_reparacion (
    id_orden int primary key auto_increment,
    id_moto int not null,
    descripcion_servicio varchar(150) not null,
    costo_total decimal(10,2) not null,
    estado_orden enum('pendiente', 'en_proceso', 'completada', 'cancelada') not null default 'pendiente',
    fecha_ingreso date not null,
    constraint fk_orden_moto foreign key (id_moto) references motos_cliente(id_moto) on delete cascade on update cascade,
    constraint chk_costo_orden check (costo_total >= 0.00)
);