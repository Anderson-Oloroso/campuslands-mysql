USE campuslands_mysql;

SELECT
    id_accesorio,
    nombre AS accesorio,
    categoria,
    precio,
    stock
FROM vw_accesorios_activos
ORDER BY nombre;


SELECT
    nombre AS accesorio,
    categoria,
    precio,
    stock
FROM vw_accesorios_activos
ORDER BY precio DESC;

SELECT
    nombre AS accesorio,
    categoria,
    stock
FROM vw_accesorios_activos
WHERE stock > 0
ORDER BY stock DESC;

SELECT
    COUNT(*) AS total_accesorios_activos,
    AVG(precio) AS precio_promedio
FROM vw_accesorios_activos;

SELECT
    categoria,
    COUNT(*) AS total_accesorios,
    AVG(precio) AS precio_promedio
FROM vw_accesorios_activos
GROUP BY categoria
ORDER BY precio_promedio DESC;


SELECT
    nombre AS accesorio,
    categoria,
    precio,
    stock,
    precio * stock AS valor_inventario
FROM vw_accesorios_activos
ORDER BY valor_inventario DESC
LIMIT 5;