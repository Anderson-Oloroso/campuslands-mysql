-- creacion de la base de datos para biblioteca gamer
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla plataformas
create table plataformas (
    id int auto_increment primary key,
    nombre_plataforma varchar(50) not null unique
);

-- creacion de la tabla juegos
create table juegos (
    id int auto_increment primary key,
    plataforma_id int not null,
    titulo varchar(100) not null,
    precio decimal(10, 2) not null,
    puntaje_critica decimal(3, 1) default 0.0,
    fecha_lanzamiento date not null,
    estado_juego enum('disponible', 'agotado', 'proximamente') default 'disponible',
    constraint fk_plataforma_juegos foreign key (plataforma_id) references plataformas(id),
    constraint chk_precio check (precio >= 0),
    constraint chk_puntaje check (puntaje_critica between 0.0 and 10.0)
);