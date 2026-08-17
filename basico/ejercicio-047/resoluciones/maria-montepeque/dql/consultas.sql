USE campuslands_mysql;

-- 1. Listado ordenado por precio, de mayor a menor
SELECT nombre, categoria, precio
FROM productos_ropa_basico
ORDER BY precio DESC;

-- 2. Productos actualmente en oferta
SELECT nombre, categoria, precio
FROM productos_ropa_basico
WHERE en_oferta = TRUE;

-- 3. Valor total de inventario por producto (precio * stock)
SELECT nombre, precio, stock,
       (precio * stock) AS valor_inventario
FROM productos_ropa_basico
ORDER BY valor_inventario DESC;

-- 4. Cantidad de productos por categoria
SELECT categoria, COUNT(*) AS total_productos
FROM productos_ropa_basico
GROUP BY categoria
ORDER BY total_productos DESC;

-- 5. Productos vendidos en los ultimos 3 dias (relativo a la venta mas reciente)
SELECT nombre, ultima_venta
FROM productos_ropa_basico
WHERE ultima_venta >= (SELECT DATE_SUB(MAX(ultima_venta), INTERVAL 3 DAY) FROM productos_ropa_basico)
ORDER BY ultima_venta DESC;

-- 6. Productos que tienen una descripcion (texto opcional)
SELECT nombre, descripcion
FROM productos_ropa_basico
WHERE descripcion IS NOT NULL;
