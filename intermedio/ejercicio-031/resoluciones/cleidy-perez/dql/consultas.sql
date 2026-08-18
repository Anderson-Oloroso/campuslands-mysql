-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM jugadores_esports;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM jugadores_esports
GROUP BY categoria
ORDER BY promedio DESC;


SELECT 
    j.id_jugadores,
    j.nombre AS jugador,
    j.categoria,
    j.puntaje,
    e.nombre_equipo,
    e.region
FROM jugadores_esports j
INNER JOIN equipos e 
    ON j.id_equipo = e.id_equipo
ORDER BY j.puntaje DESC;

