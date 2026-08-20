create database if not exists garaje_motos_db;
use garaje_motos_db;

create table marcas_moto (
    id_marca int primary key auto_increment,
    nombre_marca varchar(50) not null unique,
    pais_origen varchar(40) not null
);

create table motos_garaje (
    id_moto int primary key auto_increment,
    id_marca int not null,
    modelo varchar(60) not null,
    cilindrada_cc int not null,
    anio_fabricacion year not null,
    costo_mantenimiento_mensual decimal(10,2) not null default 0.00,
    estado_operativo enum('activo', 'en_reparacion', 'en_venta', 'baja') not null default 'activo',
    constraint fk_moto_marca foreign key (id_marca) references marcas_moto(id_marca) on delete restrict on update cascade,
    constraint chk_cilindrada check (cilindrada_cc > 49),
    constraint chk_costo_mantenimiento check (costo_mantenimiento_mensual >= 0.00)
);