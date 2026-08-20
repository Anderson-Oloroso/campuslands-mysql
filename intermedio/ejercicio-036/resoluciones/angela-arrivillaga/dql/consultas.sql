use hiperdeportivos_1fn_db;

-- 1. Consulta para listar cada hiperauto con su respectivo fabricante y el conteo total de tecnologías atómicas registradas (cumpliendo 1FN)
select 
    h.nombre_modelo,
    f.nombre_fabricante,
    f.pais_origen,
    h.potencia_hp,
    h.velocidad_maxima_kmh,
    count(t.id_tecnologia) as total_tecnologias_atomicas
from hiperautos h
join fabricantes_hiperautos f on h.id_fabricante = f.id_fabricante
left join tecnologias_hiperautos t on h.id_hiperauto = t.id_hiperauto
group by h.id_hiperauto, h.nombre_modelo, f.nombre_fabricante, f.pais_origen, h.potencia_hp, h.velocidad_maxima_kmh
order by h.potencia_hp desc;

-- 2. Consulta detallada para desplegar cada tecnología individual asociada a su hiperauto correspondiente
select 
    h.nombre_modelo,
    f.nombre_fabricante,
    t.nombre_tecnologia,
    t.tipo_sistema
from tecnologias_hiperautos t
join hiperautos h on t.id_hiperauto = h.id_hiperauto
join fabricantes_hiperautos f on h.id_fabricante = f.id_fabricante
order by h.nombre_modelo asc;

-- 3. Reporte agrupado por tipo de sistema tecnológico para evaluar qué tipo de innovación predomina en los hiperautos
select 
    t.tipo_sistema,
    count(t.id_tecnologia) as cantidad_implementaciones,
    count(distinct t.id_hiperauto) as hiperautos_con_esta_tecnologia
from tecnologias_hiperautos t
group by t.tipo_sistema
order by cantidad_implementaciones desc;

-- 4. Top 5 de hiperautos con mayor velocidad máxima integrando la información de su fabricante
select 
    h.nombre_modelo,
    f.nombre_fabricante,
    h.velocidad_maxima_kmh,
    h.potencia_hp,
    h.precio_usd
from hiperautos h
join fabricantes_hiperautos f on h.id_fabricante = f.id_fabricante
order by h.velocidad_maxima_kmh desc
limit 5;

-- 5. Consulta para filtrar hiperautos cuyo precio sea superior a 3,000,000 USD y su estado de producción sea 'limitado' o 'agotado'
select 
    h.nombre_modelo,
    f.nombre_fabricante,
    h.precio_usd,
    h.estado_produccion
from hiperautos h
join fabricantes_hiperautos f on h.id_fabricante = f.id_fabricante
where h.precio_usd > 3000000.00
  and h.estado_produccion in ('limitado', 'agotado')
order by h.precio_usd desc;