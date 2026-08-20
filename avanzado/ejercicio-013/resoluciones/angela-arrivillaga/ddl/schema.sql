create database if not exists peliculas_miedo_db;
use peliculas_miedo_db;

create table subgeneros_terror (
    id_subgenero int primary key auto_increment,
    nombre_subgenero varchar(40) not null unique,
    descripcion_tematica varchar(100)
);

create table peliculas_terror (
    id_pelicula int primary key auto_increment,
    titulo_original varchar(80) not null,
    director varchar(60) not null,
    id_subgenero int not null,
    anio_estreno int not null,
    presupuesto_millones decimal(10,2) not null,
    calificacion_imdb decimal(3,2) not null,
    detalles_json json not null, -- almacena metadata flexible como sub-elencos, premios, plataformas de streaming y parametros de sustos
    estado_distribucion enum('estreno', 'cartelera', 'archivada') default 'estreno',
    constraint fk_pelicula_subgenero foreign key (id_subgenero) references subgeneros_terror(id_subgenero) on delete restrict on update cascade,
    constraint chk_anio check (anio_estreno between 1920 and 2030),
    constraint chk_presupuesto check (presupuesto_millones >= 0.00),
    constraint chk_imdb check (calificacion_imdb between 0.00 and 10.00)
);