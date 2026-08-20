create database if not exists futbol_sala_db;
use futbol_sala_db;

create table posiciones (
    id_posicion int primary key auto_increment,
    nombre_posicion varchar(40) not null unique,
    descripcion_rol varchar(100) not null
);

create table jugadores_sala (
    id_jugador int primary key auto_increment,
    nombre_completo varchar(60) not null,
    dorsal int not null,
    id_posicion int not null,
    goles_anotados int not null default 0,
    tarjetas_amarillas int not null default 0,
    salario_mensual decimal(10,2) not null,
    estado_jugador enum('activo', 'lesionado', 'suspendido') default 'activo',
    constraint fk_jugador_posicion foreign key (id_posicion) references posiciones(id_posicion) on delete restrict on update cascade,
    constraint chk_dorsal check (dorsal between 1 and 99),
    constraint chk_goles check (goles_anotados >= 0),
    constraint chk_tarjetas check (tarjetas_amarillas >= 0),
    constraint chk_salario check (salario_mensual >= 0.00)
);