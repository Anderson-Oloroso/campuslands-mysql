-- DQL: Reportes ejecutivos y consolidados de playlists y rendimiento musical
USE campuslands_mysql;

-- 1. Reporte ejecutivo de playlists: resumen de pistas, duración total y reproducciones
SELECT 
    p.playlist_id,
    p.nombre_playlist,
    p.creador,
    p.tipo_acceso,
    COUNT(d.detalle_id) AS total_canciones,
    ROUND(SUM(d.duracion_segundos) / 60, 2) AS duracion_total_minutos,
    SUM(d.reproducciones) AS reproducciones_totales
FROM reportes_playlists p
LEFT JOIN detalle_playlist_canciones d ON p.playlist_id = d.playlist_id
GROUP BY p.playlist_id, p.nombre_playlist, p.creador, p.tipo_acceso;

-- 2. Reporte de distribución por género en toda la plataforma
SELECT 
    d.genero,
    COUNT(d.detalle_id) AS cantidad_canciones,
    SUM(d.reproducciones) AS reproducciones_acumuladas,
    ROUND(AVG(d.reproducciones), 0) AS promedio_reproducciones_por_pista
FROM detalle_playlist_canciones d
GROUP BY d.genero
ORDER BY reproducciones_acumuladas DESC;

-- 3. Reporte de los 3 artistas más reproducidos dentro de las playlists
SELECT 
    d.artista,
    COUNT(d.detalle_id) AS apariciones_en_playlists,
    SUM(d.reproducciones) AS total_escuchas
FROM detalle_playlist_canciones d
GROUP BY d.artista
ORDER BY total_escuchas DESC
LIMIT 3;

-- 4. Reporte de playlists con duración promedio de canción superior a 3.5 minutos (210s)
SELECT 
    p.nombre_playlist,
    COUNT(d.detalle_id) AS total_pistas,
    ROUND(AVG(d.duracion_segundos), 1) AS duracion_promedio_pista_seg
FROM reportes_playlists p
INNER JOIN detalle_playlist_canciones d ON p.playlist_id = d.playlist_id
GROUP BY p.playlist_id, p.nombre_playlist
HAVING AVG(d.duracion_segundos) > 210;

-- 5. Listado detallado de canciones registradas en playlists públicas
SELECT 
    p.nombre_playlist,
    d.titulo_cancion,
    d.artista,
    d.genero,
    d.reproducciones
FROM reportes_playlists p
INNER JOIN detalle_playlist_canciones d ON p.playlist_id = d.playlist_id
WHERE p.tipo_acceso = 'publica'
ORDER BY d.reproducciones DESC;
