USE campuslands_mysql;

-- 1. Tabla de clasificación general ordenada por puntos de liga y partidos ganados de forma descendente
SELECT 
    nombre_equipo,
    tag_abreviado,
    region,
    partidos_jugados,
    partidos_ganados,
    partidos_perdidos,
    puntos_liga,
    estado_equipo
FROM equipos_moba
ORDER BY puntos_liga DESC, partidos_ganados DESC;

-- 2. Filtrar únicamente los equipos que se encuentran con estado 'clasificado'
SELECT 
    nombre_equipo,
    tag_abreviado,
    region,
    puntos_liga
FROM equipos_moba
WHERE estado_equipo = 'clasificado'
ORDER BY puntos_liga DESC;

-- 3. Conteo de equipos agrupados por su región de origen
SELECT 
    region,
    COUNT(*) AS total_equipos,
    SUM(puntos_liga) AS puntos_totales_region
FROM equipos_moba
GROUP BY region
ORDER BY total_equipos DESC;

-- 4. Top 3 de los mejores equipos del torneo MOBA basados en sus puntos de liga
SELECT 
    nombre_equipo,
    tag_abreviado,
    puntos_liga,
    estado_equipo
FROM equipos_moba
ORDER BY puntos_liga DESC
LIMIT 3;

-- 5. Estadísticas globales del torneo: promedio de puntos de liga y total de partidos jugados
SELECT 
    COUNT(*) AS total_equipos_inscritos,
    SUM(partidos_jugados) AS total_partidos_registrados,
    ROUND(AVG(puntos_liga), 2) AS promedio_puntos_liga
FROM equipos_moba;