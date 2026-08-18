USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por oro descendentemente
SELECT personaje_id, nombre_personaje, clase, nivel, oro, estado
FROM personajes_rpg
ORDER BY oro DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT personaje_id, nombre_personaje, clase, oro
FROM personajes_rpg
WHERE estado = 'Activo';

-- 3. Agrupar por clase y calcular total y promedio de oro
SELECT clase, COUNT(*) AS total_registros, AVG(oro) AS promedio_valor
FROM personajes_rpg
GROUP BY clase
ORDER BY promedio_valor DESC;

-- 4. Filtrar por oro mayor a 2000
SELECT personaje_id, nombre_personaje, clase, oro
FROM personajes_rpg
WHERE oro > 2000.00
ORDER BY oro ASC;

-- 5. Seleccionar los 5 mejores registros según oro
SELECT personaje_id, nombre_personaje, clase, oro
FROM personajes_rpg
ORDER BY oro DESC
LIMIT 5;
