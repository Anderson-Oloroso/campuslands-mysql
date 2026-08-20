USE playlist_musical_db;

-- 1. Listado completo de canciones asociadas a cada playlist con su respectivo orden
SELECT p.nombre AS playlist, c.titulo AS cancion, c.artista, pc.orden
FROM playlist_canciones pc
JOIN playlists p ON pc.id_playlist = p.id_playlist
JOIN canciones c ON pc.id_cancion = c.id_cancion
ORDER BY p.nombre, pc.orden;

-- 2. Conteo de canciones agrupadas por playlist
SELECT p.nombre AS playlist, p.estado, COUNT(pc.id_cancion) AS total_canciones
FROM playlists p
LEFT JOIN playlist_canciones pc ON p.id_playlist = pc.id_playlist
GROUP BY p.id_playlist, p.nombre, p.estado
ORDER BY total_canciones DESC;

-- 3. Duracion total en minutos y segundos de cada playlist
SELECT p.nombre AS playlist, 
       SUM(c.duracion_segundos) AS duracion_total_segundos,
       ROUND(SUM(c.duracion_segundos) / 60, 2) AS duracion_total_minutos
FROM playlists p
JOIN playlist_canciones pc ON p.id_playlist = pc.id_playlist
JOIN canciones c ON pc.id_cancion = c.id_cancion
GROUP BY p.id_playlist, p.nombre;

-- 4. Listado de canciones cuya duracion supera los 3 minutos (180 segundos)
SELECT titulo, artista, album, duracion_segundos
FROM canciones
WHERE duracion_segundos > 180
ORDER BY duracion_segundos DESC;

-- 5. Playlists que se encuentran en estado 'activa'
SELECT nombre, descripcion, creador, estado
FROM playlists
WHERE estado = 'activa';