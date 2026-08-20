create database if not exists hiperdeportivos_1fn_db;
use hiperdeportivos_1fn_db;

create table fabricantes_hiperautos (
    id_fabricante int primary key auto_increment,
    nombre_fabricante varchar(60) not null unique,
    pais_origen varchar(40) not null
);

create table hiperautos (
    id_hiperauto int primary key auto_increment,
    id_fabricante int not null,
    nombre_modelo varchar(60) not null unique,
    potencia_hp int not null,
    velocidad_maxima_kmh int not null,
    precio_usd decimal(12,2) not null,
    estado_produccion enum('en_produccion', 'limitado', 'concept', 'agotado') not null default 'limitado',
    constraint fk_hiperauto_fabricante foreign key (id_fabricante) references fabricantes_hiperautos(id_fabricante) on delete restrict on update cascade,
    constraint chk_potencia check (potencia_hp > 500),
    constraint chk_precio check (precio_usd > 0.00)
);


create table tecnologias_hiperautos (
    id_tecnologia int primary key auto_increment,
    id_hiperauto int not null,
    nombre_tecnologia varchar(60) not null,
    tipo_sistema varchar(40) not null,
    constraint fk_tecnologia_hiperauto foreign key (id_hiperauto) references hiperautos(id_hiperauto) on delete cascade on update cascade
);