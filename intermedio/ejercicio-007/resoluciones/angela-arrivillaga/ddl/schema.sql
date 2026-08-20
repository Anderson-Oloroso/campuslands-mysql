create database if not exists campuslands_mysql;
use campuslands_mysql;

drop table if exists partidos_liga;
drop table if exists estadios;
drop table if exists equipos_liga;

create table if not exists equipos_liga (
    id int auto_increment primary key,
    nombre_equipo varchar(60) not null unique,
    ciudad_origen varchar(50) not null,
    estado enum('activo', 'sancionado', 'descansando') default 'activo'
);

create table if not exists estadios (
    id int auto_increment primary key,
    nombre_estadio varchar(80) not null,
    capacidad int not null,
    constraint chk_capacidad check (capacidad > 0)
);

create table if not exists partidos_liga (
    id int auto_increment primary key,
    equipo_local_id int not null,
    equipo_visitante_id int not null,
    estadio_id int not null,
    goles_local int not null default 0,
    goles_visitante int not null default 0,
    jornada int not null,
    constraint fk_local foreign key (equipo_local_id) references equipos_liga(id) on delete cascade,
    constraint fk_visitante foreign key (equipo_visitante_id) references equipos_liga(id) on delete cascade,
    constraint fk_estadio foreign key (estadio_id) references estadios(id) on delete cascade,
    constraint chk_goles_l check (goles_local >= 0),
    constraint chk_goles_v check (goles_visitante >= 0)
);