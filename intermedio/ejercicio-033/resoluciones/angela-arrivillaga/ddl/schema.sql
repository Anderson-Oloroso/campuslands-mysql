create database if not exists inventario_skins_db;
use inventario_skins_db;

create table categorias_skin (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null unique,
    descripcion varchar(150)
);

create table rarezas_skin (
    id_rareza int primary key auto_increment,
    nombre_rareza varchar(30) not null unique,
    multiplicador_valor decimal(4,2) not null default 1.00
);

create table skins_inventario (
    id_skin int primary key auto_increment,
    nombre_skin varchar(60) not null,
    id_categoria int not null,
    id_rareza int not null,
    precio_estimado decimal(10,2) not null,
    estado_disponibilidad enum('en_uso', 'inventario', 'en_venta', 'archivada') not null default 'inventario',
    fecha_obtencion date not null,
    constraint fk_skin_categoria foreign key (id_categoria) references categorias_skin(id_categoria) on delete restrict on update cascade,
    constraint fk_skin_rareza foreign key (id_rareza) references rarezas_skin(id_rareza) on delete restrict on update cascade,
    constraint chk_precio_skin check (precio_estimado >= 0.00)
);