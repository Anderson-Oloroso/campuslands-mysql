create database if not exists laboratorio_formulas_db;
use laboratorio_formulas_db;

-- 1. tabla de quimicos e investigadores responsables
create table investigadores (
    id_investigador int primary key auto_increment,
    nombre_completo varchar(80) not null,
    especialidad varchar(60) not null,
    correo varchar(90) not null unique,
    nivel_acceso enum('asistente', 'investigador_principal', 'director_lab', 'auditor') not null default 'asistente'
);

-- 2. tabla de reactivos y compuestos quimicos base
create table reactivos (
    id_reactivo int primary key auto_increment,
    nombre_reactivo varchar(60) not null unique,
    formula_quimica varchar(40) not null,
    peligrosidad enum('baja', 'moderada', 'alta', 'extrema') not null default 'moderada',
    stock_gramos decimal(10,2) not null,
    constraint chk_stock_gramos check (stock_gramos >= 0.00)
);

-- 3. tabla de formulas quimicas desarrolladas (entidad principal)
create table formulas_quimicas (
    id_formula int primary key auto_increment,
    id_investigador int not null,
    nombre_formula varchar(70) not null unique,
    descripcion text not null,
    estado_formula enum('en_desarrollo', 'en_prueba', 'aprobada', 'archivada', 'rechazada') not null default 'en_desarrollo',
    fecha_creacion datetime not null default current_timestamp,
    constraint fk_formula_investigador foreign key (id_investigador) references investigadores(id_investigador) on delete cascade on update cascade
);

-- 4. tabla intermedia para la composicion de las formulas (relacion muchos a muchos)
create table formulas_reactivos (
    id_formula int not null,
    id_reactivo int not null,
    cantidad_requerida_gramos decimal(8,2) not null,
    primary key (id_formula, id_reactivo),
    constraint fk_fr_formula foreign key (id_formula) references formulas_quimicas(id_formula) on delete cascade on update cascade,
    constraint fk_fr_reactivo foreign key (id_reactivo) references reactivos(id_reactivo) on delete cascade on update cascade,
    constraint chk_cantidad_req check (cantidad_requerida_gramos > 0.00)
);