USE campuslands_mysql;

-- 1. Autos disponibles con velocidad superior a 400 km/h
SELECT modelo, marca, velocidad_maxima_kmh 
FROM autos_hiperdeportivos 
WHERE estado = 'disponible' AND velocidad_maxima_kmh > 400;

-- 2. Conteo de autos por estado
SELECT estado, COUNT(*) AS total_autos 
FROM autos_hiperdeportivos 
GROUP BY estado;

-- 3. Top 3 autos más caros
SELECT modelo, precio_millones_usd 
FROM autos_hiperdeportivos 
ORDER BY precio_millones_usd DESC 
LIMIT 3;

-- 4. Promedio de precio de autos lanzados después de 2020
SELECT AVG(precio_millones_usd) AS precio_promedio_recientes 
FROM autos_hiperdeportivos 
WHERE anio_lanzamiento > 2020;

-- 5. Autos que no están vendidos (disponibles o reservados)
SELECT modelo, estado 
FROM autos_hiperdeportivos 
WHERE estado IN ('disponible', 'reservado') 
ORDER BY estado ASC;