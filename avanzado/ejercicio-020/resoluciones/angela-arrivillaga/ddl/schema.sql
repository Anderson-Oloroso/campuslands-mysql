create database if not exists estudio_tatuajes_db;
use estudio_tatuajes_db;

create table tatuadores (
    id_tatuador int primary key auto_increment,
    nombre_completo varchar(80) not null,
    especialidad varchar(50) not null,
    anios_experiencia int not null default 1,
    estado_laboral enum('activo', 'descanso', 'retirado') default 'activo',
    constraint chk_experiencia check (anios_experiencia >= 0)
);

create table clientes (
    id_cliente int primary key auto_increment,
    nombre_cliente varchar(80) not null,
    correo_electronico varchar(100) not null unique,
    telefono varchar(20) not null,
    fecha_registro datetime not null default current_timestamp
);

create table citas_tatuaje (
    id_cita int primary key auto_increment,
    id_cliente int not null,
    id_tatuador int not null,
    estilo_tatuaje varchar(50) not null,
    precio_estimado decimal(10,2) not null,
    estado_cita enum('programada', 'completada', 'cancelada') default 'programada',
    fecha_cita datetime not null,
    constraint fk_cita_cliente foreign key (id_cliente) references clientes(id_cliente) on delete restrict on update cascade,
    constraint fk_cita_tatuador foreign key (id_tatuador) references tatuadores(id_tatuador) on delete restrict on update cascade,
    constraint chk_precio_positivo check (precio_estimado > 0.00)
);

-- Creación de índices estratégicos para optimizar el rendimiento de consultas frecuentes en MySQL

-- 1. Índice en la tabla de citas para filtrar y ordenar por fecha de la cita rápidamente
create index idx_citas_fecha on citas_tatuaje (fecha_cita);

-- 2. Índice compuesto en citas para optimizar búsquedas que filtran por estado de la cita y id del tatuador
create index idx_citas_estado_tatuador on citas_tatuaje (estado_cita, id_tatuador);

-- 3. Índice en clientes para agilizar búsquedas por correo electrónico o coincidencias parciales de nombre
create index idx_clientes_correo on clientes (correo_electronico);

-- 4. Índice en tatuadores para mejorar filtros basados en la especialidad artística del artista
create index idx_tatuadores_especialidad on tatuadores (especialidad);