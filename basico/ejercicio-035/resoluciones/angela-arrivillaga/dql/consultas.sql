use taller_mecanico_motos_db;

-- reporte completo de ordenes de reparacion unidas con su tipo de servicio y ordenadas por costo total descendente
select o.codigo_orden, o.propietario_nombre, o.moto_modelo, o.placa_moto, t.nombre_servicio, o.costo_total, o.estado_reparacion
from ordenes_reparacion o
join tipos_servicio t on o.id_tipo_servicio = t.id_tipo_servicio
order by o.costo_total desc;

-- consulta de ordenes de reparacion filtradas por estado activo o en proceso con costos superiores a sesenta unidades monetarias
select o.codigo_orden, o.propietario_nombre, o.moto_modelo, t.nombre_servicio, o.costo_total, o.estado_reparacion
from ordenes_reparacion o
join tipos_servicio t on o.id_tipo_servicio = t.id_tipo_servicio
where o.estado_reparacion in ('en proceso', 'pendiente') and o.costo_total > 60.00
order by o.costo_total asc;

-- resumen estadistico de cantidad de ordenes, costo promedio e ingresos acumulados agrupados por tipo de servicio mecanico
select 
    t.nombre_servicio,
    count(o.id_orden) as total_ordenes,
    round(avg(o.costo_total), 2) as costo_promedio,
    sum(o.costo_total) as ingresos_acumulados
from tipos_servicio t
left join ordenes_reparacion o on t.id_tipo_servicio = o.id_tipo_servicio
group by t.id_tipo_servicio, t.nombre_servicio
order by ingresos_acumulados desc;

-- top cinco de ordenes de reparacion con mayor costo total facturado en el taller
select o.codigo_orden, o.propietario_nombre, o.moto_modelo, t.nombre_servicio, o.costo_total, o.fecha_ingreso
from ordenes_reparacion o
join tipos_servicio t on o.id_tipo_servicio = t.id_tipo_servicio
order by o.costo_total desc
limit 5;

-- reporte de auditoria y control para ordenes que ya han sido finalizadas o entregadas exitosamente
select o.codigo_orden, o.propietario_nombre, o.moto_modelo, t.nombre_servicio, o.estado_reparacion, o.fecha_ingreso
from ordenes_reparacion o
join tipos_servicio t on o.id_tipo_servicio = t.id_tipo_servicio
where o.estado_reparacion in ('finalizado', 'entregado')
order by o.fecha_ingreso asc;