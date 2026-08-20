-- creacion de la base de datos para futbol sala
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla equipos
create table equipos_sala (
    id int auto_increment primary key,
    nombre varchar(60) not null unique,
    entrenador varchar(60) not null,
    puntos int default 0,
    goles_favor int default 0,
    goles_contra int default 0,
    estado enum('activo', 'suspendido', 'eliminado') default 'activo',
    constraint chk_puntos check (puntos >= 0),
    constraint chk_goles_favor check (goles_favor >= 0),
    constraint chk_goles_contra check (goles_contra >= 0)
);

-- creacion de la tabla jugadores de sala
create table jugadores_sala (
    id int auto_increment primary key,
    equipo_id int not null,
    nombre varchar(80) not null,
    dorsal int not null,
    goles_anotados int default 0,
    tarjetas_amarillas int default 0,
    tarjetas_rojas int default 0,
    constraint fk_equipo_sala foreign key (equipo_id) references equipos_sala(id),
    constraint chk_dorsal check (dorsal between 1 and 99),
    constraint chk_goles_jugador check (goles_anotados >= 0)
);

-- creacion de roles de base de datos para gestion de privilegios
drop role if exists 'rol_analista_sala'@'%';
drop role if exists 'rol_operador_sala'@'%';

create role 'rol_analista_sala'@'%';
create role 'rol_operador_sala'@'%';

-- asignacion de permisos al rol de analista (solo lectura para reportes)
grant select on campuslands_mysql.equipos_sala to 'rol_analista_sala'@'%';
grant select on campuslands_mysql.jugadores_sala to 'rol_analista_sala'@'%';

-- asignacion de permisos al rol de operador (insercion y actualizacion operativa)
grant select, insert, update on campuslands_mysql.equipos_sala to 'rol_operador_sala'@'%';
grant select, insert, update on campuslands_mysql.jugadores_sala to 'rol_operador_sala'@'%';

flush privileges;