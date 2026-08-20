create database if not exists inventario_skins_shooter_db;
use inventario_skins_shooter_db;

create table rareza_skin (
    id_rareza int primary key auto_increment,
    nombre_rareza varchar(30) not null unique,
    factor_multiplicador decimal(4,2) not null,
    constraint chk_multiplicador check (factor_multiplicador >= 1.00)
);

create table skins_shooter (
    id_skin int primary key auto_increment,
    nombre_skin varchar(50) not null unique,
    arma_asociada varchar(40) not null,
    id_rareza int not null,
    precio_mercado decimal(10,2) not null,
    desgaste_nivel enum('factory new', 'minimal wear', 'field-tested', 'well-worn', 'battle-scarred') not null,
    fecha_lanzamiento date not null,
    estado_disponibilidad enum('disponible', 'agotado', 'exclusivo') default 'disponible',
    constraint fk_skin_rareza foreign key (id_rareza) references rareza_skin(id_rareza) on delete restrict on update cascade,
    constraint chk_precio_skin check (precio_mercado >= 0.00)
);