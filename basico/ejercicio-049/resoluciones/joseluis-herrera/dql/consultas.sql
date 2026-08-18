USE campuslands_mysql;

SELECT
    id_salto,
    participante,
    nivel,
    altura_metros,
    costo,
    estado
FROM saltos
ORDER BY participante;

SELECT
    participante,
    nivel,
    costo
FROM saltos
WHERE estado = 'reservado'
ORDER BY fecha_salto;

SELECT
    nivel,
    COUNT(*) AS total_saltos,
    ROUND(AVG(costo),2) AS costo_promedio
FROM saltos
GROUP BY nivel
ORDER BY costo_promedio DESC;

SELECT
    participante,
    altura_metros,
    costo
FROM saltos
WHERE altura_metros >= 4000
ORDER BY altura_metros DESC;

SELECT
    participante,
    costo
FROM saltos
ORDER BY costo DESC
LIMIT 5;

SELECT
    estado,
    COUNT(*) AS total
FROM saltos
GROUP BY estado
ORDER BY total DESC;