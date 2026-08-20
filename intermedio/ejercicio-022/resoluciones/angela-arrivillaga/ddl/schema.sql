create database if not exists animacion_3d_db;
use animacion_3d_db;

create table motores_render (
    id_motor int primary key auto_increment,
    nombre_motor varchar(50) not null unique,
    empresa_desarrolladora varchar(50) not null,
    version_actual varchar(20) not null
);

create table proyectos_animacion (
    id_proyecto int primary key auto_increment,
    codigo_proyecto varchar(20) not null unique,
    titulo_proyecto varchar(100) not null,
    id_motor int not null,
    fotogramas_totales int not null,
    duracion_segundos decimal(6,2) not null,
    estado_produccion enum('pre_produccion', 'en_render', 'post_produccion', 'finalizado') default 'en_render',
    constraint fk_proyecto_motor foreign key (id_motor) references motores_render(id_motor) on delete restrict on update cascade,
    constraint chk_fotogramas check (fotogramas_totales > 0),
    constraint chk_duracion check (duracion_segundos > 0.00)
);

create table renders_secuencias (
    id_render int primary key auto_increment,
    id_proyecto int not null,
    nombre_secuencia varchar(50) not null,
    resolucion_salida varchar(20) not null,
    tiempo_render_horas decimal(6,2) not null,
    peso_gigabytes decimal(6,2) not null,
    constraint fk_render_proyecto foreign key (id_proyecto) references proyectos_animacion(id_proyecto) on delete cascade on update cascade,
    constraint chk_tiempo_render check (tiempo_render_horas >= 0.00),
    constraint chk_peso check (peso_gigabytes > 0.00)
);