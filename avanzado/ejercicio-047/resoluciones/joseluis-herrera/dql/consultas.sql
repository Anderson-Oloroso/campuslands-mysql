USE campuslands_mysql;

CALL sp_buscar_categoria('Camisetas');

CALL sp_actualizar_stock(8,0);

CALL sp_registrar_prenda(
    'Bufanda de Lana',
    'U',
    55.00,
    15,
    5
);

SELECT
    p.nombre,
    c.nombre AS categoria,
    p.precio,
    p.stock,
    p.disponible
FROM prendas p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
ORDER BY c.nombre, p.nombre;

SELECT
    c.nombre AS categoria,
    COUNT(p.id_prenda) AS total_prendas,
    ROUND(AVG(p.precio),2) AS precio_promedio
FROM categorias c
LEFT JOIN prendas p
    ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY total_prendas DESC;

SELECT
    nombre,
    precio,
    stock
FROM prendas
WHERE disponible = TRUE
ORDER BY precio DESC
LIMIT 5;

SELECT
    nombre,
    stock,
    disponible
FROM prendas
WHERE stock <= 10
ORDER BY stock ASC;

SELECT
    c.nombre AS categoria,
    SUM(p.stock) AS inventario_total
FROM categorias c
INNER JOIN prendas p
    ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY inventario_total DESC;