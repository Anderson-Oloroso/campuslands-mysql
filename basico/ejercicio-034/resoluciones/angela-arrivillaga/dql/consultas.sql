use garaje_motos_db;

-- listado general de motocicletas ordenadas por kilometraje descendente
select g.placa, g.marca, g.modelo, t.categoria_motor, g.kilometraje, g.tarifa_mantenimiento, g.estado_operativo
from garaje_motos g
join tipos_motor t on g.id_tipo_motor = t.id_tipo_motor
order by g.kilometraje desc;

-- consulta de motos activas en servicio con tarifas superiores a cincuenta unidades monetarias
select g.placa, g.marca, g.modelo, t.categoria_motor, g.tarifa_mantenimiento
from garaje_motos g
join tipos_motor t on g.id_tipo_motor = t.id_tipo_motor
where g.tarifa_mantenimiento > 50.00 and g.estado_operativo = 'en servicio'
order by g.tarifa_mantenimiento desc;

-- resumen estadistico de cantidad de motos, kilometraje promedio y tarifa acumulada agrupada por tipo de motor
select 
    t.categoria_motor,
    count(g.id_moto) as total_motos,
    round(avg(g.kilometraje), 2) as kilometraje_promedio,
    sum(g.tarifa_mantenimiento) as tarifa_acumulada
from tipos_motor t
left join garaje_motos g on t.id_tipo_motor = g.id_tipo_motor
group by t.id_tipo_motor, t.categoria_motor
order by tarifa_acumulada desc;

-- top cinco de motos con menor kilometraje en el garaje tecnico
select g.placa, g.marca, g.modelo, t.categoria_motor, g.kilometraje, g.anio_fabricacion
from garaje_motos g
join tipos_motor t on g.id_tipo_motor = t.id_tipo_motor
order by g.kilometraje asc
limit 5;

-- reporte de motocicletas que se encuentran actualmente bajo procesos de reparacion o fuera de servicio
select g.placa, g.marca, g.modelo, t.categoria_motor, g.estado_operativo, g.tarifa_mantenimiento
from garaje_motos g
join tipos_motor t on g.id_tipo_motor = t.id_tipo_motor
where g.estado_operativo in ('en reparacion', 'fuera de servicio')
order by g.tarifa_mantenimiento desc;