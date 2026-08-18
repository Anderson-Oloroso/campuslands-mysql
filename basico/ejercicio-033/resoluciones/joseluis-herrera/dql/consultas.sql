USE campuslands_mysql;

SELECT
    id_skin,
    nombre,
    arma,
    rareza,
    precio,
    estado
FROM skins
ORDER BY id_skin;

SELECT
    id_skin,
    nombre,
    arma,
    rareza,
    precio
FROM skins
WHERE estado = 'disponible'
ORDER BY precio DESC;

SELECT
    id_skin,
    nombre,
    arma,
    rareza,
    precio
FROM skins
ORDER BY precio DESC
LIMIT 5;

SELECT
    id_skin,
    nombre,
    arma,
    precio,
    estado
FROM skins
WHERE rareza = 'Legendaria'
ORDER BY precio DESC;

SELECT
    COUNT(*) AS total_skins_disponibles,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM skins
WHERE estado = 'disponible';

SELECT
    COUNT(*) AS total_skins,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM skins;