USE campuslands_mysql;

-- 1. Consultar todos los productos disponibles.
SELECT
    id_producto,
    nombre,
    categoria,
    talla,
    color,
    precio,
    stock
FROM productos_ropa
WHERE disponible = TRUE
ORDER BY nombre ASC;


-- 2. Consultar productos cuyo precio sea superior a 40.
SELECT
    nombre,
    categoria,
    precio
FROM productos_ropa
WHERE precio > 40
ORDER BY precio DESC;


-- 3. Consultar productos con stock disponible.
SELECT
    nombre,
    categoria,
    stock
FROM productos_ropa
WHERE stock > 0
ORDER BY stock DESC;


-- 4. Obtener el precio promedio de los productos.
SELECT
    AVG(precio) AS precio_promedio
FROM productos_ropa;


-- 5. Obtener el valor total del inventario.
SELECT
    SUM(precio * stock) AS valor_total_inventario
FROM productos_ropa;


-- 6. Contar productos registrados por categoría.
SELECT
    categoria,
    COUNT(*) AS total_productos
FROM productos_ropa
GROUP BY categoria
ORDER BY total_productos DESC;


-- 7. Obtener el producto más costoso.
SELECT
    nombre,
    categoria,
    precio
FROM productos_ropa
ORDER BY precio DESC
LIMIT 1;


-- 8. Obtener los 5 productos con mayor stock.
SELECT
    nombre,
    categoria,
    stock
FROM productos_ropa
ORDER BY stock DESC
LIMIT 5;