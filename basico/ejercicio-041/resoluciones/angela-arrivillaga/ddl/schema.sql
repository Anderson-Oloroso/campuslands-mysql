create database if not exists pingpong_club_db;
use pingpong_club_db;

-- 1. tabla de categorias o niveles de los jugadores de pingpong (ej. principiante, intermedio, avanzado, profesional)
create table categorias_nivel (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null unique,
    descripcion text not null
);

-- 2. tabla principal de jugadores con validaciones simples de edad, puntaje y correo electronico unico
create table jugadores (
    id_jugador int primary key auto_increment,
    id_categoria int not null,
    nombre_completo varchar(100) not null,
    correo varchar(100) not null unique,
    edad int not null,
    puntaje_ranking int not null default 1000,
    estado_jugador enum('activo', 'lesionado', 'suspendido', 'retirado') not null default 'activo',
    fecha_registro date not null,
    constraint fk_jugador_categoria foreign key (id_categoria) references categorias_nivel(id_categoria) on delete restrict on update cascade,
    constraint chk_edad_minima check (edad >= 12),
    constraint chk_puntaje_positivo check (puntaje_ranking >= 0)
);