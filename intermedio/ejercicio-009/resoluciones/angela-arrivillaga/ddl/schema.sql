create database if not exists campuslands_mysql;
use campuslands_mysql;

drop table if exists combates_kickboxing;
drop table if exists luchadores_kickboxing;
drop table if exists categorias_peso;

create table if not exists categorias_peso (
    id int auto_increment primary key,
    nombre_categoria varchar(45) not null unique,
    limite_peso_kg decimal(5,2) not null,
    constraint chk_peso check (limite_peso_kg > 0)
);

create table if not exists luchadores_kickboxing (
    id int auto_increment primary key,
    nombre_completo varchar(80) not null,
    apodo varchar(50),
    categoria_id int not null,
    peleas_ganadas int not null default 0,
    peleas_perdidas int not null default 0,
    estado enum('activo', 'lesionado', 'retirado') default 'activo',
    constraint fk_categoria_luchador foreign key (categoria_id) references categorias_peso(id) on delete restrict,
    constraint chk_ganadas check (peleas_ganadas >= 0),
    constraint chk_perdidas check (peleas_perdidas >= 0)
);

create table if not exists combates_kickboxing (
    id int auto_increment primary key,
    luchador_azul_id int not null,
    luchador_rojo_id int not null,
    modalidad varchar(40) not null,
    ganador_id int null,
    fecha_combate date not null,
    constraint fk_luchador_azul foreign key (luchador_azul_id) references luchadores_kickboxing(id) on delete cascade,
    constraint fk_luchador_rojo foreign key (luchador_rojo_id) references luchadores_kickboxing(id) on delete cascade,
    constraint fk_ganador foreign key (ganador_id) references luchadores_kickboxing(id) on delete set null,
    constraint chk_diferentes_luchadores check (luchador_azul_id <> luchador_rojo_id)
);