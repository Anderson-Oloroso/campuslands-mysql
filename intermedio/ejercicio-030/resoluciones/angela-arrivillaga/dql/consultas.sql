use equipo_streaming_db;

-- consulta de inventario completo de equipos con su categoria marca y precio
select d.codigo_serial, d.nombre_dispositivo, c.nombre_categoria, m.nombre_marca, d.precio_dolares, d.estado_dispositivo
from dispositivos_streaming d
join categorias_equipo c on d.id_categoria = c.id_categoria
join marcas_hardware m on d.id_marca = m.id_marca
order by d.precio_dolares desc;

-- reporte de equipos operativos listos para transmision en vivo
select d.codigo_serial, d.nombre_dispositivo, m.nombre_marca, d.precio_dolares
from dispositivos_streaming d
join marcas_hardware m on d.id_marca = m.id_marca
where d.estado_dispositivo = 'operativo'
order by d.precio_dolares asc;

-- reporte estadistico de costo promedio y cantidad de dispositivos agrupados por categoria
select 
    c.nombre_categoria,
    count(d.id_dispositivo) as total_dispositivos,
    round(avg(d.precio_dolares), 2) as precio_promedio
from categorias_equipo c
left join dispositivos_streaming d on c.id_categoria = d.id_categoria
group by c.id_categoria, c.nombre_categoria
order by total_dispositivos desc;

-- listado de equipos que se encuentran en estado de mantenimiento o retirados
select d.codigo_serial, d.nombre_dispositivo, c.nombre_categoria, d.estado_dispositivo
from dispositivos_streaming d
join categorias_equipo c on d.id_categoria = c.id_categoria
where d.estado_dispositivo in ('en_mantenimiento', 'retirado')
order by d.estado_dispositivo asc;

-- reporte analitico de inversion total de inventario agrupado por marca de hardware
select 
    m.nombre_marca,
    m.pais_origen,
    count(d.id_dispositivo) as cantidad_equipos,
    sum(d.precio_dolares) as inversion_total
from marcas_hardware m
left join dispositivos_streaming d on m.id_marca = d.id_marca
group by m.id_marca, m.nombre_marca, m.pais_origen
order by inversion_total desc;