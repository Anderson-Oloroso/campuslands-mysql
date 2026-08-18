USE campuslands_mysql;

SELECT
    modalidad,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY modalidad
HAVING COUNT(*) > 5
ORDER BY total_saltos DESC;

SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM saltos
GROUP BY modalidad
HAVING AVG(precio) > 2000
ORDER BY precio_promedio DESC;

SELECT
    altura_salto,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY altura_salto
HAVING COUNT(*) >= 3
ORDER BY altura_salto DESC;

SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    SUM(precio) AS ingreso_total
FROM saltos
GROUP BY modalidad
HAVING SUM(precio) > 10000
ORDER BY ingreso_total DESC;

SELECT
    estado,
    COUNT(*) AS total_registros
FROM saltos
GROUP BY estado
HAVING COUNT(*) > 3
ORDER BY total_registros DESC;

SELECT
    modalidad,
    MAX(precio) AS precio_maximo
FROM saltos
GROUP BY modalidad
HAVING MAX(precio) > 2500
ORDER BY precio_maximo DESC;

SELECT
    modalidad,
    COUNT(*) AS saltos_completados
FROM saltos
WHERE estado = 'Completado'
GROUP BY modalidad
HAVING COUNT(*) >= 2
ORDER BY saltos_completados DESC;