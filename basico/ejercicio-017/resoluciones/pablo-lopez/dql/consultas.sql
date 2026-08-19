-- ============================================================
-- EJERCICIO 017 - TIPOS DE DATOS PARA TIENDA DE ROPA
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
    talla,
    precio,
    cantidad_stock
FROM productos
WHERE estado = 'disponible'
ORDER BY nombre ASC;


-- ============================================================
-- CONSULTA 2
-- Mostrar los productos ordenados de mayor a menor precio.
-- ============================================================

SELECT
    nombre AS producto,
    categoria,
    talla,
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
    talla,
    precio AS precio_producto
FROM productos
WHERE estado = 'disponible'
ORDER BY precio DESC
LIMIT 5;


-- ============================================================
-- CONSULTA 4
-- Contar productos registrados por categoría.
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
-- Calcular el valor total del inventario disponible.
-- ============================================================

SELECT
    COUNT(*) AS productos_disponibles,
    SUM(cantidad_stock) AS unidades_disponibles,
    ROUND(SUM(precio * cantidad_stock), 2) AS valor_inventario
FROM productos
WHERE estado = 'disponible';


-- ============================================================
-- CONSULTA 7
-- Mostrar productos disponibles con stock bajo.
-- ============================================================

SELECT
    nombre AS producto,
    categoria,
    cantidad_stock AS stock,
    precio AS precio_producto
FROM productos
WHERE estado = 'disponible'
  AND cantidad_stock <= 10
ORDER BY cantidad_stock ASC;


-- ============================================================
-- CONSULTA 8
-- Mostrar categorías que tienen al menos 2 productos.
-- ============================================================

SELECT
    categoria,
    COUNT(*) AS total_productos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM productos
GROUP BY categoria
HAVING COUNT(*) >= 2
ORDER BY total_productos DESC;