USE campuslands_mysql;

-- 1. Listado de autos disponibles con velocidad superior a 400 km/h y sus atributos atómicos
SELECT modelo, marca, velocidad_maxima_kmh, precio_millones_usd 
FROM autos_hiperdeportivos 
WHERE estado = 'disponible' AND velocidad_maxima_kmh > 400;

-- 2. Conteo de autos por estado utilizando agrupación
SELECT estado, COUNT(*) AS total_autos 
FROM autos_hiperdeportivos 
GROUP BY estado;

-- 3. Top 3 autos más caros aplicando ordenamiento descendente y límite
SELECT modelo, precio_millones_usd 
FROM autos_hiperdeportivos 
ORDER BY precio_millones_usd DESC 
LIMIT 3;

-- 4. Consulta utilizando JOIN para verificar la relación 1FN (listar autos con sus colores disponibles atómicos)
SELECT a.marca, a.modelo, e.color_disponible
FROM autos_hiperdeportivos a
JOIN especificaciones_colores e ON a.id = e.auto_id
ORDER BY a.marca ASC;

-- 5. Conteo de colores disponibles por cada auto para validar la atomicidad relacional
SELECT a.modelo, COUNT(e.id) AS total_colores_disponibles
FROM autos_hiperdeportivos a
LEFT JOIN especificaciones_colores e ON a.id = e.auto_id
GROUP BY a.id, a.modelo
ORDER BY total_colores_disponibles DESC;