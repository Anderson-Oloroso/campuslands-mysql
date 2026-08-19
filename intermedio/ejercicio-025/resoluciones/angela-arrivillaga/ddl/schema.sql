create database if not exists laboratorio_quimico_db;
use laboratorio_quimico_db;

create table categorias_reactivos (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null unique,
    nivel_peligrosidad enum('bajo', 'moderado', 'alto', 'critico') not null
);

create table investigadores (
    id_investigador int primary key auto_increment,
    codigo_empleado varchar(20) not null unique,
    nombre_investigador varchar(80) not null,
    correo_institucional varchar(100) not null unique
);

create table formulas_quimicas (
    id_formula int primary key auto_increment,
    codigo_formula varchar(20) not null unique,
    nombre_formula varchar(100) not null,
    formula_molecular varchar(50) not null unique,
    id_categoria int not null,
    id_investigador int not null,
    rendimiento_porcentaje decimal(5,2) not null,
    estado_formula enum('en_prueba', 'verificada', 'patentada', 'rechazada') default 'en_prueba',
    constraint fk_formula_categoria foreign key (id_categoria) references categorias_reactivos(id_categoria) on delete restrict on update cascade,
    constraint fk_formula_investigador foreign key (id_investigador) references investigadores(id_investigador) on delete restrict on update cascade,
    constraint chk_rendimiento check (rendimiento_porcentaje >= 0.00 and rendimiento_porcentaje <= 100.00)
);