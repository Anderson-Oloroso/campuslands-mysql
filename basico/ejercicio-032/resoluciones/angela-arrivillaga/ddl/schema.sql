create database if not exists ranking_battle_royale_db;
use ranking_battle_royale_db;

create table rangos_liga (
    id_rango int primary key auto_increment,
    nombre_liga varchar(40) not null unique,
    puntos_minimos int not null,
    constraint chk_puntos_liga check (puntos_minimos >= 0)
);

create table jugadores_battle_royale (
    id_jugador int primary key auto_increment,
    gamertag varchar(40) not null unique,
    id_rango int not null,
    puntos_ranking int not null,
    partidas_jugadas int not null,
    victorias_obtenidas int not null,
    precision_disparo decimal(5,2) not null,
    fecha_registro datetime not null,
    estado_cuenta enum('activo', 'suspendido', 'inactivo') default 'activo',
    constraint fk_jugador_rango foreign key (id_rango) references rangos_liga(id_rango) on delete restrict on update cascade,
    constraint chk_puntos_ranking check (puntos_ranking >= 0),
    constraint chk_partidas check (partidas_jugadas >= 0 and victorias_obtenidas <= partidas_jugadas),
    constraint chk_precision check (precision_disparo between 0.00 and 100.00)
);