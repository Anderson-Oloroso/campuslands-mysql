create database if not exists soldadura_bloqueos_db;
use soldadura_bloqueos_db;

-- 1. Tabla de Soldadores / Operadores Certificados
create table soldadores (
    id_soldador int primary key auto_increment,
    nombre_completo varchar(80) not null,
    certificacion varchar(50) not null,
    correo varchar(90) not null unique,
    nivel enum('aprendiz', 'junior', 'senior', 'master_inspector') not null default 'junior'
);

-- 2. Tabla de Procesos y Equipos de Soldadura
create table equipos_soldadura (
    id_equipo int primary key auto_increment,
    nombre_equipo varchar(50) not null unique,
    proceso_soldadura enum('SMAW', 'GMAW', 'GTAW', 'FCAW', 'Oxyfuel') not null,
    amperaje_maximo int not null,
    estado_equipo enum('disponible', 'en_uso', 'mantenimiento', 'fuera_de_servicio') not null default 'disponible',
    constraint chk_amperaje check (amperaje_maximo > 0)
);

-- 3. Tabla principal de Proyectos / Uniones Soldadas (Sujeta a bloqueos concurrentes)
create table juntas_soldadas (
    id_junta int primary key auto_increment,
    id_soldador int not null,
    id_equipo int not null,
    codigo_junta varchar(50) not null unique,
    material_base varchar(60) not null,
    espesor_mm decimal(5,2) not null,
    resultado_inspeccion enum('pendiente', 'aprobado_radiografia', 'rechazado', 'retrabajo') not null default 'pendiente',
    fecha_proceso datetime not null default current_timestamp,
    constraint fk_junta_soldador foreign key (id_soldador) references soldadores(id_soldador) on delete cascade on update cascade,
    constraint fk_junta_equipo foreign key (id_equipo) references equipos_soldadura(id_equipo) on delete restrict on update cascade,
    constraint chk_espesor check (espesor_mm > 0.00)
);

-- 4. Tabla de Consumibles de Soldadura (Varillas, Electrodos, Gases)
create table consumibles (
    id_consumible int primary key auto_increment,
    nombre_consumible varchar(60) not null unique,
    tipo_consumible enum('electrodo_revestido', 'alambre_mig', 'varilla_tig', 'gas_proteccion') not null,
    stock_kg decimal(8,2) not null,
    constraint chk_stock check (stock_kg >= 0.00)
);

create table juntas_consumibles (
    id_junta int not null,
    id_consumible int not null,
    consumo_kg decimal(5,2) not null,
    primary key (id_junta, id_consumible),
    constraint fk_jc_junta foreign key (id_junta) references juntas_soldadas(id_junta) on delete cascade on update cascade,
    constraint fk_jc_consumible foreign key (id_consumible) references consumibles(id_consumible) on delete cascade on update cascade,
    constraint chk_consumo check (consumo_kg > 0.00)
);