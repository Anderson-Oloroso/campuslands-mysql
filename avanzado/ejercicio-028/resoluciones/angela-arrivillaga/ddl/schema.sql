create database if not exists academia_tech_json_db;
use academia_tech_json_db;

-- 1. tabla de modulos o rutas de aprendizaje de la academia
create table rutas_aprendizaje (
    id_ruta int primary key auto_increment,
    nombre_ruta varchar(60) not null unique,
    nivel_dificultad enum('junior', 'semi_senior', 'senior', 'especialista') not null default 'junior'
);

-- 2. tabla de estudiantes registrados en la academia tech
create table estudiantes (
    id_estudiante int primary key auto_increment,
    id_ruta int not null,
    nombre_completo varchar(80) not null,
    correo varchar(90) not null unique,
    estado_estudiante enum('activo', 'pausado', 'graduado', 'retirado') not null default 'activo',
    constraint fk_estudiante_ruta foreign key (id_ruta) references rutas_aprendizaje(id_ruta) on delete restrict on update cascade
);

-- 3. tabla principal de evaluaciones y perfiles con columnas de tipo json para metadatos flexibles
create table evaluaciones_estudiantes (
    id_evaluacion int primary key auto_increment,
    id_estudiante int not null,
    titulo_modulo varchar(80) not null,
    puntaje_final decimal(5,2) not null,
    -- campo json para almacenar detalles de competencias (ej. array de habilidades y niveles)
    competencias_json json not null,
    -- campo json para almacenar metadatos de configuracion o preferencias del estudiante (ej. IDE, tema, tecnologias secundarias)
    configuracion_json json not null,
    fecha_evaluacion datetime not null default current_timestamp,
    constraint fk_evaluacion_estudiante foreign key (id_estudiante) references estudiantes(id_estudiante) on delete cascade on update cascade,
    constraint chk_puntaje_valido check (puntaje_final between 0.00 and 100.00)
);