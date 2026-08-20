USE campuslands_mysql;

-- 1. Cantidad de skins por arma.
SELECT
    arma,
    COUNT(*) AS total_skins
FROM skins
GROUP BY arma
ORDER BY total_skins DESC, arma ASC;


-- 2. Precio promedio de skins por arma.
SELECT
    arma,
    COUNT(*) AS total_skins,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM skins
GROUP BY arma
ORDER BY precio_promedio DESC;


-- 3. Valor total de las skins agrupado por rareza.
SELECT
    rareza,
    COUNT(*) AS total_skins,
    ROUND(SUM(precio), 2) AS valor_total
FROM skins
GROUP BY rareza
ORDER BY valor_total DESC;


-- 4. Cantidad de skins disponibles y vendidas.
SELECT
    estado,
    COUNT(*) AS total_skins,
    ROUND(SUM(precio), 2) AS valor_total
FROM skins
GROUP BY estado
ORDER BY total_skins DESC;


-- 5. Precio promedio por rareza.
SELECT
    rareza,
    COUNT(*) AS total_skins,
    ROUND(AVG(precio), 2) AS precio_promedio,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo
FROM skins
GROUP BY rareza
ORDER BY precio_promedio DESC;