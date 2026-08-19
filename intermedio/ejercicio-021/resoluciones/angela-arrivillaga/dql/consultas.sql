use dibujo_digital_db;

select codigo_lienzo, titulo_obra, software_utilizado, resolucion_ancho, resolucion_alto, capas_totales, tiempo_horas, estado_proyecto
from lienzos_digitales
where estado_proyecto = 'finalizado'
order by tiempo_horas desc;

select codigo_lienzo, titulo_obra, software_utilizado, capas_totales, tiempo_horas, estado_proyecto
from lienzos_digitales
where capas_totales > 35
order by capas_totales desc;

select 
    l.codigo_lienzo,
    l.titulo_obra,
    l.software_utilizado,
    e.nombre_etiqueta,
    l.estado_proyecto
from lienzos_digitales l
join etiquetas_lienzo e on l.id_lienzo = e.id_lienzo
where l.software_utilizado = 'Clip Studio Paint'
order by l.titulo_obra asc;

select codigo_lienzo, titulo_obra, software_utilizado, tiempo_horas, estado_proyecto
from lienzos_digitales
where estado_proyecto not in ('borrador', 'archivado')
order by tiempo_horas desc;

select 
    software_utilizado,
    count(*) as total_proyectos,
    round(avg(capas_totales), 1) as promedio_capas,
    concat(sum(tiempo_horas), ' hrs') as tiempo_total_invertido
from lienzos_digitales
group by software_utilizado
order by sum(tiempo_horas) desc;