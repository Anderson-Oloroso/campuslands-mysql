create database if not exists playlist_musical_db;
use playlist_musical_db;

create table generos_musicales (
    id_genero int primary key auto_increment,
    nombre_genero varchar(40) not null unique,
    descripcion varchar(100)
);

create table canciones (
    id_cancion int primary key auto_increment,
    titulo_cancion varchar(80) not null,
    artista varchar(60) not null,
    id_genero int not null,
    duracion_segundos int not null,
    reproducciones bigint not null default 0,
    calificacion decimal(3,2) not null default 0.00,
    estado_cancion enum('activa', 'pausada', 'archivada') default 'activa',
    constraint fk_cancion_genero foreign key (id_genero) references generos_musicales(id_genero) on delete restrict on update cascade,
    constraint chk_duracion check (duracion_segundos > 0),
    constraint chk_reproducciones check (reproducciones >= 0),
    constraint chk_calificacion check (calificacion between 0.00 and 5.00)
);