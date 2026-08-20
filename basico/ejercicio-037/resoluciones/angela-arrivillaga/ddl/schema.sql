create database if not exists liga_futbol_db;
use liga_futbol_db;

create table ciudades (
    id_ciudad int primary key auto_increment,
    nombre_ciudad varchar(50) not null unique,
    pais varchar(40) not null
);

create table equipos (
    id_equipo int primary key auto_increment,
    nombre_equipo varchar(60) not null unique,
    id_ciudad int not null,
    anio_fundacion int not null,
    puntos int not null default 0,
    goles_a_favor int not null default 0,
    goles_en_contra int not null default 0,
    estado_equipo enum('activo', 'sancionado', 'descendido') default 'activo',
    constraint fk_equipo_ciudad foreign key (id_ciudad) references ciudades(id_ciudad) on delete restrict on update cascade,
    constraint chk_anio_fundacion check (anio_fundacion between 1850 and 2026),
    constraint chk_puntos check (puntos >= 0),
    constraint chk_goles_favor check (goles_a_favor >= 0),
    constraint chk_goles_contra check (goles_en_contra >= 0)
);