create database if not exists pingpong_db;
use pingpong_db;

create table categorias_nivel (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(40) not null unique,
    puntos_minimos_ranking int not null default 0,
    constraint chk_puntos_minimos check (puntos_minimos_ranking >= 0)
);

create table jugadores_pingpong (
    id_jugador int primary key auto_increment,
    nombre_completo varchar(60) not null,
    id_categoria int not null,
    partidos_ganados int not null default 0,
    partidos_perdidos int not null default 0,
    sets_a_favor int not null default 0,
    sets_en_contra int not null default 0,
    cuota_membresia decimal(10,2) not null,
    estado_jugador enum('activo', 'lesionado', 'retirado') default 'activo',
    constraint fk_jugador_categoria foreign key (id_categoria) references categorias_nivel(id_categoria) on delete restrict on update cascade,
    constraint chk_partidos_ganados check (partidos_ganados >= 0),
    constraint chk_partidos_perdidos check (partidos_perdidos >= 0),
    constraint chk_sets_favor check (sets_a_favor >= 0),
    constraint chk_sets_contra check (sets_en_contra >= 0),
    constraint chk_membresia check (cuota_membresia >= 0.00)
);