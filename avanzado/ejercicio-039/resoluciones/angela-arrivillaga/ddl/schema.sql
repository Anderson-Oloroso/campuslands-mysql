-- creacion de la base de datos para kickboxing
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla combatientes
create table combatientes (
    id int auto_increment primary key,
    nombre varchar(80) not null,
    categoria_peso varchar(40) not null,
    peleas_ganadas int default 0,
    peleas_perdidas int default 0,
    bolsa_pelea decimal(10, 2) not null,
    estado enum('activo', 'lesionado', 'retirado') default 'activo',
    constraint chk_ganadas check (peleas_ganadas >= 0),
    constraint chk_perdidas check (peleas_perdidas >= 0),
    constraint chk_bolsa check (bolsa_pelea > 0)
);

-- creacion de la tabla eventos de combate con control transaccional y bloqueos explicitos
create table eventos_combate (
    id int auto_increment primary key,
    combatiente_rojo_id int not null,
    combatiente_azul_id int not null,
    modalidad varchar(40) not null,
    premio_total decimal(12, 2) not null,
    estado_evento enum('programado', 'en_curso', 'finalizado') default 'programado',
    constraint fk_rojo foreign key (combatiente_rojo_id) references combatientes(id),
    constraint fk_azul foreign key (combatiente_azul_id) references combatientes(id),
    constraint chk_premio_evento check (premio_total > 0)
);