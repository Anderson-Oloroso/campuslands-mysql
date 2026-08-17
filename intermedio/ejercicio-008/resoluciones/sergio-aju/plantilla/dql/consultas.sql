-- DQL: Consultas, reportes y métricas de negocio
USE futbol_sala_db;

-- Consulta 1: Listado general de jugadores con el nombre de su equipo (INNER JOIN)
SELECT 
    j.nombre_completo AS jugador, 
    j.posicion, 
    j.dorsal, 
    e.nombre_equipo AS equipo, 
    j.estado
FROM jugadores j
INNER JOIN equipos e ON j.id_equipo = e.id_equipo;

-- Consulta 2: Tabla de goleadores acumulados por jugador (GROUP BY y SUM)
SELECT 
    j.nombre_completo AS jugador, 
    SUM(ep.goles_anotados) AS total_goles,
    SUM(ep.asistencias) AS total_asistencias
FROM jugadores j
INNER JOIN estadisticas_partido ep ON j.id_jugador = ep.id_jugador
GROUP BY j.id_jugador, j.nombre_completo
ORDER BY total_goles DESC;

-- Consulta 3: Promedio de calificación de rendimiento por jugador (Funciones de agregación)
SELECT 
    j.nombre_completo AS jugador, 
    COUNT(ep.id_estadistica) AS partidos_jugados,
    ROUND(AVG(ep.calificacion_partido), 2) AS promedio_rendimiento
FROM jugadores j
INNER JOIN estadisticas_partido ep ON j.id_jugador = ep.id_jugador
GROUP BY j.id_jugador, j.nombre_completo
ORDER BY promedio_rendimiento DESC;

-- Consulta 4: Filtrar jugadores activos que pertenecen a equipos de la categoría 'Masculino A'
SELECT 
    j.nombre_completo AS jugador, 
    j.posicion, 
    e.nombre_equipo, 
    e.categoria
FROM jugadores j
INNER JOIN equipos e ON j.id_equipo = e.id_equipo
WHERE j.estado = 'Activo' AND e.categoria = 'Masculino A';

-- Consulta 5: Top 3 de mejores actuaciones individuales en un partido (Ranking con ORDER BY y LIMIT)
SELECT 
    j.nombre_completo AS jugador, 
    e.nombre_equipo AS equipo,
    ep.goles_anotados, 
    ep.calificacion_partido AS calificacion, 
    ep.fecha_partido
FROM estadisticas_partido ep
INNER JOIN jugadores j ON ep.id_jugador = j.id_jugador
INNER JOIN equipos e ON j.id_equipo = e.id_equipo
ORDER BY ep.calificacion_partido DESC
LIMIT 3;