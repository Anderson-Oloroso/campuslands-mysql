-- creacion de la base de datos para catalogo de terror
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- entidades principales
create table peliculas (
    id int auto_increment primary key,
    titulo varchar(100) not null,
    anio_estreno year not null,
    puntaje_terror decimal(3, 1) default 0.0,
    constraint chk_puntaje check (puntaje_terror between 0.0 and 10.0)
);

create table subgeneros (
    id int auto_increment primary key,
    nombre_subgenero varchar(50) not null unique
);

-- tabla puente para relacion n:m
create table peliculas_subgeneros (
    pelicula_id int not null,
    subgenero_id int not null,
    primary key (pelicula_id, subgenero_id),
    constraint fk_pelicula foreign key (pelicula_id) references peliculas(id) on delete cascade,
    constraint fk_subgenero foreign key (subgenero_id) references subgeneros(id) on delete cascade
);