create database if not exists futbol_sala_3fn_db;
use futbol_sala_3fn_db;

create table ciudades (
    id_ciudad int primary key auto_increment,
    nombre_ciudad varchar(50) not null,
    departamento_estado varchar(50) not null
);

create table sedes (
    id_sede int primary key auto_increment,
    nombre_sede varchar(60) not null,
    id_ciudad int not null,
    capacidad int not null,
    constraint fk_sede_ciudad foreign key (id_ciudad) references ciudades(id_ciudad) on delete restrict on update cascade,
    constraint chk_capacidad check (capacidad > 0)
);

create table equipos (
    id_equipo int primary key auto_increment,
    nombre_equipo varchar(60) not null unique,
    id_sede_principal int not null,
    fecha_fundacion date not null,
    constraint fk_equipo_sede foreign key (id_sede_principal) references sedes(id_sede) on delete restrict on update cascade
);

create table categorias (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(40) not null,
    descripcion text
);

create table partidos (
    id_partido int primary key auto_increment,
    id_categoria int not null,
    id_equipo_local int not null,
    id_equipo_visitante int not null,
    id_sede int not null,
    fecha_hora datetime not null,
    goles_local int not null default 0,
    goles_visitante int not null default 0,
    estado_partido enum('programado', 'en_juego', 'finalizado', 'suspendido') not null default 'programado',
    constraint fk_partido_categoria foreign key (id_categoria) references categorias(id_categoria) on delete restrict on update cascade,
    constraint fk_partido_local foreign key (id_equipo_local) references equipos(id_equipo) on delete cascade on update cascade,
    constraint fk_partido_visitante foreign key (id_equipo_visitante) references equipos(id_equipo) on delete cascade on update cascade,
    constraint fk_partido_sede foreign key (id_sede) references sedes(id_sede) on delete restrict on update cascade,
    constraint chk_equipos_diferentes check (id_equipo_local <> id_equipo_visitante),
    constraint chk_goles_l check (goles_local >= 0),
    constraint chk_goles_v check (goles_visitante >= 0)
);

create table jugadores (
    id_jugador int primary key auto_increment,
    id_equipo int not null,
    nombre_completo varchar(70) not null,
    posicion enum('arquero', 'cierre', 'ala', 'pivot') not null,
    dorsal int not null,
    goles_anotados int not null default 0,
    tarjetas_amarillas int not null default 0,
    tarjetas_rojas int not null default 0,
    constraint fk_jugador_equipo foreign key (id_equipo) references equipos(id_equipo) on delete cascade on update cascade,
    constraint chk_goles_jugador check (goles_anotados >= 0),
    constraint chk_amarillas check (tarjetas_amarillas >= 0),
    constraint chk_rojas check (tarjetas_rojas >= 0)
);