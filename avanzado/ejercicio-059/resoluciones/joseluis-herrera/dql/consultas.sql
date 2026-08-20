USE campuslands_mysql;

SELECT
    id_producto,
    nombre,
    categoria,
    marca,
    precio,
    stock,
    estado,
    ultima_revision
FROM productos_accesorios
ORDER BY nombre;

SELECT
    nombre,
    categoria,
    estado,
    ultima_revision
FROM productos_accesorios
WHERE estado = 'activo'
ORDER BY ultima_revision ASC;

SELECT
    nombre,
    categoria,
    stock,
    precio
FROM productos_accesorios
WHERE stock > 0
ORDER BY stock DESC;

SELECT
    categoria,
    COUNT(*) AS total_productos,
    SUM(stock) AS stock_total,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM productos_accesorios
WHERE estado = 'activo'
GROUP BY categoria
ORDER BY total_productos DESC;