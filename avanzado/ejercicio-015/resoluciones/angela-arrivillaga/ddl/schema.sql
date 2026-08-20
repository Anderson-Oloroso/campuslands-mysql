create database if not exists biblioteca_gamer_db;
use biblioteca_gamer_db;

create table plataformas_gaming (
    id_plataforma int primary key auto_increment,
    nombre_plataforma varchar(40) not null unique,
    tipo_arquitectura varchar(30) not null
);

create table videojuegos (
    id_juego int primary key auto_increment,
    titulo_juego varchar(80) not null,
    id_plataforma int not null,
    desarrollador varchar(60) not null,
    precio_dolares decimal(10,2) not null,
    horas_jugadas int not log not null default 0,
    calificacion_meta int not null, -- de 0 a 100
    estado_jugo enum('completado', 'jugando', 'pendiente', 'abandonado') default 'pendiente',
    fecha_adquisicion date not null,
    constraint fk_juego_plataforma foreign key (id_plataforma) references plataformas_gaming(id_plataforma) on delete restrict on update cascade,
    constraint chk_precio check (precio_dolares >= 0.00),
    constraint chk_meta check (calificacion_meta between 0 and 100),

    -- creacion de indices (optimizacion) para acelerar busquedas por titulo, estado y calificacion
    index idx_titulo_juego (titulo_juego),
    index idx_estado_juego (estado_jugo),
    index idx_calificacion_meta (calificacion_meta)
);