create database if not exists arquitectura_3d_db;
use arquitectura_3d_db;

create table clientes (
    id_cliente int primary key auto_increment,
    nombre_cliente varchar(80) not null,
    correo_contacto varchar(100) not null unique,
    telefono varchar(20) not null
);

create table estilos_arquitectonicos (
    id_estilo int primary key auto_increment,
    nombre_estilo varchar(50) not null unique,
    descripcion_estilo varchar(150) not null
);

create table proyectos_arquitectura (
    id_proyecto int primary key auto_increment,
    codigo_proyecto varchar(20) not null unique,
    nombre_proyecto varchar(100) not null,
    id_cliente int not null,
    id_estilo int not null,
    area_construccion_m2 decimal(8,2) not null,
    presupuesto_estimado decimal(12,2) not null,
    estado_proyecto enum('anteproyecto', 'en_modelado', 'renderizado', 'entregado') default 'anteproyecto',
    constraint fk_proyecto_cliente foreign key (id_cliente) references clientes(id_cliente) on delete restrict on update cascade,
    constraint fk_proyecto_estilo foreign key (id_estilo) references estilos_arquitectonicos(id_estilo) on delete restrict on update cascade,
    constraint chk_area check (area_construccion_m2 > 0.00),
    constraint chk_presupuesto check (presupuesto_estimado > 0.00)
);

create table etapas_render (
    id_etapa int primary key auto_increment,
    id_proyecto int not null,
    nombre_fase varchar(50) not null,
    horas_invertidas decimal(6,2) not null,
    software_utilizado varchar(50) not null,
    constraint fk_etapa_proyecto foreign key (id_proyecto) references proyectos_arquitectura(id_proyecto) on delete cascade on update cascade,
    constraint chk_horas check (horas_invertidas >= 0.00)
);