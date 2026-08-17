USE campuslands_mysql;

-- 1. Tabla de posiciones ordenada por ranking
SELECT ranking_actual, nombre_equipo, region, victorias, derrotas
FROM equipos_moba_basico
ORDER BY ranking_actual;

-- 2. Equipos de la region LATAM
SELECT nombre_equipo, ranking_actual, victorias, derrotas
FROM equipos_moba_basico
WHERE region = 'LATAM';

-- 3. Porcentaje de victorias por equipo
SELECT nombre_equipo,
       victorias, derrotas,
       ROUND(victorias / (victorias + derrotas) * 100, 1) AS porcentaje_victorias
FROM equipos_moba_basico
ORDER BY porcentaje_victorias DESC;

-- 4. Cantidad de equipos por region
SELECT region, COUNT(*) AS total_equipos
FROM equipos_moba_basico
GROUP BY region
ORDER BY total_equipos DESC;

-- 5. Top 3 equipos mejor ubicados en el ranking
SELECT nombre_equipo, ranking_actual
FROM equipos_moba_basico
ORDER BY ranking_actual ASC
LIMIT 3;

-- 6. Equipos fundados antes de 2020
SELECT nombre_equipo, region, fecha_fundacion
FROM equipos_moba_basico
WHERE fecha_fundacion < '2020-01-01'
ORDER BY fecha_fundacion;
