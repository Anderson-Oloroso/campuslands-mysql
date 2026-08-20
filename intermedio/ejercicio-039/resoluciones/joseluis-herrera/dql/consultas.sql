USE campuslands_mysql;

SELECT
    p.id_peleador,
    CONCAT(p.nombre, ' ', p.apellido) AS peleador,
    c.nombre AS categoria,
    p.peso,
    p.victorias,
    p.derrotas,
    p.estado
FROM peleadores AS p
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
WHERE p.estado = 'activo'
ORDER BY p.victorias DESC;

SELECT
    c.nombre AS categoria,
    COUNT(p.id_peleador) AS total_peleadores,
    AVG(p.peso) AS peso_promedio,
    AVG(p.victorias) AS promedio_victorias
FROM categorias AS c
LEFT JOIN peleadores AS p
    ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY total_peleadores DESC;

SELECT
    CONCAT(p.nombre, ' ', p.apellido) AS peleador,
    c.nombre AS categoria,
    p.peso,
    p.victorias,
    p.derrotas
FROM peleadores AS p
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
WHERE p.victorias >= 10
ORDER BY p.victorias DESC;

SELECT
    c.nombre AS categoria,
    COUNT(p.id_peleador) AS total_peleadores
FROM categorias AS c
INNER JOIN peleadores AS p
    ON c.id_categoria = p.id_categoria
WHERE p.estado = 'activo'
GROUP BY c.id_categoria, c.nombre
ORDER BY total_peleadores DESC;