USE campuslands_mysql;

-- 1. Consultar productos de una categoría.
CALL sp_productos_por_categoria('Camisetas');


-- 2. Consultar productos de otra categoría.
CALL sp_productos_por_categoria('Sudaderas');


-- 3. Actualizar el stock de un producto.
CALL sp_actualizar_stock(9, 6);


-- 4. Verificar el producto después de actualizar su stock.
SELECT
    id_producto,
    nombre,
    categoria,
    stock,
    disponible
FROM productos_ropa
WHERE id_producto = 9;


-- 5. Consultar productos disponibles.
SELECT
    id_producto,
    nombre,
    categoria,
    precio,
    stock
FROM productos_ropa
WHERE disponible = TRUE
ORDER BY precio DESC;


-- 6. Consultar los productos con stock bajo.
SELECT
    id_producto,
    nombre,
    categoria,
    stock
FROM productos_ropa
WHERE stock BETWEEN 1 AND 5
ORDER BY stock ASC;


-- 7. Obtener el valor total del inventario.
SELECT
    SUM(precio * stock) AS valor_total_inventario
FROM productos_ropa;


-- 8. Obtener cantidad de productos y precio promedio por categoría.
SELECT
    categoria,
    COUNT(*) AS total_productos,
    AVG(precio) AS precio_promedio
FROM productos_ropa
GROUP BY categoria
ORDER BY precio_promedio DESC;