-- Ejercicio 016 - CREATE TABLE para restaurante de comida urbana
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Menu disponible, ordenado por precio ascendente
SELECT nombre_platillo, categoria, precio
FROM basico_ejercicio_016
WHERE disponible = 'si'
ORDER BY precio ASC;

-- 2. Precio promedio por categoria
SELECT categoria,
       COUNT(*) AS total_platillos,
       ROUND(AVG(precio), 2) AS precio_promedio
FROM basico_ejercicio_016
GROUP BY categoria
ORDER BY precio_promedio DESC;

-- 3. Top 5 platillos mas caros
SELECT nombre_platillo, categoria, precio
FROM basico_ejercicio_016
ORDER BY precio DESC
LIMIT 5;

-- 4. Platillos no disponibles actualmente
SELECT nombre_platillo, categoria, precio
FROM basico_ejercicio_016
WHERE disponible = 'no';

-- 5. Conteo de platillos por categoria
SELECT categoria, COUNT(*) AS total
FROM basico_ejercicio_016
GROUP BY categoria
ORDER BY total DESC;
