-- creacion de la base de datos para saga de ciencia ficcion
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- creacion de la tabla planetas
create table planetas (
    id int auto_increment primary key,
    nombre_planeta varchar(60) not null unique,
    tipo_clima varchar(40) not null,
    poblacion_estimada bigint default 0,
    constraint chk_poblacion check (poblacion_estimada >= 0)
);

-- creacion de la tabla personajes
create table personajes (
    id int auto_increment primary key,
    planeta_id int not null,
    nombre_personaje varchar(80) not null,
    rol varchar(40) not null,
    nivel_poder int not null,
    estado_personaje enum('activo', 'inactivo', 'desaparecido') default 'activo',
    constraint fk_planeta_personaje foreign key (planeta_id) references planetas(id),
    constraint chk_nivel_poder check (nivel_poder between 1 and 100)
);