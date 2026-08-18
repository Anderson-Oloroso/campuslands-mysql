USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por victorias descendentemente
SELECT equipo_id, nombre_equipo, categoria, patrocinador, victorias, estado
FROM equipos_futsal
ORDER BY victorias DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT equipo_id, nombre_equipo, categoria, victorias
FROM equipos_futsal
WHERE estado = 'Activo';

-- 3. Agrupar por categoria y calcular total y promedio de victorias
SELECT categoria, COUNT(*) AS total_registros, AVG(victorias) AS promedio_valor
FROM equipos_futsal
GROUP BY categoria
ORDER BY promedio_valor DESC;

-- 4. Filtrar por victorias mayor a 2000
SELECT equipo_id, nombre_equipo, categoria, victorias
FROM equipos_futsal
WHERE victorias > 2000.00
ORDER BY victorias ASC;

-- 5. Seleccionar los 5 mejores registros según victorias
SELECT equipo_id, nombre_equipo, categoria, victorias
FROM equipos_futsal
ORDER BY victorias DESC
LIMIT 5;
