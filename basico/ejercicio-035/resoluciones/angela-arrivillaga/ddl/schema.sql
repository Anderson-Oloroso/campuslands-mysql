create database if not exists taller_mecanico_motos_db;
use taller_mecanico_motos_db;

create table tipos_servicio (
    id_tipo_servicio int primary key auto_increment,
    nombre_servicio varchar(50) not null unique,
    descripcion_breve varchar(100) not null,
    costo_base decimal(10,2) not null,
    constraint chk_costo_base check (costo_base >= 0.00)
);

create table ordenes_reparacion (
    id_orden int primary key auto_increment,
    codigo_orden varchar(20) not null unique,
    propietario_nombre varchar(60) not null,
    moto_modelo varchar(50) not null,
    placa_moto varchar(10) not null,
    id_tipo_servicio int not null,
    costo_total decimal(10,2) not null,
    fecha_ingreso datetime not null,
    estado_reparacion enum('pendiente', 'en proceso', 'finalizado', 'entregado') default 'pendiente',
    constraint fk_orden_servicio foreign key (id_tipo_servicio) references tipos_servicio(id_tipo_servicio) on delete restrict on update cascade,
    constraint chk_costo_total check (costo_total >= 0.00)
);