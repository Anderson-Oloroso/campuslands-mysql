create database if not exists autos_hiperdeportivos_db;
use autos_hiperdeportivos_db;

create table fabricantes (
    id_fabricante int primary key auto_increment,
    nombre_marca varchar(50) not null unique,
    pais_origen varchar(40) not null,
    anio_fundacion int not null,
    constraint chk_anio_fundacion check (anio_fundacion between 1885 and 2026)
);

create table hiperdeportivos (
    id_auto int primary key auto_increment,
    nombre_modelo varchar(60) not null unique,
    id_fabricante int not null,
    velocidad_maxima_kmh int not null,
    potencia_hp int not null,
    precio_millones_usd decimal(5,2) not null,
    unidades_producidas int not null,
    estado_homologacion enum('homologado circuito', 'legal calle', 'prototipo') default 'legal calle',
    constraint fk_auto_fabricante foreign key (id_fabricante) references fabricantes(id_fabricante) on delete restrict on update cascade,
    constraint chk_velocidad check (velocidad_maxima_kmh > 0),
    constraint chk_potencia check (potencia_hp > 0),
    constraint chk_precio check (precio_millones_usd > 0.00),
    constraint chk_unidades check (unidades_producidas > 0)
);