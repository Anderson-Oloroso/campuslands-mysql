-- Consultas para Ejercicio 046 - CREATE TABLE para restaurante de comida urbana
-- Concepto principal: CREATE TABLE
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM platillos_urbanos;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM platillos_urbanos;

-- 3. Consulta aplicando el concepto principal: CREATE TABLE
SELECT * FROM platillos_urbanos
ORDER BY tiempo_preparacion_min DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_platillo, precio, tiempo_preparacion_min
FROM platillos_urbanos
WHERE tiempo_preparacion_min > (SELECT AVG(tiempo_preparacion_min) FROM platillos_urbanos)
ORDER BY tiempo_preparacion_min DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(tiempo_preparacion_min) AS promedio_valor,
    MIN(tiempo_preparacion_min) AS valor_minimo,
    MAX(tiempo_preparacion_min) AS valor_maximo
FROM platillos_urbanos;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    precio,
    COUNT(*) AS cantidad,
    AVG(tiempo_preparacion_min) AS promedio
FROM platillos_urbanos
GROUP BY precio
ORDER BY cantidad DESC;
