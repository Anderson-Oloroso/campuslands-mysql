USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por puntuacion descendentemente
SELECT piloto_id, nombre_piloto, escuderia, vehiculo, puntuacion, estado
FROM pilotos_carreras
ORDER BY puntuacion DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT piloto_id, nombre_piloto, escuderia, puntuacion
FROM pilotos_carreras
WHERE estado = 'Activo';

-- 3. Agrupar por escuderia y calcular total y promedio de puntuacion
SELECT escuderia, COUNT(*) AS total_registros, AVG(puntuacion) AS promedio_valor
FROM pilotos_carreras
GROUP BY escuderia
ORDER BY promedio_valor DESC;

-- 4. Filtrar por puntuacion mayor a 2000
SELECT piloto_id, nombre_piloto, escuderia, puntuacion
FROM pilotos_carreras
WHERE puntuacion > 2000.00
ORDER BY puntuacion ASC;

-- 5. Seleccionar los 5 mejores registros según puntuacion
SELECT piloto_id, nombre_piloto, escuderia, puntuacion
FROM pilotos_carreras
ORDER BY puntuacion DESC
LIMIT 5;
