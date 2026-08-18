create database if not exists campuslands_mysql;
use campuslands_mysql;

drop table if exists jugadores_sala;
drop table if exists equipos_sala;
drop table if exists posiciones_sala;

create table if not exists posiciones_sala (
    id int auto_increment primary key,
    nombre_posicion varchar(40) not null unique,
    descripcion varchar(120) not null
);

create table if not exists equipos_sala (
    id int auto_increment primary key,
    nombre_equipo varchar(60) not null unique,
    ciudad varchar(50) not null,
    estado enum('activo', 'inactivo') default 'activo'
);

create table if not exists jugadores_sala (
    id int auto_increment primary key,
    nombre_completo varchar(80) not null,
    numero_camiseta int not null,
    equipo_id int not null,
    posicion_id int not null,
    goles_anotados int not null default 0,
    constraint fk_equipo_sala foreign key (equipo_id) references equipos_sala(id) on delete cascade,
    constraint fk_posicion_sala foreign key (posicion_id) references posiciones_sala(id) on delete restrict,
    constraint chk_goles_sala check (goles_anotados >= 0),
    constraint chk_camiseta check (numero_camiseta between 1 and 99)
);