create database if not exists juego_accion_db;
use juego_accion_db;

create table regiones_mapa (
    id_region int primary key auto_increment,
    nombre_region varchar(50) not null unique,
    nivel_recomendado int not null,
    clima_predominante varchar(30) not null,
    constraint chk_nivel_region check (nivel_recomendado between 1 and 100)
);

create table tipos_arma (
    id_tipo_arma int primary key auto_increment,
    nombre_tipo varchar(50) not null unique,
    alcance_combate varchar(30) not null
);

create table misiones_aventura (
    id_mision int primary key auto_increment,
    codigo_mision varchar(20) not null unique,
    titulo_mision varchar(100) not null,
    id_region int not null,
    id_tipo_arma int not null,
    recompensa_oro decimal(10,2) not null,
    puntos_experiencia int not null,
    estado_mision enum('disponible', 'en_curso', 'completada', 'bloqueada') default 'disponible',
    constraint fk_mision_region foreign key (id_region) references regiones_mapa(id_region) on delete restrict on update cascade,
    constraint fk_mision_arma foreign key (id_tipo_arma) references tipos_arma(id_tipo_arma) on delete restrict on update cascade,
    constraint chk_oro check (recompensa_oro >= 0.00),
    constraint chk_exp_mision check (puntos_experiencia >= 0)
);