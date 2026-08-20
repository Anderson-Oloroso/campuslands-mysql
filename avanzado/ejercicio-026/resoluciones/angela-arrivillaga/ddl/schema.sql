create database if not exists rgp_videojuego_db;
use rgp_videojuego_db;

-- 1. tabla de clases de personajes disponibles en el juego
create table clases (
    id_clase int primary key auto_increment,
    nombre_clase varchar(45) not null unique,
    rol_principal enum('tanque', 'dps', 'soporte', 'mago') not null,
    vida_base int not null,
    constraint chk_vida_base check (vida_base > 0)
);

-- 2. tabla de jugadores o usuarios registrados
create table jugadores (
    id_jugador int primary key auto_increment,
    nombre_usuario varchar(60) not null unique,
    correo varchar(90) not null unique,
    fecha_registro datetime not null default current_timestamp
);

-- 3. tabla de personajes (entidad principal)
create table personajes (
    id_personaje int primary key auto_increment,
    id_jugador int not null,
    id_clase int not null,
    nombre_personaje varchar(60) not null unique,
    nivel int not null default 1,
    experiencia int not null default 0,
    oro decimal(12,2) not null default 0.00,
    estado_personaje enum('activo', 'en_mision', 'derrotado', 'retirado') not null default 'activo',
    constraint fk_personaje_jugador foreign key (id_jugador) references jugadores(id_jugador) on delete cascade on update cascade,
    constraint fk_personaje_clase foreign key (id_clase) references clases(id_clase) on delete restrict on update cascade,
    constraint chk_nivel_positivo check (nivel >= 1),
    constraint chk_oro_positivo check (oro >= 0.00)
);

-- 4. tabla de misiones o quests del mundo del rpg
create table misiones (
    id_mision int primary key auto_increment,
    titulo_mision varchar(80) not null unique,
    dificultad enum('facil', 'media', 'dificil', 'epica') not null,
    recompensa_oro decimal(10,2) not null,
    recompensa_exp int not null,
    constraint chk_recompensa_oro check (recompensa_oro >= 0.00)
);

-- 5. tabla de historial de misiones completadas por los personajes (relacion muchos a muchos con atributos)
create table misiones_personajes (
    id_personaje int not null,
    id_mision int not null,
    estado_completado enum('en_progreso', 'completada', 'abandonada') not null default 'en_progreso',
    fecha_completado datetime default null,
    primary key (id_personaje, id_mision),
    constraint fk_mp_personaje foreign key (id_personaje) references personajes(id_personaje) on delete cascade on update cascade,
    constraint fk_mp_mision foreign key (id_mision) references misiones(id_mision) on delete cascade on update cascade
);