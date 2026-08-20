create database if not exists viajes_turismo_db;
use viajes_turismo_db;

create table destinos_turisticos (
    id_destino int primary key auto_increment,
    nombre_destino varchar(60) not null unique,
    pais varchar(40) not null,
    costo_base_diario decimal(10,2) not null,
    nivel_popularidad enum('bajo', 'medio', 'alto', 'vip') not null default 'medio',
    constraint chk_costo_base check (costo_base_diario >= 0.00)
);

create table paquetes_viaje (
    id_paquete int primary key auto_increment,
    nombre_paquete varchar(80) not null,
    id_destino int not null,
    duracion_dias int not null,
    precio_paquete decimal(10,2) not null,
    cupos_disponibles int not null,
    estado_paquete enum('disponible', 'agotado', 'cancelado') default 'disponible',
    constraint fk_paquete_destino foreign key (id_destino) references destinos_turisticos(id_destino) on delete restrict on update cascade,
    constraint chk_duracion check (duracion_dias > 0),
    constraint chk_precio_paquete check (precio_paquete >= 0.00),
    constraint chk_cupos check (cupos_disponibles >= 0)
);