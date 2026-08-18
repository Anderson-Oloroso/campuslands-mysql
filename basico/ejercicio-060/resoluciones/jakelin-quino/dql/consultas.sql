-- 1. Ver todos los streamers
SELECT * FROM `ejercicio-060-bas-streamers`;

-- 2. Ver todos los equipos con su streamer
SELECT e.nombre AS equipo, s.nombre AS streamer, e.juego_principal
FROM `ejercicio-060-bas-equipos` e
INNER JOIN `ejercicio-060-bas-streamers` s ON e.streamer_id = s.id;

-- 3. Streamers con más de 12000 seguidores
SELECT nombre, plataforma, seguidores 
FROM `ejercicio-060-bas-streamers`
WHERE seguidores > 12000;