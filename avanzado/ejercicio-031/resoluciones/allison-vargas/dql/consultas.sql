USE db_esports_moba;

-- Consulta 1: Listar jugadores activos con su respectivo equipo y rol
SELECT j.alias AS jugador, j.rol, e.nombre AS equipo, j.kda_promedio
FROM jugadores j
JOIN equipos e ON j.equipo_id = e.id
ORDER BY j.kda_promedio DESC;

-- Consulta 2: Reporte de rendimiento de equipos (KDA promedio de sus integrantes)
SELECT e.nombre AS equipo, e.region, ROUND(AVG(j.kda_promedio), 2) AS kda_equipo
FROM equipos e
JOIN jugadores j ON e.id = j.equipo_id
GROUP BY e.id, e.nombre, e.region
ORDER BY kda_equipo DESC;

-- Consulta 3: Historial detallado de partidas con nombres de equipos
SELECT 
    p.id AS partida_id,
    eg.nombre AS ganador,
    ep.nombre AS perdedor,
    p.duracion_minutos,
    p.fecha_partida
FROM partidas p
JOIN equipos eg ON p.equipo_ganador_id = eg.id
JOIN equipos ep ON p.equipo_perdedor_id = ep.id
ORDER BY p.duracion_minutos DESC;

-- Consulta 4: Ranking o Top de equipos con más victorias registradas
SELECT 
    e.nombre AS equipo,
    COUNT(p.id) AS total_victorias
FROM equipos e
JOIN partidas p ON e.id = p.equipo_ganador_id
GROUP BY e.id, e.nombre
ORDER BY total_victorias DESC;

-- Consulta 5: Filtrar partidas cuya duración supere la media general
SELECT id, duracion_minutos, fecha_partida
FROM partidas
WHERE duracion_minutos > (SELECT AVG(duracion_minutos) FROM partidas);
