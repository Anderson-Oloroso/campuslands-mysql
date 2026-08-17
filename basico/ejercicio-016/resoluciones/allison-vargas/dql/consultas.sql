-- DQL: Consultas básicas sobre el menú
USE campuslands_mysql;

-- 1. Listado completo de platillos disponibles ordenados por precio ascendente
SELECT 
    platillo_id,
    nombre,
    categoria,
    precio
FROM menu_urbano
WHERE disponible = TRUE
ORDER BY precio ASC;

-- 2. Conteo de platillos y precio promedio por categoría
SELECT 
    categoria,
    COUNT(*) AS total_platillos,
    ROUND(AVG(precio), 2) AS precio_promedio_usd
FROM menu_urbano
GROUP BY categoria
ORDER BY total_platillos DESC;

-- 3. Opciones vegetarianas disponibles en el menú
SELECT 
    nombre,
    categoria,
    precio
FROM menu_urbano
WHERE es_vegetariano = TRUE AND disponible = TRUE
ORDER BY precio ASC;

-- 4. Top 3 de platillos más costosos del restaurante
SELECT 
    nombre,
    categoria,
    precio
FROM menu_urbano
ORDER BY precio DESC
LIMIT 3;

-- 5. Resumen del menú según disponibilidad
SELECT 
    IF(disponible, 'Disponible', 'Agotado') AS estado,
    COUNT(*) AS cantidad_items
FROM menu_urbano
GROUP BY disponible;
