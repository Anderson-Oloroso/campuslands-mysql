USE campuslands_mysql;

SELECT
    id,
    marca,
    modelo,
    categoria,
    precio,
    estado
FROM motos
WHERE estado = 'disponible'
ORDER BY precio DESC;

SELECT
    categoria,
    COUNT(*) AS total_motos,
    AVG(precio) AS precio_promedio
FROM motos
GROUP BY categoria
ORDER BY precio_promedio DESC;

SELECT
    marca,
    COUNT(*) AS total_motos
FROM motos
GROUP BY marca
HAVING COUNT(*) >= 2
ORDER BY total_motos DESC, marca ASC;

SELECT
    marca,
    COUNT(*) AS total_motos,
    AVG(precio) AS precio_promedio
FROM motos
GROUP BY marca
HAVING AVG(precio) > 40000
ORDER BY precio_promedio DESC;

SELECT
    categoria,
    COUNT(*) AS total_motos,
    AVG(precio) AS precio_promedio
FROM motos
GROUP BY categoria
HAVING COUNT(*) >= 2
   AND AVG(precio) > 35000
ORDER BY precio_promedio DESC;

SELECT
    id,
    marca,
    modelo,
    categoria,
    precio,
    estado
FROM motos
ORDER BY precio DESC
LIMIT 5;