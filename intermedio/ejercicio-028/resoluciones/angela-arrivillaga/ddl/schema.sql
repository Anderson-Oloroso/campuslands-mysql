create database if not exists academia_tech_db;
use academia_tech_db;

create table estudiantes (
    id_estudiante int primary key auto_increment,
    documento_identidad varchar(20) not null unique,
    nombre_completo varchar(100) not null,
    correo_electronico varchar(100) not null unique,
    estado_estudiante enum('activo', 'graduado', 'suspendido', 'retirado') default 'activo'
);

create table cursos (
    id_curso int primary key auto_increment,
    codigo_curso varchar(20) not null unique,
    nombre_curso varchar(100) not null,
    duracion_horas int not null,
    costo_curso decimal(10,2) not null,
    constraint chk_duracion_curso check (duracion_horas > 0),
    constraint chk_costo_curso check (costo_curso >= 0.00)
);

create table estudiantes_cursos (
    id_inscripcion int primary key auto_increment,
    id_estudiante int not null,
    id_curso int not null,
    fecha_inscripcion date not null,
    calificacion_final decimal(4,2) default null,
    estado_inscripcion enum('cursando', 'aprobado', 'reprobado') default 'cursando',
    constraint fk_inscripcion_estudiante foreign key (id_estudiante) references estudiantes(id_estudiante) on delete cascade on update cascade,
    constraint fk_inscripcion_curso foreign key (id_curso) references cursos(id_curso) on delete cascade on update cascade,
    constraint uk_estudiante_curso unique (id_estudiante, id_curso),
    constraint chk_calificacion check (calificacion_final between 0.00 and 100.00)
);