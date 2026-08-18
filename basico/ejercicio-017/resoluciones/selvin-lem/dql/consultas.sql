-- Ejercicio 017 - tipos de datos para tienda de ropa
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Productos disponibles en linea, ordenados por precio ascendente
SELECT nombre_producto, talla, color, precio
FROM basico_ejercicio_017
WHERE disponible_online = 1
ORDER BY precio ASC;

-- 2. Productos sin stock (agotados)
SELECT nombre_producto, talla, color, stock
FROM basico_ejercicio_017
WHERE stock = 0;

-- 3. Precio promedio y total de unidades en stock por talla
SELECT talla,
       COUNT(*) AS total_variantes,
       SUM(stock) AS total_unidades,
       ROUND(AVG(precio), 2) AS precio_promedio
FROM basico_ejercicio_017
GROUP BY talla
ORDER BY talla;

-- 4. Productos ingresados a partir de febrero de 2026
SELECT nombre_producto, color, fecha_ingreso
FROM basico_ejercicio_017
WHERE fecha_ingreso >= '2026-02-01'
ORDER BY fecha_ingreso ASC;

-- 5. Top 5 productos con mayor stock disponible
SELECT nombre_producto, talla, color, stock
FROM basico_ejercicio_017
ORDER BY stock DESC
LIMIT 5;
