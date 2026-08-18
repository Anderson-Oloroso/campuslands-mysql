USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por ingresos_mes descendentemente
SELECT streamer_id, nickname_streamer, plataforma, seguidores, ingresos_mes, estado
FROM streamers_equipo
ORDER BY ingresos_mes DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT streamer_id, nickname_streamer, plataforma, ingresos_mes
FROM streamers_equipo
WHERE estado = 'Activo';

-- 3. Agrupar por plataforma y calcular total y promedio de ingresos_mes
SELECT plataforma, COUNT(*) AS total_registros, AVG(ingresos_mes) AS promedio_valor
FROM streamers_equipo
GROUP BY plataforma
ORDER BY promedio_valor DESC;

-- 4. Filtrar por ingresos_mes mayor a 2000
SELECT streamer_id, nickname_streamer, plataforma, ingresos_mes
FROM streamers_equipo
WHERE ingresos_mes > 2000.00
ORDER BY ingresos_mes ASC;

-- 5. Seleccionar los 5 mejores registros según ingresos_mes
SELECT streamer_id, nickname_streamer, plataforma, ingresos_mes
FROM streamers_equipo
ORDER BY ingresos_mes DESC
LIMIT 5;
