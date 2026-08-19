create database if not exists garaje_motos_db;
use garaje_motos_db;

create table tipos_motor (
    id_tipo_motor int primary key auto_increment,
    cilindrada_cc int not null,
    categoria_motor varchar(40) not null unique,
    constraint chk_cilindrada check (cilindrada_cc > 0)
);

create table garaje_motos (
    id_moto int primary key auto_increment,
    placa varchar(10) not null unique,
    marca varchar(40) not null,
    modelo varchar(40) not null,
    anio_fabricacion int not null,
    id_tipo_motor int not null,
    kilometraje int not null,
    tarifa_mantenimiento decimal(10,2) not null,
    estado_operativo enum('en servicio', 'en reparacion', 'fuera de servicio') default 'en servicio',
    constraint fk_moto_motor foreign key (id_tipo_motor) references tipos_motor(id_tipo_motor) on delete restrict on update cascade,
    constraint chk_anio check (anio_fabricacion between 1980 and 2026),
    constraint chk_kilometraje check (kilometraje >= 0),
    constraint chk_tarifa check (tarifa_mantenimiento >= 0.00)
);