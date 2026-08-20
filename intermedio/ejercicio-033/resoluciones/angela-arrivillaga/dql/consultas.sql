use inventario_skins_db;

-- 1. Agrupación por categoría para calcular la cantidad de skins y el valor total del inventario por tipo de arma
select 
    c.nombre_categoria as categoria,
    count(s.id_skin) as total_skins,
    sum(s.precio_estimado) as valor_total_inventario,
    round(avg(s.precio_estimado), 2) as precio_promedio
from skins_inventario s
join categorias_skin c on s.id_categoria = c.id_categoria
group by c.id_categoria, c.nombre_categoria
order by valor_total_inventario desc;

-- 2. Agrupación por rareza con filtro aplicado para conocer cuántas skins activas o en inventario existen por nivel de rareza
select 
    r.nombre_rareza as rareza,
    count(s.id_skin) as total_skins_disponibles,
    max(s.precio_estimado) as precio_maximo,
    min(s.precio_estimado) as precio_minimo
from skins_inventario s
join rarezas_skin r on s.id_rareza = r.id_rareza
where s.estado_disponibilidad in ('en_uso', 'inventario', 'en_venta')
group by r.id_rareza, r.nombre_rareza
order by total_skins_disponibles desc;

-- 3. Agrupación por estado de disponibilidad para evaluar la distribución del inventario y el valor acumulado en cada estado
select 
    s.estado_disponibilidad as estado,
    count(*) as cantidad_skins,
    sum(s.precio_estimado) as inversion_acumulada
from skins_inventario s
group by s.estado_disponibilidad
order by inversion_acumulada desc;

-- 4. Agrupación combinada (Categoría y Rareza) con la cláusula HAVING para filtrar solo aquellos grupos con un valor promedio mayor a 100 dólares
select 
    c.nombre_categoria as categoria,
    r.nombre_rareza as rareza,
    count(s.id_skin) as cantidad,
    round(avg(s.precio_estimado), 2) as promedio_precio
from skins_inventario s
join categorias_skin c on s.id_categoria = c.id_categoria
join rarezas_skin r on s.id_rareza = r.id_rareza
group by c.id_categoria, c.nombre_categoria, r.id_rareza, r.nombre_rareza
having avg(s.precio_estimado) > 100.00
order by promedio_precio desc;

-- 5. Agrupación por año y mes de obtención para analizar la evolución histórica de adquisiciones de skins en el inventario
select 
    date_format(s.fecha_obtencion, '%Y-%m') as mes_obtencion,
    count(s.id_skin) as skins_adquiridas,
    sum(s.precio_estimado) as gasto_mensual_estimado
from skins_inventario s
group by date_format(s.fecha_obtencion, '%Y-%m')
order by mes_obtencion asc;