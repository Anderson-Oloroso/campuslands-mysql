USE campuslands_mysql;

-- 1. Consultar las prendas actualmente disponibles.
SELECT
    id_prenda,
    nombre,
    categoria,
    talla,
    color,
    precio,
    stock
FROM prendas
WHERE disponible = TRUE
  AND estado = 'activo'
ORDER BY nombre ASC;


-- 2. Consultar prendas con precio superior a 100.
SELECT
    nombre,
    categoria,
    precio
FROM prendas
WHERE precio > 100
ORDER BY precio DESC;


-- 3. Consultar prendas con stock disponible y mostrar su valor total.
SELECT
    nombre,
    stock,
    precio,
    stock * precio AS valor_stock
FROM prendas
WHERE stock > 0
ORDER BY valor_stock DESC;


-- 4. Obtener la cantidad de prendas y el precio promedio por categoría.
SELECT
    categoria,
    COUNT(*) AS total_prendas,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM prendas
GROUP BY categoria
ORDER BY precio_promedio DESC;


-- 5. Consultar las prendas que tienen poco stock.
SELECT
    nombre,
    categoria,
    stock,
    estado
FROM prendas
WHERE stock BETWEEN 1 AND 5
ORDER BY stock ASC, nombre ASC;


-- 6. Obtener las 5 prendas con mayor precio.
SELECT
    nombre,
    categoria,
    precio
FROM prendas
ORDER BY precio DESC
LIMIT 5;


-- 7. Obtener un resumen general del inventario.
SELECT
    COUNT(*) AS total_prendas,
    SUM(stock) AS unidades_disponibles,
    ROUND(AVG(precio), 2) AS precio_promedio,
    ROUND(SUM(stock * precio), 2) AS valor_total_inventario
FROM prendas;