create database if not exists kickboxing_fk_db;
use kickboxing_fk_db;

create table gimnasios (
    id_gimnasio int primary key auto_increment,
    nombre_gimnasio varchar(60) not null unique,
    ciudad varchar(40) not null,
    director_entrenador varchar(60) not null
);

create table categorias_peso (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null, -- ej: K1 Peso Ligero (-65kg), Full Contact Welter (-75kg)
    modalidad enum('k1', 'low_kick', 'full_contact', 'point_fighting') not null,
    peso_limite_kg decimal(5,2) not null,
    constraint chk_peso check (peso_limite_kg > 0)
);

create table luchadores (
    id_luchador int primary key auto_increment,
    id_gimnasio int not null,
    id_categoria int not null,
    nombre_completo varchar(70) not null,
    edad int not null,
    peleas_ganadas int not null default 0,
    peleas_perdidas int not null default 0,
    estado enum('activo', 'lesionado', 'retirado') not null default 'activo',
    constraint fk_luchador_gimnasio foreign key (id_gimnasio) references gimnasios(id_gimnasio) on delete restrict on update cascade,
    constraint fk_luchador_categoria foreign key (id_categoria) references categorias_peso(id_categoria) on delete restrict on update cascade,
    constraint chk_edad check (edad >= 16),
    constraint chk_ganadas check (peleas_ganadas >= 0),
    constraint chk_perdidas check (peleas_perdidas >= 0)
);

create table eventos (
    id_evento int primary key auto_increment,
    nombre_evento varchar(70) not null,
    fecha_evento date not null,
    ciudad_sede varchar(40) not null
);

create table combates (
    id_combate int primary key auto_increment,
    id_evento int not null,
    id_luchador_azul int not null,
    id_luchador_rojo int not null,
    id_categoria int not null,
    resultado_metodo enum('ko', 'tko', 'decision_unanime', 'decision_dividida', 'empate') not null,
    id_ganador int null, 
    duracion_rounds int not null default 3,
    constraint fk_combate_evento foreign key (id_evento) references eventos(id_evento) on delete cascade on update cascade,
    constraint fk_combate_azul foreign key (id_luchador_azul) references luchadores(id_luchador) on delete restrict on update cascade,
    constraint fk_combate_rojo foreign key (id_luchador_rojo) references luchadores(id_luchador) on delete restrict on update cascade,
    constraint fk_combate_categoria foreign key (id_categoria) references categorias_peso(id_categoria) on delete restrict on update cascade,
    constraint fk_combate_ganador foreign key (id_ganador) references luchadores(id_luchador) on delete set null on update cascade,
    constraint chk_luchadores_distintos check (id_luchador_azul <> id_luchador_rojo),
    constraint chk_duracion check (duracion_rounds > 0)
);