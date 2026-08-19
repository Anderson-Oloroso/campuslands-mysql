create database if not exists carreras_urbanas_unique_db;
use carreras_urbanas_unique_db;

create table carreras (
    id_carrera int primary key auto_increment,
    nombre_carrera varchar(70) not null,
    edicion int not null,
    fecha_evento date not null,
    distancia_km decimal(5,2) not null,
    -- Restricción UNIQUE compuesta: Una misma edición de una carrera no puede repetirse en la misma fecha
    constraint uq_carrera_edicion unique (nombre_carrera, edicion),
    constraint chk_distancia check (distancia_km > 0)
);

create table atletas (
    id_atleta int primary key auto_increment,
    nombre_completo varchar(70) not null,
    correo_electronico varchar(80) not null unique,
    documento_identidad varchar(20) not null unique,
    telefono varchar(25) null,
    genero enum('masculino', 'femenino', 'otro') not null
);

create table categorias (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null unique,
    edad_minima int not null,
    edad_maxima int not null,
    constraint chk_edades check (edad_minima <= edad_maxima)
);

create table inscripciones (
    id_inscripcion int primary key auto_increment,
    id_carrera int not null,
    id_atleta int not null,
    id_categoria int not null,
    numero_dorsal int not null,
    fecha_inscripcion datetime not null default current_timestamp,
    estado_pago enum('pendiente', 'pagado', 'cortesia') not null default 'pagado',
    -- Restricción UNIQUE: Un atleta no puede inscribirse dos veces en la misma carrera
    constraint uq_atleta_carrera unique (id_carrera, id_atleta),
    -- Restricción UNIQUE: El número de dorsal asignado debe ser único dentro de la misma carrera
    constraint uq_carrera_dorsal unique (id_carrera, numero_dorsal),
    constraint fk_inscripcion_carrera foreign key (id_carrera) references carreras(id_carrera) on delete cascade on update cascade,
    constraint fk_inscripcion_atleta foreign key (id_atleta) references atletas(id_atleta) on delete cascade on update cascade,
    constraint fk_inscripcion_categoria foreign key (id_categoria) references categorias(id_categoria) on delete restrict on update cascade,
    constraint chk_dorsal check (numero_dorsal > 0)
);

create table resultados (
    id_resultado int primary key auto_increment,
    id_inscripcion int not null unique, 
    tiempo_oficial time not null,
    posicion_general int not null,
    estado_llegada enum('finalizado', 'retirado', 'descalificado') not null default 'finalizado',
    -- Restricción UNIQUE: La posición general en la misma carrera no puede repetirse para corredores distintos (se vincula vía inscripción)
    constraint fk_resultado_inscripcion foreign key (id_inscripcion) references inscripciones(id_inscripcion) on delete cascade on update cascade,
    constraint chk_posicion check (posicion_general > 0)
);