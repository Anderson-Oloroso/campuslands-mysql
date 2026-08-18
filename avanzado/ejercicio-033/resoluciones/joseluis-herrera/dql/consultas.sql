USE campuslands_mysql;

SELECT
    id_skin,
    UPPER(nombre_skin) AS nombre_skin_mayusculas,
    tipo_arma,
    rareza
FROM inventario_skins
ORDER BY nombre_skin;

SELECT
    nombre_skin,
    precio,
    ROUND(precio, 0) AS precio_redondeado
FROM inventario_skins
ORDER BY precio DESC;

SELECT
    nombre_skin,
    CHAR_LENGTH(nombre_skin) AS longitud_nombre
FROM inventario_skins
ORDER BY longitud_nombre DESC;

SELECT
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM inventario_skins;

SELECT
    COUNT(*) AS total_skins,
    SUM(precio) AS valor_total_inventario,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM inventario_skins;

SELECT
    id_skin,
    CONCAT(
        nombre_skin,
        ' - ',
        tipo_arma,
        ' - ',
        rareza,
        ' - $',
        FORMAT(precio, 2)
    ) AS descripcion_skin
FROM inventario_skins
ORDER BY precio DESC;

SELECT
    nombre_skin,
    precio,
    CASE
        WHEN precio >= 100 THEN 'premium'
        WHEN precio >= 50 THEN 'media'
        ELSE 'economica'
    END AS categoria_precio
FROM inventario_skins
ORDER BY precio DESC;