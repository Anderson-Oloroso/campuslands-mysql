USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por puntos_recompensa descendentemente
SELECT nivel_id, nombre_nivel, mundo, dificultad, puntos_recompensa, estado
FROM niveles_aventura
ORDER BY puntos_recompensa DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT nivel_id, nombre_nivel, mundo, puntos_recompensa
FROM niveles_aventura
WHERE estado = 'Activo';

-- 3. Agrupar por mundo y calcular total y promedio de puntos_recompensa
SELECT mundo, COUNT(*) AS total_registros, AVG(puntos_recompensa) AS promedio_valor
FROM niveles_aventura
GROUP BY mundo
ORDER BY promedio_valor DESC;

-- 4. Filtrar por puntos_recompensa mayor a 2000
SELECT nivel_id, nombre_nivel, mundo, puntos_recompensa
FROM niveles_aventura
WHERE puntos_recompensa > 2000.00
ORDER BY puntos_recompensa ASC;

-- 5. Seleccionar los 5 mejores registros según puntos_recompensa
SELECT nivel_id, nombre_nivel, mundo, puntos_recompensa
FROM niveles_aventura
ORDER BY puntos_recompensa DESC
LIMIT 5;
