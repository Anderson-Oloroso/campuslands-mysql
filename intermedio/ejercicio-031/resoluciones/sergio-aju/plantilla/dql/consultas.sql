USE campuslands_mysql;

-- 1. Listar todos los jugadores junto con el nombre de su equipo y región utilizando INNER JOIN
SELECT 
    j.nickname,
    j.nombre_real,
    j.rol,
    e.nombre_equipo AS equipo,
    e.tag_abreviado AS tag,
    e.region
FROM jugadores_moba j
INNER JOIN equipos_moba e ON j.equipo_id = e.id
ORDER BY e.nombre_equipo ASC, j.nickname ASC;

-- 2. Reporte de rendimiento individual de jugadores calculando su KDA aproximado ((Asesinatos + Asistencias) / Muertes)
SELECT 
    j.nickname,
    j.rol,
    e.nombre_equipo AS equipo,
    j.asesinatos_totales,
    j.muertes_totales,
    j.asistencias_totales,
    ROUND((j.asesinatos_totales + j.asistencias_totales) / NULLIF(j.muertes_totales, 0), 2) AS kda_ratio
FROM jugadores_moba j
INNER JOIN equipos_moba e ON j.equipo_id = e.id
ORDER BY kda_ratio DESC;

-- 3. Conteo de jugadores por equipo y puntos de liga asociados mediante INNER JOIN y agregación
SELECT 
    e.nombre_equipo,
    e.region,
    e.puntos_liga,
    COUNT(j.id) AS total_jugadores_registrados
FROM equipos_moba e
INNER JOIN jugadores_moba j ON e.id = j.equipo_id
GROUP BY e.id, e.nombre_equipo, e.region, e.puntos_liga
ORDER BY e.puntos_liga DESC;

-- 4. Filtrar jugadores cuyo rol sea 'Mid Laner' mostrando su equipo correspondiente
SELECT 
    j.nickname,
    j.nombre_real,
    j.rol,
    e.nombre_equipo AS equipo,
    j.asesinatos_totales
FROM jugadores_moba j
INNER JOIN equipos_moba e ON j.equipo_id = e.id
WHERE j.rol = 'Mid Laner'
ORDER BY j.asesinatos_totales DESC;

-- 5. Top 3 jugadores con mayor cantidad de asesinatos totales en el torneo
SELECT 
    j.nickname,
    j.rol,
    e.nombre_equipo AS equipo,
    j.asesinatos_totales
FROM jugadores_moba j
INNER JOIN equipos_moba e ON j.equipo_id = e.id
ORDER BY j.asesinatos_totales DESC
LIMIT 3;