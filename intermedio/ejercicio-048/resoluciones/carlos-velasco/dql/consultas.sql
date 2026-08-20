USE campuslands_mysql;

-- 1. Cantidad de viajes registrados por tipo de viaje.
SELECT
    tipo_viaje,
    COUNT(*) AS total_viajes
FROM viajes
GROUP BY tipo_viaje
ORDER BY total_viajes DESC;


-- 2. Costo promedio por tipo de viaje.
SELECT
    tipo_viaje,
    COUNT(*) AS total_viajes,
    ROUND(AVG(costo), 2) AS costo_promedio
FROM viajes
GROUP BY tipo_viaje
ORDER BY costo_promedio DESC;


-- 3. Costo total de los viajes agrupados por estado.
SELECT
    estado,
    COUNT(*) AS total_viajes,
    ROUND(SUM(costo), 2) AS costo_total
FROM viajes
GROUP BY estado
ORDER BY costo_total DESC;


-- 4. Duración promedio de los viajes por tipo.
SELECT
    tipo_viaje,
    ROUND(AVG(duracion_dias), 2) AS duracion_promedio_dias
FROM viajes
GROUP BY tipo_viaje
ORDER BY duracion_promedio_dias DESC;


-- 5. Cantidad de viajes registrados en cada destino.
SELECT
    destino,
    COUNT(*) AS total_viajes
FROM viajes
GROUP BY destino
ORDER BY total_viajes DESC, destino ASC;


-- 6. Tipos de viaje con dos o más registros.
SELECT
    tipo_viaje,
    COUNT(*) AS total_viajes
FROM viajes
GROUP BY tipo_viaje
HAVING COUNT(*) >= 2
ORDER BY total_viajes DESC;


-- 7. Resumen general por tipo de viaje.
SELECT
    tipo_viaje,
    COUNT(*) AS total_viajes,
    ROUND(SUM(costo), 2) AS costo_total,
    ROUND(AVG(costo), 2) AS costo_promedio,
    ROUND(AVG(duracion_dias), 2) AS duracion_promedio_dias
FROM viajes
GROUP BY tipo_viaje
ORDER BY costo_total DESC;