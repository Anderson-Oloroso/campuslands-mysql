USE campuslands_mysql;

-- 1. Zonas que tienen al menos 3 saltos registrados.
SELECT
    zona_salto,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY zona_salto
HAVING COUNT(*) >= 3
ORDER BY total_saltos DESC;


-- 2. Niveles de experiencia con al menos 4 participantes.
SELECT
    nivel_experiencia,
    COUNT(*) AS total_participantes
FROM saltos
GROUP BY nivel_experiencia
HAVING COUNT(*) >= 4
ORDER BY total_participantes DESC;


-- 3. Zonas cuyo costo promedio supera los 400.
SELECT
    zona_salto,
    COUNT(*) AS total_saltos,
    ROUND(AVG(costo), 2) AS costo_promedio
FROM saltos
GROUP BY zona_salto
HAVING AVG(costo) > 400
ORDER BY costo_promedio DESC;


-- 4. Zonas con un costo total superior a 1200.
SELECT
    zona_salto,
    COUNT(*) AS total_saltos,
    ROUND(SUM(costo), 2) AS costo_total
FROM saltos
GROUP BY zona_salto
HAVING SUM(costo) > 1200
ORDER BY costo_total DESC;


-- 5. Niveles de experiencia cuya altura promedio supera los 2800 metros.
SELECT
    nivel_experiencia,
    COUNT(*) AS total_saltos,
    ROUND(AVG(altura_salto_m), 2) AS altura_promedio_m
FROM saltos
GROUP BY nivel_experiencia
HAVING AVG(altura_salto_m) > 2800
ORDER BY altura_promedio_m DESC;


-- 6. Zonas con al menos 2 saltos realizados.
SELECT
    zona_salto,
    COUNT(*) AS saltos_realizados
FROM saltos
WHERE estado = 'realizado'
GROUP BY zona_salto
HAVING COUNT(*) >= 2
ORDER BY saltos_realizados DESC;


-- 7. Grupos por nivel que tienen un costo promedio superior a 400.
SELECT
    nivel_experiencia,
    COUNT(*) AS total_saltos,
    ROUND(AVG(costo), 2) AS costo_promedio,
    ROUND(AVG(altura_salto_m), 2) AS altura_promedio_m
FROM saltos
GROUP BY nivel_experiencia
HAVING AVG(costo) > 400
ORDER BY costo_promedio DESC;