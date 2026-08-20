USE campuslands_mysql;


-- 1. Cantidad de viajes disponibles por categoría.
SELECT
    categoria,
    COUNT(*) AS total_viajes
FROM viajes
WHERE estado = 'disponible'
GROUP BY categoria
ORDER BY total_viajes DESC;


-- 2. Precio promedio por categoría.
SELECT
    categoria,
    COUNT(*) AS total_viajes,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM viajes
GROUP BY categoria
ORDER BY precio_promedio DESC;


-- 3. Precio mínimo y máximo por país.
SELECT
    pais,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM viajes
GROUP BY pais
ORDER BY precio_promedio DESC;


-- 4. Duración promedio de los viajes según temporada.
SELECT
    temporada,
    COUNT(*) AS total_viajes,
    ROUND(AVG(duracion_dias), 2) AS duracion_promedio
FROM viajes
GROUP BY temporada
ORDER BY duracion_promedio DESC;


-- 5. Categorías cuyo precio promedio supera los 1000.
SELECT
    categoria,
    COUNT(*) AS total_viajes,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM viajes
GROUP BY categoria
HAVING AVG(precio) > 1000
ORDER BY precio_promedio DESC;


-- 6. Valor total de los viajes disponibles agrupados por país.
SELECT
    pais,
    COUNT(*) AS total_viajes,
    ROUND(SUM(precio), 2) AS valor_total
FROM viajes
WHERE estado = 'disponible'
GROUP BY pais
ORDER BY valor_total DESC;


-- 7. Resumen de viajes por estado y temporada.
SELECT
    estado,
    temporada,
    COUNT(*) AS total_viajes,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM viajes
GROUP BY estado, temporada
ORDER BY estado ASC, total_viajes DESC;