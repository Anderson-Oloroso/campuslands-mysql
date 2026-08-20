create database if not exists equipo_streaming_db;
use equipo_streaming_db;

create table categorias_equipo (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null unique,
    descripcion_categoria varchar(150)
);

create table marcas_hardware (
    id_marca int primary key auto_increment,
    nombre_marca varchar(50) not null unique,
    pais_origen varchar(40) not null
);

create table dispositivos_streaming (
    id_dispositivo int primary key auto_increment,
    codigo_serial varchar(25) not null unique,
    nombre_dispositivo varchar(100) not null,
    id_categoria int not null,
    id_marca int not null,
    precio_dolares decimal(10,2) not null,
    estado_dispositivo enum('operativo', 'en_mantenimiento', 'retirado', 'nuevo') default 'nuevo',
    constraint fk_dispositivo_categoria foreign key (id_categoria) references categorias_equipo(id_categoria) on delete restrict on update cascade,
    constraint fk_dispositivo_marca foreign key (id_marca) references marcas_hardware(id_marca) on delete restrict on update cascade,
    constraint chk_precio_streaming check (precio_dolares >= 0.00)
);