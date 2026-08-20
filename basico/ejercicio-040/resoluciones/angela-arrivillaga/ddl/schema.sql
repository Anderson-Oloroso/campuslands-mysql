create database if not exists carreras_urbanas_db;
use carreras_urbanas_db;

create table categorias_carrera (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(40) not null unique,
    distancia_km decimal(5,2) not null,
    constraint chk_distancia check (distancia_km > 0.00)
);

create table corredores (
    id_corredor int primary key auto_increment,
    nombre_completo varchar(60) not null,
    id_categoria int not null,
    costo_inscripcion decimal(10,2) not null,
    tiempo_meta_minutos int not null default 0,
    estado_participacion enum('inscrito', 'finalizado', 'retirado') default 'inscrito',
    constraint fk_corredor_categoria foreign key (id_categoria) references categorias_carrera(id_categoria) on delete restrict on update cascade,
    constraint chk_costo_inscripcion check (costo_inscripcion >= 0.00),
    constraint chk_tiempo_meta check (tiempo_meta_minutos >= 0)
);