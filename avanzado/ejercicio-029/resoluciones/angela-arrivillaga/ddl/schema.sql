create database if not exists marketplace_accesorios_db;
use marketplace_accesorios_db;

-- 1. tabla de categorias de accesorios (ej. joyeria, bolsos, tecnologia, calzado)
create table categorias (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null unique,
    descripcion text not null
);

-- 2. tabla principal de accesorios del marketplace
create table accesorios (
    id_accesorio int primary key auto_increment,
    id_categoria int not null,
    nombre_accesorio varchar(80) not null unique,
    precio decimal(10,2) not null,
    stock int not null,
    estado_publicacion enum('borrador', 'activo', 'en_oferta', 'agotado', 'archivado') not null default 'activo',
    fecha_creacion datetime not null default current_timestamp,
    constraint fk_accesorio_categoria foreign key (id_categoria) references categorias(id_categoria) on delete restrict on update cascade,
    constraint chk_precio_positivo check (precio > 0.00),
    constraint chk_stock_no_negativo check (stock >= 0)
);

-- 3. tabla de historial o log de auditoria automatica por eventos del programador (event scheduler)
create table auditoria_eventos_stock (
    id_auditoria int primary key auto_increment,
    id_accesorio int not null,
    evento_realizado varchar(100) not null,
    detalle_cambio varchar(255) not null,
    fecha_evento datetime not null default current_timestamp,
    constraint fk_auditoria_accesorio foreign key (id_accesorio) references accesorios(id_accesorio) on delete cascade on update cascade
);