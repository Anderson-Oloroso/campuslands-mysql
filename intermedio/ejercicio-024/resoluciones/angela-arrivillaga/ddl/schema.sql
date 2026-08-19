create database if not exists soldadura_db;
use soldadura_db;

create table procesos_soldadura (
    id_proceso int primary key auto_increment,
    codigo_proceso varchar(10) not null unique,
    nombre_proceso varchar(50) not null,
    descripcion_proceso varchar(150) not null
);

create table soldadores (
    id_soldador int primary key auto_increment,
    nombre_soldador varchar(80) not null,
    certificacion varchar(30) not null,
    nivel_experiencia enum('junior', 'semi_senior', 'senior') not null
);

create table juntas_soldadas (
    id_junta int primary key auto_increment,
    codigo_junta varchar(20) not null unique,
    id_proceso int not null,
    id_soldador int not null,
    material_base varchar(50) not null,
    espesor_mm decimal(5,2) not null,
    amperaje_usado int not null,
    estado_inspeccion enum('aprobada', 'rechazada', 'pendiente') default 'pendiente',
    constraint fk_junta_proceso foreign key (id_proceso) references procesos_soldadura(id_proceso) on delete restrict on update cascade,
    constraint fk_junta_soldador foreign key (id_soldador) references soldadores(id_soldador) on delete restrict on update cascade,
    constraint chk_espesor check (espesor_mm > 0.00),
    constraint chk_amperaje check (amperaje_usado > 0)
);