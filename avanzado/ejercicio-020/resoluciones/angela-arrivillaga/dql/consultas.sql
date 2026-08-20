use estudio_tatuajes_db;

-- 1. Consulta general de citas con uso del índice de fechas (idx_citas_fecha) para ver detalles de clientes y tatuadores ordenados cronológicamente
select 
    c.id_cita,
    cl.nombre_cliente,
    t.nombre_completo as tatuador,
    c.estilo_tatuaje,
    c.precio_estimado,
    c.estado_cita,
    c.fecha_cita
from citas_tatuaje c
join clientes cl on c.id_cliente = cl.id_cliente
join tatuadores t on c.id_tatuador = t.id_tatuador
order by c.fecha_cita desc;

-- 2. Consulta optimizada usando el índice compuesto (idx_citas_estado_tatuador) para filtrar citas completadas de un tatuador específico
select 
    c.id_cita,
    cl.nombre_cliente,
    t.nombre_completo as tatuador,
    c.estilo_tatuaje,
    c.precio_estimado,
    c.fecha_cita
from citas_tatuaje c
join clientes cl on c.id_cliente = cl.id_cliente
join tatuadores t on c.id_tatuador = t.id_tatuador
where c.estado_cita = 'completada' and t.id_tatuador = 1;

-- 3. Reporte estadístico agrupado por tatuador con ingresos totales estimados, promedio por trabajo y volumen de citas
select 
    t.nombre_completo as tatuador,
    t.especialidad,
    count(c.id_cita) as total_citas_asignadas,
    sum(c.precio_estimado) as ingresos_totales_estimados,
    round(avg(c.precio_estimado), 2) as precio_promedio_cita
from tatuadores t
left join citas_tatuaje c on t.id_tatuador = c.id_tatuador
group by t.id_tatuador, t.nombre_completo, t.especialidad
order by ingresos_totales_estimados desc;

-- 4. Top 5 de tatuadores con mayor experiencia laboral y su estado actual en el estudio
select 
    nombre_completo,
    especialidad,
    anios_experiencia,
    estado_laboral
from tatuadores
order by anios_experiencia desc
limit 5;

-- 5. Consulta de búsqueda rápida de clientes utilizando el índice en correo electrónico (idx_clientes_correo)
select 
    id_cliente,
    nombre_cliente,
    correo_electronico,
    telefono,
    fecha_registro
from clientes
where correo_electronico like '%@campus.com'
order by fecha_registro asc;