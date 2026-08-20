create database if not exists accion_aventura_db;
use accion_aventura_db;

-- 1. tabla de regiones o mundos del videojuego
create table regiones (
    id_region int primary key auto_increment,
    nombre_region varchar(50) not null unique,
    nivel_recomendado int not null,
    clima varchar(40) not null,
    constraint chk_nivel_rec check (nivel_recomendado >= 1)
);

-- 2. tabla de facciones o gremios de cazadores/exploradores
create table facciones (
    id_faccion int primary key auto_increment,
    nombre_faccion varchar(50) not null unique,
    lider varchar(60) not null,
    reputacion_inicial int not null default 0
);

-- 3. tabla principal de personajes del videojuego de accion y aventura
create table personajes (
    id_personaje int primary key auto_increment,
    id_region int not null,
    id_faccion int not null,
    nombre_heroe varchar(60) not null unique,
    clase_combate varchar(45) not null,
    puntos_salud int not null,
    experiencia_acumulada int not null default 0,
    tesoro_recaudado decimal(12,2) not null default 0.00,
    estado_mision enum('explorando', 'en_combate', 'descanso', 'retirado') not null default 'explorando',
    constraint fk_personaje_region foreign key (id_region) references regiones(id_region) on delete restrict on update cascade,
    constraint fk_personaje_faccion foreign key (id_faccion) references facciones(id_faccion) on delete restrict on update cascade,
    constraint chk_puntos_salud check (puntos_salud > 0),
    constraint chk_tesoro_positivo check (tesoro_recaudado >= 0.00)
);

-- 4. tabla de registros de misiones o artefactos recolectados
create table misiones_artefactos (
    id_mision int primary key auto_increment,
    id_personaje int not null,
    nombre_artefacto varchar(80) not null,
    rareza enum('comun', 'raro', 'epico', 'legendario') not null,
    valor_experiencia int not null,
    fecha_hallazgo datetime not null default current_timestamp,
    constraint fk_ma_personaje foreign key (id_personaje) references personajes(id_personaje) on delete cascade on update cascade,
    constraint chk_val_exp check (valor_experiencia > 0)
);