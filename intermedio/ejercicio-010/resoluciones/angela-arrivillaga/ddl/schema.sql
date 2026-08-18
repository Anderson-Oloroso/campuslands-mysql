create database if not exists campuslands_mysql;
use campuslands_mysql;

drop table if exists inscripciones_carrera;
drop table if exists corredores;
drop table if exists carreras_urbanas;

create table if not exists carreras_urbanas (
    id int auto_increment primary key,
    codigo_carrera varchar(20) not null unique,
    nombre_evento varchar(80) not null,
    distancia_km decimal(5,2) not null,
    fecha_evento date not null,
    constraint chk_distancia check (distancia_km > 0)
);

create table if not exists corredores (
    id int auto_increment primary key,
    numero_documento varchar(20) not null unique,
    nombre_completo varchar(80) not null,
    correo_electronico varchar(100) not null unique,
    genero enum('femenino', 'masculino', 'otro') not null,
    anio_nacimiento year not null
);

create table if not exists inscripciones_carrera (
    id int auto_increment primary key,
    carrera_id int not null,
    corredor_id int not null,
    numero_dorsal int not null,
    estado_pago enum('pagado', 'pendiente', 'cortesia') default 'pendiente',
    constraint fk_carrera foreign key (carrera_id) references carreras_urbanas(id) on delete cascade,
    constraint fk_corredor foreign key (corredor_id) references corredores(id) on delete cascade,
    constraint uk_carrera_corredor unique (carrera_id, corredor_id),
    constraint uk_carrera_dorsal unique (carrera_id, numero_dorsal),
    constraint chk_dorsal check (numero_dorsal > 0)
);