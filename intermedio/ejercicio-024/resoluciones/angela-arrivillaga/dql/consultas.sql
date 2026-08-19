use soldadura_db;

-- consulta 1
select j.codigo_junta, p.nombre_proceso, s.nombre_soldador, j.material_base, j.estado_inspeccion
from juntas_soldadas j
join procesos_soldadura p on j.id_proceso = p.id_proceso
join soldadores s on j.id_soldador = s.id_soldador
where j.estado_inspeccion = 'aprobada'
order by j.codigo_junta asc;

-- consulta 2
select j.codigo_junta, p.nombre_proceso, j.material_base, j.espesor_mm, j.amperaje_usado
from juntas_soldadas j
join procesos_soldadura p on j.id_proceso = p.id_proceso
where j.espesor_mm > 10.00
order by j.espesor_mm desc;

-- consulta 3
select 
    s.nombre_soldador,
    s.certificacion,
    count(j.id_junta) as total_juntas_asignadas,
    sum(case when j.estado_inspeccion = 'aprobada' then 1 else 0 end) as juntas_aprobadas
from soldadores s
left join juntas_soldadas j on s.id_soldador = j.id_soldador
group by s.id_soldador, s.nombre_soldador, s.certificacion
order by total_juntas_asignadas desc;

-- consulta 4
select j.codigo_junta, s.nombre_soldador, j.material_base, j.estado_inspeccion
from juntas_soldadas j
join soldadores s on j.id_soldador = s.id_soldador
where j.estado_inspeccion not in ('aprobada', 'rechazada')
order by j.codigo_junta asc;

-- consulta 5
select 
    p.nombre_proceso,
    count(j.id_junta) as total_juntas,
    round(avg(j.espesor_mm), 2) as espesor_promedio_mm,
    round(avg(j.amperaje_usado), 0) as amperaje_promedio
from procesos_soldadura p
left join juntas_soldadas j on p.id_proceso = j.id_proceso
group by p.id_proceso, p.nombre_proceso
order by total_juntas desc;