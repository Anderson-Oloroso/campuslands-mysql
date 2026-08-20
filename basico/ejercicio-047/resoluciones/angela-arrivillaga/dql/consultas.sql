USE campuslands_mysql;

-- 1. promedio de precio por categoria para productos disponibles
SELECT categoria, AVG(precio) AS promedio_precio
FROM productos_ropa
WHERE estado != 'agotado'
GROUP BY categoria;

-- 2. top 3 productos mas costosos del catalogo de ropa
SELECT nombre, categoria, precio, estado
FROM productos_ropa
ORDER BY precio DESC
LIMIT 3;

-- 3. listado de productos filtrados por una categoria especifica
SELECT nombre, talla, precio, stock, estado
FROM productos_ropa
WHERE categoria = 'pantalon';

-- 4. reporte de productos agrupados por su estado actual con inventario total
SELECT estado, COUNT(*) AS total_productos, SUM(stock) AS stock_total
FROM productos_ropa
GROUP BY estado;

-- 5. productos en oferta con precio menor a 100 ordenados por precio ascendente
SELECT nombre, categoria, precio, stock
FROM productos_ropa
WHERE estado = 'en_oferta' AND precio < 100.00
ORDER BY precio ASC;