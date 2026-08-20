create database if not exists campuslands_mysql;
use campuslands_mysql;

-- eliminacion previa para evitar conflictos de llaves foraneas
drop table if exists especificaciones_autos;
drop table if exists autos_hiperdeportivos;
drop table if exists fabricantes_autos;

-- tabla independiente 1: fabricantes
create table if not exists fabricantes_autos (
    id int auto_increment primary key,
    nombre_fabricante varchar(60) not null unique,
    pais_origen varchar(50) not null
);

-- tabla independiente 2: autos hiperdeportivos con indices estrategicos para optimizacion con explain
create table if not exists autos_hiperdeportivos (
    id int auto_increment primary key,
    fabricante_id int not null,
    modelo varchar(60) not null,
    velocidad_maxima_kmh int not null,
    precio_millones_usd decimal(10,2) not null,
    estado enum('disponible', 'vendido', 'reservado') default 'disponible',
    anio_lanzamiento year not null,
    constraint fk_fabricante_auto foreign key (fabricante_id) references fabricantes_autos(id) on delete cascade,
    constraint chk_velocidad_avanzado check (velocidad_maxima_kmh > 300),
    index idx_estado_velocidad (estado, velocidad_maxima_kmh),
    index idx_precio (precio_millones_usd)
);

-- tabla dependiente: especificaciones tecnicas adicionales
create table if not exists especificaciones_autos (
    id int auto_increment primary key,
    auto_id int not null,
    tipo_motor varchar(50) not null,
    potencia_hp int not null,
    transmision varchar(40) not null,
    constraint fk_auto_especificacion foreign key (auto_id) references autos_hiperdeportivos(id) on delete cascade,
    constraint chk_potencia check (potencia_hp > 500),
    index idx_auto_potencia (auto_id, potencia_hp)
);