USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por nivel_poder descendentemente
SELECT personaje_id, nombre_personaje, especie, planeta_origen, nivel_poder, estado
FROM personajes_scifi
ORDER BY nivel_poder DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT personaje_id, nombre_personaje, especie, nivel_poder
FROM personajes_scifi
WHERE estado = 'Activo';

-- 3. Agrupar por especie y calcular total y promedio de nivel_poder
SELECT especie, COUNT(*) AS total_registros, AVG(nivel_poder) AS promedio_valor
FROM personajes_scifi
GROUP BY especie
ORDER BY promedio_valor DESC;

-- 4. Filtrar por nivel_poder mayor a 2000
SELECT personaje_id, nombre_personaje, especie, nivel_poder
FROM personajes_scifi
WHERE nivel_poder > 2000.00
ORDER BY nivel_poder ASC;

-- 5. Seleccionar los 5 mejores registros según nivel_poder
SELECT personaje_id, nombre_personaje, especie, nivel_poder
FROM personajes_scifi
ORDER BY nivel_poder DESC
LIMIT 5;
