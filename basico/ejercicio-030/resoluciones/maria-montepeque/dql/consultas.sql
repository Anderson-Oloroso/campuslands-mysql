USE campuslands_mysql;

-- 1. Transmisiones con el nombre del canal (relacion simple via JOIN)
SELECT s.nombre_canal, t.titulo, t.fecha, t.espectadores_pico
FROM transmisiones_basico t
INNER JOIN streamers_basico s ON s.id_streamer = t.id_streamer
ORDER BY t.fecha;

-- 2. Transmisiones de un streamer especifico
SELECT t.titulo, t.duracion_min, t.espectadores_pico
FROM transmisiones_basico t
INNER JOIN streamers_basico s ON s.id_streamer = t.id_streamer
WHERE s.nombre_canal = 'NightOwlGaming';

-- 3. Cantidad de transmisiones por streamer
SELECT s.nombre_canal, COUNT(*) AS total_transmisiones
FROM transmisiones_basico t
INNER JOIN streamers_basico s ON s.id_streamer = t.id_streamer
GROUP BY s.nombre_canal
ORDER BY total_transmisiones DESC;

-- 4. Pico de espectadores mas alto por streamer
SELECT s.nombre_canal, MAX(t.espectadores_pico) AS mayor_pico
FROM transmisiones_basico t
INNER JOIN streamers_basico s ON s.id_streamer = t.id_streamer
GROUP BY s.nombre_canal
ORDER BY mayor_pico DESC;

-- 5. Streamers con mas de 50000 seguidores
SELECT nombre_canal, categoria_principal, seguidores
FROM streamers_basico
WHERE seguidores > 50000
ORDER BY seguidores DESC;

-- 6. Duracion total transmitida por streamer, en horas
SELECT s.nombre_canal, ROUND(SUM(t.duracion_min) / 60, 1) AS horas_transmitidas
FROM transmisiones_basico t
INNER JOIN streamers_basico s ON s.id_streamer = t.id_streamer
GROUP BY s.nombre_canal
ORDER BY horas_transmitidas DESC;
