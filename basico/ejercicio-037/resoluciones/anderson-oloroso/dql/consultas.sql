USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por puntos_liga descendentemente
SELECT equipo_id, nombre_equipo, ciudad, estadio, puntos_liga, estado
FROM equipos_futbol
ORDER BY puntos_liga DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT equipo_id, nombre_equipo, ciudad, puntos_liga
FROM equipos_futbol
WHERE estado = 'Activo';

-- 3. Agrupar por ciudad y calcular total y promedio de puntos_liga
SELECT ciudad, COUNT(*) AS total_registros, AVG(puntos_liga) AS promedio_valor
FROM equipos_futbol
GROUP BY ciudad
ORDER BY promedio_valor DESC;

-- 4. Filtrar por puntos_liga mayor a 2000
SELECT equipo_id, nombre_equipo, ciudad, puntos_liga
FROM equipos_futbol
WHERE puntos_liga > 2000.00
ORDER BY puntos_liga ASC;

-- 5. Seleccionar los 5 mejores registros según puntos_liga
SELECT equipo_id, nombre_equipo, ciudad, puntos_liga
FROM equipos_futbol
ORDER BY puntos_liga DESC
LIMIT 5;
