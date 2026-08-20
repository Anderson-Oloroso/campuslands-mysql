-- creacion de la base de datos para ping pong
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla torneos de ping pong
create table torneos_pingpong (
    id int auto_increment primary key,
    nombre_torneo varchar(60) not null unique,
    tipo_superficie varchar(30) not null,
    premio_mayor decimal(10, 2) not null,
    constraint chk_premio_torneo check (premio_mayor > 0)
);

-- creacion de la tabla jugadores con restricciones check estrictas
create table jugadores_pingpong (
    id int auto_increment primary key,
    torneo_id int not null,
    nombre_jugador varchar(80) not null,
    ranking_mundial int not null,
    sets_ganados int default 0,
    sets_perdidos int default 0,
    estado_jugador enum('activo', 'eliminado', 'lesionado') default 'activo',
    constraint fk_torneo_pingpong foreign key (torneo_id) references torneos_pingpong(id),
    constraint chk_ranking_valido check (ranking_mundial between 1 and 500),
    constraint chk_sets_ganados check (sets_ganados >= 0),
    constraint chk_sets_perdidos check (sets_perdidos >= 0)
);