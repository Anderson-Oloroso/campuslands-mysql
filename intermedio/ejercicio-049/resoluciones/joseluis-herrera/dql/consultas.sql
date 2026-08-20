USE campuslands_mysql;

SELECT
    nivel,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY nivel
HAVING COUNT(*) >= 3
ORDER BY total_saltos DESC;

SELECT
    nivel,
    ROUND(AVG(costo), 2) AS costo_promedio
FROM saltos
GROUP BY nivel
HAVING AVG(costo) > 200
ORDER BY costo_promedio DESC;

SELECT
    estado,
    COUNT(*) AS total_registros
FROM saltos
GROUP BY estado
HAVING COUNT(*) >= 2
ORDER BY total_registros DESC;

SELECT
    nivel,
    SUM(costo) AS ingresos_potenciales
FROM saltos
WHERE estado <> 'cancelado'
GROUP BY nivel
HAVING SUM(costo) > 500
ORDER BY ingresos_potenciales DESC;

SELECT
    nivel,
    MAX(altura_metros) AS altura_maxima,
    MIN(altura_metros) AS altura_minima
FROM saltos
GROUP BY nivel
HAVING MAX(altura_metros) >= 4000
ORDER BY altura_maxima DESC;

SELECT
    nivel,
    COUNT(*) AS saltos_completados
FROM saltos
WHERE estado = 'completado'
GROUP BY nivel
HAVING COUNT(*) >= 2
ORDER BY saltos_completados DESC;