create database if not exists torneos_moba_db;
use torneos_moba_db;

create table equipos_moba (
    id_equipo int primary key auto_increment,
    nombre_equipo varchar(60) not null unique,
    tag_equipo varchar(10) not null unique,
    region varchar(30) not null,
    estado_equipo enum('activo', 'eliminado', 'campeon') default 'activo'
);

create table jugadores_moba (
    id_jugador int primary key auto_increment,
    id_equipo int not null,
    nombre_jugador varchar(60) not null,
    nickname varchar(40) not null unique,
    rol_principal enum('top', 'jungle', 'mid', 'adc', 'support') not null,
    kda_promedio decimal(4,2) not null default 0.00,
    constraint fk_jugador_equipo foreign key (id_equipo) references equipos_moba(id_equipo) on delete restrict on update cascade,
    constraint chk_kda_positivo check (kda_promedio >= 0.00)
);

create table partidas_moba (
    id_partida int primary key auto_increment,
    id_equipo_azul int not null,
    id_equipo_rojo int not null,
    id_ganador int not null,
    duracion_minutos int not null,
    fase_torneo varchar(40) not null,
    fecha_partida datetime not null default current_timestamp,
    constraint fk_partida_azul foreign key (id_equipo_azul) references equipos_moba(id_equipo) on delete restrict on update cascade,
    constraint fk_partida_rojo foreign key (id_equipo_rojo) references equipos_moba(id_equipo) on delete restrict on update cascade,
    constraint fk_partida_ganador foreign key (id_ganador) references equipos_moba(id_equipo) on delete restrict on update cascade,
    constraint chk_duracion check (duracion_minutos > 10)
);