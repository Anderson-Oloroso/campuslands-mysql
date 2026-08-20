create database if not exists dibujo_digital_explain_db;
use dibujo_digital_explain_db;

-- 1. Tabla de Artistas / Creadores digitales
create table artistas (
    id_artista int primary key auto_increment,
    nombre_artistico varchar(60) not null unique,
    correo_electronico varchar(80) not null unique,
    nivel_experiencia enum('novato', 'intermedio', 'profesional', 'maestro') not null default 'intermedio'
);

-- 2. Tabla de Software / Herramientas de Dibujo Digital
create table software_dibujo (
    id_software int primary key auto_increment,
    nombre_software varchar(50) not null unique,
    desarrollador varchar(50) not null,
    tipo_licencia enum('gratuito', 'freemium', 'suscripcion', 'pago_unico') not null
);

-- 3. Tabla de Obras / Lienzos Digitales (Entidad principal con índices estratégicos para optimización con EXPLAIN)
create table obras (
    id_obra int primary key auto_increment,
    id_artista int not null,
    id_software int not null,
    titulo_obra varchar(80) not null,
    resolucion_ancho int not null,
    resolucion_alto int not null,
    megabytes_peso decimal(6,2) not null,
    estado_publicacion enum('borrador', 'publicado', 'archivado') not null default 'publicado',
    fecha_creacion datetime not null default current_timestamp,
    constraint fk_obra_artista foreign key (id_artista) references artistas(id_artista) on delete cascade on update cascade,
    constraint fk_obra_software foreign key (id_software) references software_dibujo(id_software) on delete restrict on update cascade,
    constraint chk_ancho check (resolucion_ancho > 0),
    constraint chk_alto check (resolucion_alto > 0),
    constraint chk_peso check (megabytes_peso > 0)
);

-- Creación de índices optimizados para análisis de rendimiento con EXPLAIN
create index idx_obras_estado on obras(estado_publicacion);
create index idx_obras_artista_fecha on obras(id_artista, fecha_creacion);
create index idx_obras_software on obras(id_software);

-- 4. Tabla de Pinceles / Brushes usados en las obras (Relación N:M)
create table pinceles (
    id_pincel int primary key auto_increment,
    nombre_pincel varchar(50) not null unique,
    tipo_trazo enum('sketch', 'ink', 'paint', 'airbrush', 'texture') not null
);

create table obras_pinceles (
    id_obra int not null,
    id_pincel int not null,
    primary key (id_obra, id_pincel),
    constraint fk_op_obra foreign key (id_obra) references obras(id_obra) on delete cascade on update cascade,
    constraint fk_op_pincel foreign key (id_pincel) references pinceles(id_pincel) on delete cascade on update cascade
);