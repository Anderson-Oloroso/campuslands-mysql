-- DQL: Consultas avanzadas implementando Window Functions (OVER, PARTITION BY, ORDER BY)
USE campuslands_mysql;

-- 1. Numeración correlativa y ranking de canciones por reproducciones dentro de cada playlist
SELECT 
    p.nombre_playlist,
    c.titulo_cancion,
    c.artista,
    c.reproducciones,
    ROW_NUMBER() OVER(PARTITION BY c.playlist_id ORDER BY c.reproducciones DESC) AS posicion_playlist,
    DENSE_RANK() OVER(PARTITION BY c.playlist_id ORDER BY c.reproducciones DESC) AS ranking_reproducciones
FROM canciones_playlist c
INNER JOIN playlists p ON c.playlist_id = p.playlist_id;

-- 2. Duración acumulada en segundos (Running Total) por playlist
SELECT 
    p.nombre_playlist,
    c.titulo_cancion,
    c.duracion_segundos,
    SUM(c.duracion_segundos) OVER(PARTITION BY c.playlist_id ORDER BY c.cancion_id) AS tiempo_acumulado_seg
FROM canciones_playlist c
INNER JOIN playlists p ON c.playlist_id = p.playlist_id;

-- 3. Comparación de reproducciones de cada canción contra el promedio de su género
SELECT 
    c.titulo_cancion,
    c.genero,
    c.reproducciones,
    ROUND(AVG(c.reproducciones) OVER(PARTITION BY c.genero), 0) AS promedio_reproducciones_genero,
    c.reproducciones - ROUND(AVG(c.reproducciones) OVER(PARTITION BY c.genero), 0) AS diferencia_vs_promedio
FROM canciones_playlist c;

-- 4. Canción con mayor número de reproducciones por cada playlist (Top 1 por ventana)
WITH ranking_canciones AS (
    SELECT 
        p.nombre_playlist,
        c.titulo_cancion,
        c.artista,
        c.reproducciones,
        ROW_NUMBER() OVER(PARTITION BY c.playlist_id ORDER BY c.reproducciones DESC) AS rn
    FROM canciones_playlist c
    INNER JOIN playlists p ON c.playlist_id = p.playlist_id
)
SELECT nombre_playlist, titulo_cancion, artista, reproducciones
FROM ranking_canciones
WHERE rn = 1;

-- 5. Porcentaje de participación de reproducciones de cada canción sobre el total de su playlist
SELECT 
    p.nombre_playlist,
    c.titulo_cancion,
    c.reproducciones,
    SUM(c.reproducciones) OVER(PARTITION BY c.playlist_id) AS total_reproducciones_playlist,
    ROUND((c.reproducciones / SUM(c.reproducciones) OVER(PARTITION BY c.playlist_id)) * 100, 2) AS porcentaje_aporte
FROM canciones_playlist c
INNER JOIN playlists p ON c.playlist_id = p.playlist_id;
