use taller_mecanico_motos_db;

-- 1. Subconsulta en el WHERE para encontrar aquellas órdenes de reparación cuyo costo sea superior al costo promedio de todas las órdenes registradas
select 
    id_orden,
    id_moto,
    descripcion_servicio,
    costo_total,
    estado_orden,
    fecha_ingreso
from ordenes_reparacion
where costo_total > (select avg(costo_total) from ordenes_reparacion)
order by costo_total desc;

-- 2. Subconsulta con IN para listar los clientes que poseen al menos una motocicleta registrada con un año de fabricación anterior a 2023
select 
    id_cliente,
    nombre_cliente,
    telefono,
    correo
from clientes_taller
where id_cliente in (
    select id_cliente 
    from motos_cliente 
    where anio < 2023
);

-- 3. Subconsulta correlacionada en el SELECT para mostrar cada orden junto con la diferencia de su costo respecto al costo máximo general del taller
select 
    id_orden,
    id_moto,
    descripcion_servicio,
    costo_total,
    (select max(costo_total) from ordenes_reparacion) - costo_total as diferencia_respecto_maximo
from ordenes_reparacion
order by costo_total desc;

-- 4. Subconsulta con NOT IN para identificar clientes que NO tienen ninguna orden de reparación activa o completada registrada en el taller
select 
    c.id_cliente,
    c.nombre_cliente,
    c.telefono
from clientes_taller c
where c.id_cliente not in (
    select m.id_cliente 
    from motos_cliente m 
    join ordenes_reparacion o on m.id_moto = o.id_moto
);

-- 5. Subconsulta en el FROM (tabla derivada) para obtener el promedio de costos de las órdenes agrupadas por estado de reparación
select 
    resumen_estados.estado_orden,
    resumen_estados.total_ordenes,
    resumen_estados.costo_promedio
from (
    select 
        estado_orden,
        count(*) as total_ordenes,
        round(avg(costo_total), 2) as costo_promedio
    from ordenes_reparacion
    group by estado_orden
) as resumen_estados
order by resumen_estados.costo_promedio desc;