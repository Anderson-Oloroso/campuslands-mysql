use animacion_3d_db;

-- consulta 1
select p.codigo_proyecto, p.titulo_proyecto, m.nombre_motor, p.duracion_segundos, p.estado_produccion
from proyectos_animacion p
join motores_render m on p.id_motor = m.id_motor
where p.estado_produccion = 'finalizado'
order by p.duracion_segundos desc;

-- consulta 2
select p.codigo_proyecto, p.titulo_proyecto, m.nombre_motor, r.nombre_secuencia, r.tiempo_render_horas
from renders_secuencias r
join proyectos_animacion p on r.id_proyecto = p.id_proyecto
join motores_render m on p.id_motor = m.id_motor
where r.tiempo_render_horas > 15.00
order by r.tiempo_render_horas desc;

-- consulta 3
select p.codigo_proyecto, p.titulo_proyecto, sum(r.peso_gigabytes) as peso_total_gb
from proyectos_animacion p
join renders_secuencias r on p.id_proyecto = r.id_proyecto
group by p.id_proyecto, p.codigo_proyecto, p.titulo_proyecto
order by peso_total_gb desc;

-- consulta 4
select p.codigo_proyecto, p.titulo_proyecto, m.nombre_motor, p.estado_produccion
from proyectos_animacion p
join motores_render m on p.id_motor = m.id_motor
where p.estado_produccion not in ('pre_produccion', 'finalizado')
order by p.codigo_proyecto asc;

-- consulta 5
select 
    m.nombre_motor,
    count(p.id_proyecto) as total_proyectos,
    round(avg(p.duracion_segundos), 2) as duracion_promedio_seg
from motores_render m
left join proyectos_animacion p on m.id_motor = p.id_motor
group by m.id_motor, m.nombre_motor
order by total_proyectos desc;