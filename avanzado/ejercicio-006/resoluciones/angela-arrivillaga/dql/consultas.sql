use campuslands_mysql;

-- 1. analisis explain para consulta de autos disponibles con velocidad mayor a 400 km/h utilizando indice compuesto
explain 
select modelo, velocidad_maxima_kmh, precio_millones_usd 
from autos_hiperdeportivos 
where estado = 'disponible' and velocidad_maxima_kmh > 400;

-- 2. analisis explain para buscar autos ordenados por precio utilizando indice de precios
explain 
select modelo, precio_millones_usd, estado 
from autos_hiperdeportivos 
order by precio_millones_usd desc;

-- 3. analisis explain para unir fabricante y auto hiperdeportivo mediante llave foranea
explain 
select f.nombre_fabricante, a.modelo, a.velocidad_maxima_kmh 
from autos_hiperdeportivos a
join fabricantes_autos f on a.fabricante_id = f.id
where f.pais_origen = 'italia';

-- 4. analisis explain para consultar especificaciones tecnicas cruzando con autos y filtrando por potencia
explain 
select a.modelo, e.tipo_motor, e.potencia_hp 
from autos_hiperdeportivos a
join especificaciones_autos e on a.id = e.auto_id
where e.potencia_hp > 1500;

-- 5. analisis explain para reporte de agregacion y conteo por estado de inventario
explain 
select estado, count(*) as total_autos, avg(precio_millones_usd) as precio_promedio
from autos_hiperdeportivos 
group by estado;