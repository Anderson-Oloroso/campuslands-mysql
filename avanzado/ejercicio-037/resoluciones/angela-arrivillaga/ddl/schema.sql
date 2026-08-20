-- creacion de la base de datos para la liga
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla equipos
create table equipos (
    id int auto_increment primary key,
    nombre varchar(50) not null unique,
    ciudad varchar(50) not null
);

-- creacion de la tabla partidos
create table partidos (
    id int auto_increment primary key,
    equipo_local_id int not null,
    equipo_visitante_id int not null,
    goles_local int default 0,
    goles_visitante int default 0,
    fecha_partido date not null,
    constraint fk_local foreign key (equipo_local_id) references equipos(id),
    constraint fk_visitante foreign key (equipo_visitante_id) references equipos(id),
    constraint chk_goles_local check (goles_local >= 0),
    constraint chk_goles_visitante check (goles_visitante >= 0)
);