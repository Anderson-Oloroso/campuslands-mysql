USE campuslands_mysql;

SELECT
    tipo_arma,
    COUNT(*) AS total_skins
FROM inventario_skins
GROUP BY tipo_arma
ORDER BY total_skins DESC;

SELECT
    rareza,
    COUNT(*) AS total_skins,
    AVG(precio) AS precio_promedio
FROM inventario_skins
GROUP BY rareza
ORDER BY precio_promedio DESC;

SELECT
    tipo_arma,
    SUM(precio) AS valor_total_inventario
FROM inventario_skins
GROUP BY tipo_arma
ORDER BY valor_total_inventario DESC;


SELECT
    rareza,
    COUNT(*) AS skins_disponibles
FROM inventario_skins
WHERE estado = 'disponible'
GROUP BY rareza
ORDER BY skins_disponibles DESC;

SELECT
    estado,
    COUNT(*) AS total_skins,
    SUM(precio) AS valor_total
FROM inventario_skins
GROUP BY estado
ORDER BY valor_total DESC;