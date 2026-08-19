use autos_hiperdeportivos_db;

-- listado general de hiperdeportivos aplicando filtros de rendimiento y ordenados por velocidad máxima descendente
select h.nombre_modelo, f.nombre_marca, f.pais_origen, h.velocidad_maxima_kmh, h.potencia_hp, h.precio_millones_usd, h.estado_homologacion
from hiperdeportivos h
join fabricantes f on h.id_fabricante = f.id_fabricante
order by h.velocidad_maxima_kmh desc;

-- filtrado con where avanzado para encontrar hiperdeportivos legales para calle con mas de mil quinientos caballos de fuerza
select h.nombre_modelo, f.nombre_marca, h.velocidad_maxima_kmh, h.potencia_hp, h.precio_millones_usd
from hiperdeportivos h
join fabricantes f on h.id_fabricante = f.id_fabricante
where h.estado_homologacion = 'legal calle' and h.potencia_hp > 1500
order by h.potencia_hp desc;

-- resumen estadistico agrupado por estado de homologacion con promedios de velocidad y precio acumulado
select 
    h.estado_homologacion,
    count(h.id_auto) as total_modelos,
    round(avg(h.velocidad_maxima_kmh), 2) as velocidad_promedio_kmh,
    sum(h.precio_millones_usd) as precio_acumulado_usd
from hiperdeportivos h
group by h.estado_homologacion
order by velocidad_promedio_kmh desc;

-- top cinco de hiperdeportivos con mayor potencia registrada en el modulo de datos
select h.nombre_modelo, f.nombre_marca, h.potencia_hp, h.velocidad_maxima_kmh, h.precio_millones_usd
from hiperdeportivos h
join fabricantes f on h.id_fabricante = f.id_fabricante
order by h.potencia_hp desc
limit 5;

-- reporte analitico filtrando vehiculos cuyo precio en millones de usd supere los tres millones
select h.nombre_modelo, f.nombre_marca, h.precio_millones_usd, h.unidades_producidas, h.estado_homologacion
from hiperdeportivos h
join fabricantes f on h.id_fabricante = f.id_fabricante
where h.precio_millones_usd > 3.00
order by h.precio_millones_usd desc;