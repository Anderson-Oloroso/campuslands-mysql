create database if not exists ranking_battle_royale_db;
use ranking_battle_royale_db;

create table escuadrones_br (
    id_escuadron int primary key auto_increment,
    nombre_escuadron varchar(60) not null unique,
    servidor_region varchar(30) not null,
    nivel_rango enum('bronce', 'plata', 'oro', 'platino', 'diamante', 'maestro', 'gran maestro') default 'bronce'
);

create table jugadores_br (
    id_jugador int primary key auto_increment,
    id_escuadron int null,
    nombre_jugador varchar(60) not null,
    gamertag varchar(40) not null unique,
    eliminaciones_totales int not null default 0,
    partidas_jugadas int not null default 0,
    constraint fk_jugador_escuadron foreign key (id_escuadron) references escuadrones_br(id_escuadron) on delete set null on update cascade,
    constraint chk_eliminaciones check (eliminaciones_totales >= 0),
    constraint chk_partidas check (partidas_jugadas >= 0)
);

create table partidas_br (
    id_partida int primary key auto_increment,
    mapa_juego varchar(40) not null,
    modo_juego enum('solo', 'duo', 'squad') not null,
    ganador_gamertag varchar(40) not null,
    duracion_minutos int not null,
    fecha_partida datetime not null default current_timestamp,
    constraint chk_duracion_br check (duracion_minutos > 5)
);