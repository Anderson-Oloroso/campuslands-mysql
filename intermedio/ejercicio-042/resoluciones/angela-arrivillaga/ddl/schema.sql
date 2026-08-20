-- creacion de la base de datos para playlist musical
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla playlists
create table playlists (
    id int auto_increment primary key,
    nombre_playlist varchar(80) not null unique,
    creador varchar(60) not null,
    genero_principal varchar(40) not null
);

-- creacion de la tabla canciones con restricciones check estrictas
create table canciones (
    id int auto_increment primary key,
    playlist_id int not null,
    titulo varchar(100) not null,
    artista varchar(80) not null,
    duracion_segundos int not null,
    reproducciones bigint default 0,
    estado_cancion enum('activa', 'archivada', 'exclusiva') default 'activa',
    constraint fk_playlist_canciones foreign key (playlist_id) references playlists(id),
    constraint chk_duracion_segundos check (duracion_segundos > 0),
    constraint chk_reproducciones check (reproducciones >= 0)
);