-- creacion de la base de datos para carreras urbanas
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla categorias de carrera
create table categorias_carrera (
    id int auto_increment primary key,
    nombre_categoria varchar(50) not null unique,
    distancia_km decimal(5, 2) not null,
    costo_inscripcion decimal(10, 2) not null,
    constraint chk_distancia check (distancia_km > 0),
    constraint chk_costo_inscripcion check (costo_inscripcion >= 0)
);

-- creacion de la tabla corredores urbanos
create table corredores_urbanos (
    id int auto_increment primary key,
    categoria_id int not null,
    nombre_completo varchar(100) not null,
    edad int not null,
    tiempo_llegada_minutos decimal(6, 2) default null,
    estado_participacion enum('inscrito', 'completado', 'retirado') default 'inscrito',
    constraint fk_categoria_corredor foreign key (categoria_id) references categorias_carrera(id),
    constraint chk_edad_corredor check (edad between 12 and 90),
    constraint chk_tiempo_llegada check (tiempo_llegada_minutos is null or tiempo_llegada_minutos > 0)
);