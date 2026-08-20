USE campuslands_mysql;

SELECT
    id_producto,
    nombre,
    categoria,
    marca,
    precio,
    stock
FROM vista_productos_activos
ORDER BY precio DESC;

SELECT
    nombre,
    categoria,
    marca,
    precio
FROM vista_productos_activos
WHERE precio < 300
ORDER BY precio ASC;

SELECT
    nombre,
    categoria,
    stock
FROM vista_productos_activos
WHERE stock > 0
ORDER BY stock DESC;

SELECT
    categoria,
    total_productos,
    precio_promedio,
    stock_total
FROM vista_productos_por_categoria
ORDER BY total_productos DESC, precio_promedio DESC;