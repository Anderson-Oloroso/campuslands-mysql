create database if not exists videojuego_rpg_db;
use videojuego_rpg_db;

create table clases_personaje (
    id_clase int primary key auto_increment,
    nombre_clase varchar(50) not null unique,
    rol_principal varchar(30) not null
);

create table facciones (
    id_faccion int primary key auto_increment,
    nombre_faccion varchar(50) not null unique,
    alineacion varchar(30) not null
);

create table personajes_rpg (
    id_personaje int primary key auto_increment,
    codigo_personaje varchar(20) not null unique,
    nombre_personaje varchar(80) not null,
    id_clase int not null,
    id_faccion int not null,
    nivel int not null,
    experiencia int not null,
    puntos_vida int not null,
    puntos_mana int not null,
    estado_jugador enum('activo', 'en_combate', 'inconciente', 'retirado') default 'activo',
    constraint fk_personaje_clase foreign key (id_clase) references clases_personaje(id_clase) on delete restrict on update cascade,
    constraint fk_personaje_faccion foreign key (id_faccion) references facciones(id_faccion) on delete restrict on update cascade,
    constraint chk_nivel check (nivel between 1 and 100),
    constraint chk_experiencia check (experiencia >= 0),
    constraint chk_vida check (puntos_vida between 1 and 9999),
    constraint chk_mana check (puntos_mana between 0 and 9999)
);