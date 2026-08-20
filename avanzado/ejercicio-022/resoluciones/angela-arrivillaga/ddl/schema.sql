create database if not exists animacion_3d_vistas_db;
use animacion_3d_vistas_db;

-- 1. Tabla de Artistas / Animadores 3D
create table animadores (
    id_animador int primary key auto_increment,
    nombre_completo varchar(80) not null,
    especialidad varchar(50) not null,
    correo varchar(90) not null unique,
    nivel enum('junior', 'semi-senior', 'senior', 'lead') not null default 'semi-senior'
);

-- 2. Tabla de Software / Motores 3D
create table software_3d (
    id_software int primary key auto_increment,
    nombre_software varchar(50) not null unique,
    desarrollador varchar(60) not null,
    tipo_motor enum('offline_renderer', 'realtime_engine', 'hybrid') not null
);

-- 3. Tabla principal de Proyectos de Animación 3D
create table proyectos_animacion (
    id_proyecto int primary key auto_increment,
    id_animador int not null,
    id_software int not null,
    nombre_proyecto varchar(90) not null,
    frames_totales int not null,
    fps_configurados int not null default 24,
    presupuesto_usd decimal(10,2) not null,
    estado_proyecto enum('en_desarrollo', 'renderizando', 'completado', 'cancelado') not null default 'en_desarrollo',
    fecha_entrega date not null,
    constraint fk_proy_animador foreign key (id_animador) references animadores(id_animador) on delete cascade on update cascade,
    constraint fk_proy_software foreign key (id_software) references software_3d(id_software) on delete restrict on update cascade,
    constraint chk_frames check (frames_totales > 0),
    constraint chk_fps check (fps_configurados in (24, 30, 60)),
    constraint chk_presupuesto check (presupuesto_usd >= 0.00)
);

-- 4. Tabla de Activos / Assets 3D (Relación N:M con proyectos)
create table assets_3d (
    id_asset int primary key auto_increment,
    nombre_asset varchar(60) not null unique,
    tipo_asset enum('personaje', 'prop', 'escenario', 'rig_facial') not null,
    poligonos int not null,
    constraint chk_poligonos check (poligonos >= 0)
);

create table proyectos_assets (
    id_proyecto int not null,
    id_asset int not null,
    cantidad_instancias int not null default 1,
    primary key (id_proyecto, id_asset),
    constraint fk_pa_proyecto foreign key (id_proyecto) references proyectos_animacion(id_proyecto) on delete cascade on update cascade,
    constraint fk_pa_asset foreign key (id_asset) references assets_3d(id_asset) on delete cascade on update cascade,
    constraint chk_instancias check (cantidad_instancias > 0)
);

-- VISTAS AVANZADAS

-- Vista 1: Resumen financiero y de producción por animador
create view vw_rendimiento_animadores as
select 
    a.id_animador,
    a.nombre_completo,
    a.especialidad,
    a.nivel,
    count(p.id_proyecto) as total_proyectos,
    coalesce(sum(p.frames_totales), 0) as frames_producidos_totales,
    coalesce(sum(p.presupuesto_usd), 0.00) as presupuesto_acumulado_usd
from animadores a
left join proyectos_animacion p on a.id_animador = p.id_animador
group by a.id_animador, a.nombre_completo, a.especialidad, a.nivel;

-- Vista 2: Auditoría y detalle técnico de proyectos activos o completados
create view vw_detalle_proyectos_activos as
select 
    p.id_proyecto,
    p.nombre_proyecto,
    a.nombre_completo as animador_responsable,
    s.nombre_software as software_utilizado,
    p.estado_proyecto,
    p.frames_totales,
    p.fps_configurados,
    round(p.frames_totales / p.fps_configurados, 2) as duracion_segundos,
    p.presupuesto_usd,
    p.fecha_entrega
from proyectos_animacion p
join animadores a on p.id_animador = a.id_animador
join software_3d s on p.id_software = s.id_software
where p.estado_proyecto in ('en_desarrollo', 'renderizando', 'completado');

-- Vista 3: Complejidad y conteo de polígonos por proyecto (vistas avanzadas con agregación de assets)
create view vw_complejidad_proyectos_assets as
select 
    p.id_proyecto,
    p.nombre_proyecto,
    count(pa.id_asset) as total_assets_asignados,
    sum(coalesce(ast.poligonos, 0) * pa.cantidad_instancias) as poligono_total_escena
from proyectos_animacion p
left join proyectos_assets pa on p.id_proyecto = pa.id_proyecto
left join assets_3d ast on pa.id_asset = ast.id_asset
group by p.id_proyecto, p.nombre_proyecto;