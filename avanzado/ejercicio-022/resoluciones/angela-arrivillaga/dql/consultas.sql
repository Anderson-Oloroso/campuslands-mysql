use animacion_3d_vistas_db;

-- 1. Consulta consultando directamente la Vista de Rendimiento de Animadores ordenada por presupuesto acumulado
select 
    nombre_completo,
    especialidad,
    nivel,
    total_proyectos,
    frames_producidos_totales,
    presupuesto_acumulado_usd
from vw_rendimiento_animadores
order by presupuesto_acumulado_usd desc;

-- 2. Consulta filtrando la Vista de Detalle de Proyectos Activos (proyectos con más de 1000 frames)
select 
    nombre_proyecto,
    animador_responsable,
    software_utilizado,
    estado_proyecto,
    frames_totales,
    duracion_segundos,
    presupuesto_usd
from vw_detalle_proyectos_activos
where frames_totales >= 1000
order by frames_totales desc;

-- 3. Consulta cruzando múltiples vistas avanzadas para obtener un reporte completo de producción y complejidad poligonal
select 
    p.nombre_proyecto,
    p.animador_responsable,
    p.software_utilizado,
    c.total_assets_asignados,
    c.poligono_total_escena,
    p.presupuesto_usd
from vw_detalle_proyectos_activos p
join vw_complejidad_proyectos_assets c on p.id_proyecto = c.id_proyecto
order by c.poligono_total_escena desc;

-- 4. Consulta analítica agrupando por tipo de motor de software 3D mediante las vistas e información base
select 
    s.tipo_motor,
    count(p.id_proyecto) as total_proyectos,
    round(avg(p.presupuesto_usd), 2) as presupuesto_promedio_usd
from proyectos_animacion p
join software_3d s on p.id_software = s.id_software
group by s.tipo_motor
order by presupuesto_promedio_usd desc;

-- 5. Consulta de Ranking (Top 3) de proyectos con mayor carga poligonal usando la vista de complejidad
select 
    nombre_proyecto,
    total_assets_asignados,
    poligono_total_escena
from vw_complejidad_proyectos_assets
order by poligono_total_escena desc
limit 3;