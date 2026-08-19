use saga_sci_fi_db;

-- 1. consulta general detallada del estado de las misiones espaciales ordenadas por presupuesto en creditos de forma descendente
select 
    m.nombre_mision,
    s.nombre_sector,
    s.nivel_peligro,
    m.comandante,
    m.presupuesto_creditos,
    m.nivel_exito_estimado,
    m.estado_mision,
    m.fecha_lanzamiento
from misiones_espaciales m
join sectores_galaxia s on m.id_sector = s.id_sector
order by m.presupuesto_creditos desc;

-- 2. consulta filtrada de misiones activas en curso ubicadas en sectores con nivel de peligro critico
select 
    m.nombre_mision,
    s.nombre_sector,
    m.comandante,
    m.presupuesto_creditos,
    m.nivel_exito_estimado,
    m.estado_mision
from misiones_espaciales m
join sectores_galaxia s on m.id_sector = s.id_sector
where s.nivel_peligro = 'critico' and m.estado_mision = 'en curso'
order by m.nivel_exito_estimado asc;

-- 3. reporte estadistico agrupado por nivel de peligro del sector galactico con conteos, presupuesto total y promedio de exito
select 
    s.nivel_peligro,
    count(m.id_mision) as total_misiones,
    sum(m.presupuesto_creditos) as presupuesto_acumulado_creditos,
    round(avg(m.nivel_exito_estimado), 2) as promedio_exito_sector
from sectores_galaxia s
left join misiones_espaciales m on s.id_sector = m.id_sector
group by s.nivel_peligro
order by presupuesto_acumulado_creditos desc;

-- 4. top cinco de misiones espaciales ordenadas por el mayor porcentaje de exito estimado en la galaxia
select 
    m.nombre_mision,
    s.nombre_sector,
    m.comandante,
    m.nivel_exito_estimado,
    m.presupuesto_creditos,
    m.estado_mision
from misiones_espaciales m
join sectores_galaxia s on m.id_sector = s.id_sector
order by m.nivel_exito_estimado desc
limit 5;

-- 5. consulta de auditoria sobre la bitacora de eventos automatica generada por el event scheduler de mysql
select 
    id_evento,
    descripcion_evento,
    fecha_ejecucion
from bitacora_eventos_scheduler
order by fecha_ejecucion desc;