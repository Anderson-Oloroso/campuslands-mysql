-- DQL: Consultas de análisis basadas en tipos de datos específicos
USE campuslands_mysql;

-- 1. Prendas en oferta ordenadas de menor a mayor precio
SELECT 
    codigo_sku,
    nombre,
    categoria,
    talla,
    precio
FROM inventario_ropa
WHERE en_oferta = TRUE
ORDER BY precio ASC;

-- 2. Conteo de stock total e inversión acumulada por categoría
SELECT 
    categoria,
    COUNT(*) AS total_modelos,
    SUM(stock_disponible) AS unidades_totales,
    ROUND(SUM(precio * stock_disponible), 2) AS valor_inventario_usd
FROM inventario_ropa
GROUP BY categoria
ORDER BY valor_inventario_usd DESC;

-- 3. Búsqueda de prendas por rango de precio y fecha de ingreso reciente
SELECT 
    codigo_sku,
    nombre,
    precio,
    fecha_ingreso
FROM inventario_ropa
WHERE precio BETWEEN 30.00 AND 100.00 
  AND fecha_ingreso >= '2026-03-01'
ORDER BY fecha_ingreso DESC;

-- 4. Promedio de precio según la talla de la prenda
SELECT 
    talla,
    COUNT(*) AS cantidad_prendas,
    ROUND(AVG(precio), 2) AS precio_promedio_usd
FROM inventario_ropa
GROUP BY talla
ORDER BY cantidad_prendas DESC;

-- 5. Top 3 de prendas con mayor valor comercial unitario
SELECT 
    codigo_sku,
    nombre,
    categoria,
    color,
    precio
FROM inventario_ropa
ORDER BY precio DESC
LIMIT 3;
