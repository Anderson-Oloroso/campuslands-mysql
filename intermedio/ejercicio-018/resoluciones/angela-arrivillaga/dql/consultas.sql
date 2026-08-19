USE viajes_turismo_db;

-- 1. Agrupación por categoría turística calculando la cantidad de destinos, el costo diario promedio y la calificación media con formato
SELECT categoria_turistica AS categoria, COUNT(*) AS total_destinos, CONCAT('$', FORMAT(AVG(costo_promedio_diario), 2)) AS costo_diario_promedio, ROUND(AVG(calificacion_promedio), 2) AS calificacion_media
FROM destinos_turisticos
GROUP BY categoria_turistica
ORDER BY total_destinos DESC;

-- 2. Agrupación por continente evaluando el presupuesto diario promedio y el rango de inversión para los viajeros
SELECT continente, COUNT(*) AS cantidad_destinos, CONCAT('$', FORMAT(MIN(costo_promedio_diario), 2)) AS costo_minimo_diario, CONCAT('$', FORMAT(MAX(costo_promedio_diario), 2)) AS costo_maximo_diario, CONCAT('$', FORMAT(AVG(costo_promedio_diario), 2)) AS costo_promedio
FROM destinos_turisticos
GROUP BY continente
ORDER BY costo_promedio DESC;

-- 3. Agrupación con filtro avanzado (HAVING) para categorias turísticas que poseen más de un destino registrado en la plataforma
SELECT categoria_turistica AS categoria, COUNT(*) AS total_destinos, CONCAT('$', FORMAT(AVG(costo_promedio_diario), 2)) AS costo_promedio
FROM destinos_turisticos
GROUP BY categoria_turistica
HAVING COUNT(*) > 1
ORDER BY costo_promedio DESC;

-- 4. Agrupación por país mostrando la calificación máxima alcanzada y el promedio de costos diarios por nación
SELECT pais, continente, COUNT(*) AS destinos_disponibles, MAX(calificacion_promedio) AS calificacion_maxima, CONCAT('$', FORMAT(AVG(costo_promedio_diario), 2)) AS costo_promedio_pais
FROM destinos_turisticos
GROUP BY pais, continente
ORDER BY calificacion_maxima DESC;

-- 5. Agrupación combinada por estado del destino evaluando el volumen de oferta turística y el costo diario global acumulado
SELECT estado_destino, COUNT(*) AS cantidad_destinos, CONCAT('$', FORMAT(SUM(costo_promedio_diario), 2)) AS inversion_diaria_acumulada, ROUND(AVG(calificacion_promedio), 2) AS calificacion_general
FROM destinos_turisticos
GROUP BY estado_destino
ORDER BY cantidad_destinos DESC;