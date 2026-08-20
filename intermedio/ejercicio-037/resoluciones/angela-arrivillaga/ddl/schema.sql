create database if not exists liga_futbol_2fn_db;
use liga_futbol_2fn_db;

create table equipos (
    id_equipo int primary key auto_increment,
    nombre_equipo varchar(60) not null unique,
    ciudad varchar(40) not null,
    estadio varchar(60) not null
);

create table torneos (
    id_torneo int primary key auto_increment,
    nombre_torneo varchar(50) not null,
    anio int not null,
    semestre enum('apertura', 'clausura', 'anual') not null
);

create table participaciones_torneo (
    id_participacion int primary key auto_increment,
    id_torneo int not null,
    id_equipo int not null,
    puntos_obtenidos int not null default 0,
    partidos_jugados int not null default 0,
    goles_a_favor int not null default 0,
    goles_en_contra int not null default 0,
    constraint fk_participacion_torneo foreign key (id_torneo) references torneos(id_torneo) on delete cascade on update cascade,
    constraint fk_participacion_equipo foreign key (id_equipo) references equipos(id_equipo) on delete cascade on update cascade,
    constraint uq_torneo_equipo unique (id_torneo, id_equipo),
    constraint chk_puntos check (puntos_obtenidos >= 0),
    constraint chk_partidos check (partidos_jugados >= 0)
);

create table jugadores_futbol (
    id_jugador int primary key auto_increment,
    id_equipo int not null,
    nombre_jugador varchar(60) not null,
    posicion enum('arquero', 'defensa', 'mediocampista', 'delantero') not null,
    dorsal int not null,
    goles_anotados int not null default 0,
    constraint fk_jugador_equipo foreign key (id_equipo) references equipos(id_equipo) on delete cascade on update cascade,
    constraint chk_goles_jugador check (goles_anotados >= 0)
);