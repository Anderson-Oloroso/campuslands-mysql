use viajes_turismo_db;

-- 1. consulta general de paquetes de turismo utilizando la función almacenada fn_calcular_costo_por_dia para ver el costo diario exacto
select 
    p.nombre_paquete,
    d.nombre_destino,
    d.pais,
    p.duracion_dias,
    p.precio_paquete,
    fn_calcular_costo_por_dia(p.precio_paquete, p.duracion_dias) as costo_diario_calculado,
    p.cupos_disponibles,
    p.estado_paquete
from paquetes_viaje p
join destinos_turisticos d on p.id_destino = d.id_destino
order by p.precio_paquete desc;

-- 2. consulta filtrada aplicando la función fn_calcular_descuento_paquete para mostrar ofertas en paquetes disponibles
select 
    p.nombre_paquete,
    d.nombre_destino,
    p.precio_paquete,
    fn_calcular_descuento_paquete(p.precio_paquete) as monto_descuento_dolares,
    (p.precio_paquete - fn_calcular_descuento_paquete(p.precio_paquete)) as precio_final_con_descuento,
    p.estado_paquete
from paquetes_viaje p
join destinos_turisticos d on p.id_destino = d.id_destino
where p.estado_paquete = 'disponible'
order by precio_final_con_descuento desc;

-- 3. reporte estadístico agrupado por nivel de popularidad del destino turístico con conteos y precios promedio
select 
    d.nivel_popularidad,
    count(p.id_paquete) as total_paquetes_asociados,
    round(avg(p.precio_paquete), 2) as precio_promedio_paquete,
    sum(p.cupos_disponibles) as total_cupos_disponibles
from destinos_turisticos d
left join paquetes_viaje p on d.id_destino = p.id_destino
group by d.nivel_popularidad
order by precio_promedio_paquete desc;

-- 4. top 5 de paquetes turísticos más exclusivos y costosos utilizando funciones y ordenamiento
select 
    p.nombre_paquete,
    d.nombre_destino,
    d.pais,
    p.duracion_dias,
    p.precio_paquete,
    fn_calcular_costo_por_dia(p.precio_paquete, p.duracion_dias) as tarifa_diaria
from paquetes_viaje p
join destinos_turisticos d on p.id_destino = d.id_destino
order by p.precio_paquete desc
limit 5;

-- 5. consulta de validación de destinos con paquetes agotados o con cupos limitados (menor o igual a 10 cupos)
select 
    p.nombre_paquete,
    d.nombre_destino,
    p.cupos_disponibles,
    p.estado_paquete
from paquetes_viaje p
join destinos_turisticos d on p.id_destino = d.id_destino
where p.cupos_disponibles <= 10
order by p.cupos_disponibles asc;