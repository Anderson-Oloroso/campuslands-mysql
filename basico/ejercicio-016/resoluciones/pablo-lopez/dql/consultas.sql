-- ============================================================
-- EJERCICIO 016 - CREATE TABLE PARA RESTAURANTE DE COMIDA URBANA
-- Archivo: dql/consultas.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- CONSULTA 1
-- Mostrar todos los productos disponibles.
-- ============================================================

SELECT
    id_producto,
    nombre,
    categoria,
    precio
FROM productos
WHERE estado = 'disponible'
ORDER BY nombre ASC;


-- ============================================================
-- CONSULTA 2
-- Mostrar los productos ordenados del más caro al más barato.
-- ============================================================

SELECT
    nombre AS producto,
    categoria,
    precio AS precio_producto
FROM productos
ORDER BY precio DESC;


-- ============================================================
-- CONSULTA 3
-- Obtener los 5 productos disponibles con mayor precio.
-- ============================================================

SELECT
    nombre AS producto,
    categoria,
    precio AS precio_producto
FROM productos
WHERE estado = 'disponible'
ORDER BY precio DESC
LIMIT 5;


-- ============================================================
-- CONSULTA 4
-- Contar cuántos productos existen por categoría.
-- ============================================================

SELECT
    categoria,
    COUNT(*) AS total_productos
FROM productos
GROUP BY categoria
ORDER BY total_productos DESC, categoria ASC;


-- ============================================================
-- CONSULTA 5
-- Calcular el precio promedio por categoría.
-- ============================================================

SELECT
    categoria,
    COUNT(*) AS total_productos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM productos
GROUP BY categoria
ORDER BY precio_promedio DESC;


-- ============================================================
-- CONSULTA 6
-- Calcular el valor total de los productos disponibles.
-- ============================================================

SELECT
    COUNT(*) AS productos_disponibles,
    ROUND(SUM(precio), 2) AS valor_total
FROM productos
WHERE estado = 'disponible';


-- ============================================================
-- CONSULTA 7
-- Mostrar productos disponibles cuyo precio sea menor
-- o igual a 25.
-- ============================================================

SELECT
    nombre AS producto,
    categoria,
    precio AS precio_producto
FROM productos
WHERE estado = 'disponible'
  AND precio <= 25.00
ORDER BY precio ASC;


-- ============================================================
-- CONSULTA 8
-- Mostrar categorías que tengan al menos 2 productos.
-- ============================================================

SELECT
    categoria,
    COUNT(*) AS total_productos
FROM productos
GROUP BY categoria
HAVING COUNT(*) >= 2
ORDER BY total_productos DESC;