USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por victorias descendentemente
SELECT jugador_id, nickname, rango, bajas_totales, victorias, estado
FROM jugadores_br
ORDER BY victorias DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT jugador_id, nickname, rango, victorias
FROM jugadores_br
WHERE estado = 'Activo';

-- 3. Agrupar por rango y calcular total y promedio de victorias
SELECT rango, COUNT(*) AS total_registros, AVG(victorias) AS promedio_valor
FROM jugadores_br
GROUP BY rango
ORDER BY promedio_valor DESC;

-- 4. Filtrar por victorias mayor a 2000
SELECT jugador_id, nickname, rango, victorias
FROM jugadores_br
WHERE victorias > 2000.00
ORDER BY victorias ASC;

-- 5. Seleccionar los 5 mejores registros según victorias
SELECT jugador_id, nickname, rango, victorias
FROM jugadores_br
ORDER BY victorias DESC
LIMIT 5;
