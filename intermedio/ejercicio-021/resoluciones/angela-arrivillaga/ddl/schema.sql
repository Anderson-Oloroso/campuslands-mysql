create database if not exists dibujo_digital_db;
use dibujo_digital_db;

create table lienzos_digitales (
    id_lienzo int primary key auto_increment,
    codigo_lienzo varchar(20) not null unique,
    titulo_obra varchar(100) not null,
    software_utilizado varchar(50) not null,
    resolucion_ancho int not null,
    resolucion_alto int not null,
    capas_totales int not null,
    tiempo_horas decimal(6,2) not null,
    estado_proyecto enum('borrador', 'en_proceso', 'finalizado', 'archivado') default 'en_proceso',
    constraint chk_resolucion_ancho check (resolucion_ancho > 0),
    constraint chk_resolucion_alto check (resolucion_alto > 0),
    constraint chk_capas check (capas_totales > 0),
    constraint chk_tiempo check (tiempo_horas >= 0.00)
);

create table etiquetas_lienzo (
    id_etiqueta int primary key auto_increment,
    id_lienzo int not null,
    nombre_etiqueta varchar(40) not null,
    constraint fk_etiqueta_lienzo foreign key (id_lienzo) references lienzos_digitales(id_lienzo) on delete cascade on update cascade
);