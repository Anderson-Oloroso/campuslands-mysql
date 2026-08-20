USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por puntos descendentemente
SELECT equipo_id, nombre_equipo, region, entrenador, puntos, estado
FROM equipos_moba
ORDER BY puntos DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT equipo_id, nombre_equipo, region, puntos
FROM equipos_moba
WHERE estado = 'Activo';

-- 3. Agrupar por region y calcular total y promedio de puntos
SELECT region, COUNT(*) AS total_registros, AVG(puntos) AS promedio_valor
FROM equipos_moba
GROUP BY region
ORDER BY promedio_valor DESC;

-- 4. Filtrar por puntos mayor a 2000
SELECT equipo_id, nombre_equipo, region, puntos
FROM equipos_moba
WHERE puntos > 2000.00
ORDER BY puntos ASC;

-- 5. Seleccionar los 5 mejores registros según puntos
SELECT equipo_id, nombre_equipo, region, puntos
FROM equipos_moba
ORDER BY puntos DESC
LIMIT 5;
