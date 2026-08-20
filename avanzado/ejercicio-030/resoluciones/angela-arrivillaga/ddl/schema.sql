create database if not exists equipo_streaming_db;
use equipo_streaming_db;

-- 1. tabla de categorias de equipos de streaming (ej. microfonos, camaras, iluminacion, capturadoras)
create table categorias_equipo (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null unique,
    descripcion text not null
);

-- 2. tabla principal de componentes y accesorios para streaming con indices para optimizacion de busquedas
create table equipos_streaming (
    id_equipo int primary key auto_increment,
    id_categoria int not null,
    nombre_equipo varchar(100) not null unique,
    precio decimal(10,2) not null,
    stock int not null,
    estado_operativo enum('disponible', 'en_uso', 'mantenimiento', 'retirado') not null default 'disponible',
    fecha_adquisicion date not null,
    constraint fk_equipo_categoria foreign key (id_categoria) references categorias_equipo(id_categoria) on delete restrict on update cascade,
    constraint chk_precio_positivo check (precio > 0.00),
    constraint chk_stock_no_negativo check (stock >= 0)
);

-- creacion de indices estrategicos para optimizar consultas frecuentes de filtros y ordenamientos
create index idx_equipos_estado on equipos_streaming(estado_operativo);
create index idx_equipos_precio on equipos_streaming(precio);
create index idx_equipos_categoria_estado on equipos_streaming(id_categoria, estado_operativo);