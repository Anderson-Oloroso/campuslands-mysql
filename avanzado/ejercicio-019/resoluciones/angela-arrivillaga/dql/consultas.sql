use paracaidismo_db;

-- 1. consulta general de saltos de paracaidismo con detalles de equipos y instructores ordenados por fecha
select 
    s.id_salto,
    s.paracaidista_nombre,
    e.numero_serie,
    e.modelo_equipo,
    s.altura_salto_pies,
    s.instructor_encargado,
    s.estado_salto,
    s.fecha_salto
from saltos_paracaidismo s
join equipos_paracaidas e on s.id_equipo = e.id_equipo
order by s.fecha_salto desc;

-- 2. consulta filtrada de equipos que se encuentran disponibles para saltos con más de 50 saltos acumulados
select 
    numero_serie,
    modelo_equipo,
    estado_equipo,
    saltos_acumulados
from equipos_paracaidas
where estado_equipo = 'disponible' and saltos_acumulados >= 50
order by saltos_acumulados desc;

-- 3. reporte estadístico agrupado por instructor encargado con conteo de saltos y promedio de altura en pies
select 
    instructor_encargado,
    count(id_salto) as total_saltos_asignados,
    round(avg(altura_salto_pies), 2) as altura_promedio_pies,
    sum(case when estado_salto = 'completado' then 1 else 0 end) as saltos_completados
from saltos_paracaidismo
group by instructor_encargado
order by total_saltos_asignados desc;

-- 4. top 5 de equipos de paracaidismo con mayor cantidad de saltos acumulados en la academia
select 
    numero_serie,
    modelo_equipo,
    estado_equipo,
    saltos_acumulados
from equipos_paracaidas
order by saltos_acumulados desc
limit 5;

-- 5. consulta de auditoría de la bitácora de mantenimiento y eventos automáticos generados por los triggers
select 
    b.id_bitacora,
    e.numero_serie,
    b.descripcion_evento,
    b.fecha_evento
from bitacora_mantenimiento_equipos b
join equipos_paracaidas e on b.id_equipo = e.id_equipo
order by b.fecha_evento desc;