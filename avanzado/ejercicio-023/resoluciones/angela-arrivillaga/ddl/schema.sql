create database if not exists arquitectura_3d_roles_db;
use arquitectura_3d_roles_db;

-- 1. Tabla de Arquitectos / Diseñadores 3D
create table arquitectos (
    id_arquitecto int primary key auto_increment,
    nombre_completo varchar(80) not null,
    especialidad varchar(50) not null,
    correo varchar(90) not null unique,
    nivel_seniority enum('junior', 'semi-senior', 'senior', 'principal') not null default 'semi-senior'
);

-- 2. Tabla de Software / Motores CAD y Render 3D
create table software_cad (
    id_software int primary key auto_increment,
    nombre_software varchar(50) not null unique,
    desarrollador varchar(60) not null,
    categoria enum('bim', 'cad_3d', 'renderizador', 'postproduccion') not null
);

-- 3. Tabla principal de Proyectos de Arquitectura 3D
create table proyectos_arquitectura (
    id_proyecto int primary key auto_increment,
    id_arquitecto int not null,
    id_software int not null,
    nombre_proyecto varchar(90) not null,
    superficie_m2 decimal(8,2) not null,
    presupuesto_usd decimal(12,2) not null,
    estado_proyecto enum('anteproyecto', 'en_desarrollo', 'render_final', 'entregado') not null default 'anteproyecto',
    fecha_inicio date not null,
    constraint fk_proy_arquitecto foreign key (id_arquitecto) references arquitectos(id_arquitecto) on delete cascade on update cascade,
    constraint fk_proy_software foreign key (id_software) references software_cad(id_software) on delete restrict on update cascade,
    constraint chk_superficie check (superficie_m2 > 0.00),
    constraint chk_presupuesto check (presupuesto_usd >= 0.00)
);

-- 4. Tabla de Modelos y Componentes 3D (Relación N:M)
create table componentes_3d (
    id_componente int primary key auto_increment,
    nombre_componente varchar(60) not null unique,
    tipo_elemento enum('mobiliario', 'estructura', 'iluminacion', 'material_pbr') not null,
    peso_archivo_mb decimal(6,2) not null,
    constraint chk_peso_archivo check (peso_archivo_mb > 0.00)
);

create table proyectos_componentes (
    id_proyecto int not null,
    id_componente int not null,
    cantidad int not null default 1,
    primary key (id_proyecto, id_componente),
    constraint fk_pc_proyecto foreign key (id_proyecto) references proyectos_arquitectura(id_proyecto) on delete cascade on update cascade,
    constraint fk_pc_componente foreign key (id_componente) references componentes_3d(id_componente) on delete cascade on update cascade,
    constraint chk_cantidad check (cantidad > 0)
);

-- GESTIÓN DE ROLES Y PERMISOS EN MYSQL (DCL)

-- Crear Roles especializados para la Arquitectura 3D
create role if not exists 'rol_arquitecto_senior', 'rol_render_artist', 'rol_auditor_proyectos';

-- Asignar privilegios específicos al rol de Arquitecto Senior (Control total de proyectos y componentes)
grant select, insert, update, delete on arquitectura_3d_roles_db.proyectos_arquitectura to 'rol_arquitecto_senior';
grant select, insert, update on arquitectura_3d_roles_db.componentes_3d to 'rol_arquitecto_senior';
grant select on arquitectura_3d_roles_db.arquitectos to 'rol_arquitecto_senior';
grant select on arquitectura_3d_roles_db.software_cad to 'rol_arquitecto_senior';

-- Asignar privilegios al rol de Render Artist (Consulta y actualización de renders/estados)
grant select, update (estado_proyecto) on arquitectura_3d_roles_db.proyectos_arquitectura to 'rol_render_artist';
grant select on arquitectura_3d_roles_db.componentes_3d to 'rol_render_artist';
grant select on arquitectura_3d_roles_db.software_cad to 'rol_render_artist';

-- Asignar privilegios al rol de Auditor (Solo lectura en todas las tablas para reportes gerenciales)
grant select on arquitectura_3d_roles_db.* to 'rol_auditor_proyectos';

-- Aplicar cambios de privilegios
flush privileges;