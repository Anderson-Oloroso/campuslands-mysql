create database if not exists paracaidismo_db;
use paracaidismo_db;

create table equipos_paracaidas (
    id_equipo int primary key auto_increment,
    numero_serie varchar(30) not null unique,
    modelo_equipo varchar(50) not null,
    estado_equipo enum('disponible', 'en salto', 'en mantenimiento', 'retirado') default 'disponible',
    saltos_acumulados int not null default 0,
    constraint chk_saltos_positivos check (saltos_acumulados >= 0)
);

create table saltos_paracaidismo (
    id_salto int primary key auto_increment,
    paracaidista_nombre varchar(60) not null,
    id_equipo int not null,
    altura_salto_pies int not null,
    instructor_encargado varchar(60) not null,
    estado_salto enum('programado', 'completado', 'cancelado') default 'programado',
    fecha_salto datetime not null default current_timestamp,
    constraint fk_salto_equipo foreign key (id_equipo) references equipos_paracaidas(id_equipo) on delete restrict on update cascade,
    constraint chk_altura check (altura_salto_pies >= 3000)
);

create table bitacora_mantenimiento_equipos (
    id_bitacora int primary key auto_increment,
    id_equipo int not null,
    descripcion_evento varchar(255) not null,
    fecha_evento datetime not null default current_timestamp,
    constraint fk_bitacora_equipo foreign key (id_equipo) references equipos_paracaidas(id_equipo) on delete cascade on update cascade
);