-- 1. Ver todos los streamers
SELECT * FROM `ejercicio-060-int-streamers`;

-- 2. Ver todos los equipos con streamers
SELECT e.nombre AS equipo, s.nombre AS streamer, e.juego_principal
FROM `ejercicio-060-int_equipos` e
INNER JOIN `ejercicio-060-int-streamers` s ON e.streamer_id = s.id;

-- 3. Conteo de equipos por plataforma
SELECT s.plataforma, COUNT(e.id) AS total_equipos
FROM `ejercicio-060-int-streamers` s
LEFT JOIN `ejercicio-060-int_equipos` e ON s.id = e.streamer_id
GROUP BY s.plataforma;