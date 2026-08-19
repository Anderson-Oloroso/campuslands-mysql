create database if not exists saga_sci_fi_db;
use saga_sci_fi_db;

create table sectores_galaxia (
    id_sector int primary key auto_increment,
    nombre_sector varchar(40) not null unique,
    nivel_peligro enum('bajo', 'moderado', 'critico') not null default 'moderado'
);

create table misiones_espaciales (
    id_mision int primary key auto_increment,
    nombre_mision varchar(80) not null,
    id_sector int not null,
    comandante varchar(60) not null,
    presupuesto_creditos decimal(12,2) not null,
    nivel_exito_estimado decimal(5,2) not null, -- porcentaje de 0.00 a 100.00
    estado_mision enum('planificada', 'en curso', 'completada', 'abortada') default 'planificada',
    fecha_lanzamiento datetime not null,
    constraint fk_mision_sector foreign key (id_sector) references sectores_galaxia(id_sector) on delete restrict on update cascade,
    constraint chk_presupuesto_mision check (presupuesto_creditos >= 0.00),
    constraint chk_exito check (nivel_exito_estimado between 0.00 and 100.00)
);

-- tabla de auditoria o registro de eventos automaticos del scheduler
create table bitacora_eventos_scheduler (
    id_evento int primary key auto_increment,
    descripcion_evento varchar(255) not null,
    fecha_ejecucion datetime not null default current_timestamp
);