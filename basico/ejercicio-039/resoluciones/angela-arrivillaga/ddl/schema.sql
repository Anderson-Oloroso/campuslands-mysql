create database if not exists kickboxing_db;
use kickboxing_db;

create table categorias_peso (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(40) not null unique,
    limite_peso_kg decimal(5,2) not null,
    constraint chk_limite_peso check (limite_peso_kg > 0.00)
);

create table luchadores (
    id_luchador int primary key auto_increment,
    nombre_completo varchar(60) not null,
    id_categoria int not null,
    peleas_ganadas int not null default 0,
    peleas_perdidas int not null default 0,
    nocauts_favor int not null default 0,
    cuota_mensual decimal(10,2) not null,
    estado_luchador enum('activo', 'inactivo', 'retirado') default 'activo',
    constraint fk_luchador_categoria foreign key (id_categoria) references categorias_peso(id_categoria) on delete restrict on update cascade,
    constraint chk_ganadas check (peleas_ganadas >= 0),
    constraint chk_perdidas check (peleas_perdidas >= 0),
    constraint chk_nocauts check (nocauts_favor >= 0),
    constraint chk_cuota check (cuota_mensual >= 0.00)
);