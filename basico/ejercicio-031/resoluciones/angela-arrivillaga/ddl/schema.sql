create database if not exists torneo_moba_db;
use torneo_moba_db;

create table equipos_esports (
    id_equipo int primary key auto_increment,
    codigo_equipo varchar(20) not null unique,
    nombre_equipo varchar(50) not null unique,
    region_origen varchar(30) not null,
    fundacion_anio int not null,
    constraint chk_anio_fundacion check (fundacion_anio between 2000 and 2026)
);

create table jugadores_moba (
    id_jugador int primary key auto_increment,
    alias_jugador varchar(40) not null unique,
    nombre_real varchar(100) not null,
    id_equipo int not null,
    rol_principal enum('carril superior', 'jungla', 'carril central', 'tirador', 'soporte') not null,
    nivel_kda decimal(4,2) not null,
    estado_jugador enum('titular', 'suplente', 'suspendido', 'retirado') default 'titular',
    constraint fk_jugador_equipo foreign key (id_equipo) references equipos_esports(id_equipo) on delete restrict on update cascade,
    constraint chk_kda check (nivel_kda >= 0.00)
);