SELECT 
    u.usuario_id,
    u.nombre AS usuario,
    u.pais,
    COUNT(DISTINCT p.playlist_id) AS total_playlists,
    COUNT(c.cancion_id) AS total_canciones,
    COALESCE(SUM(c.duracion_segundos), 0) AS duracion_total_segundos,
    ROUND(COALESCE(SUM(c.duracion_segundos), 0) / 60.0, 2) AS duracion_total_minutos
FROM usuarios u
LEFT JOIN playlists p ON u.usuario_id = p.usuario_id
LEFT JOIN canciones c ON p.playlist_id = c.playlist_id
GROUP BY u.usuario_id, u.nombre, u.pais
ORDER BY duracion_total_segundos DESC;

SELECT 
    p.playlist_id,
    p.titulo AS playlist,
    u.nombre AS propietario,
    p.visibilidad,
    COUNT(c.cancion_id) AS cantidad_canciones,
    COALESCE(SUM(c.duracion_segundos), 0) AS duracion_total_seg,
    ROUND(AVG(c.duracion_segundos), 1) AS promedio_seg_por_cancion
FROM playlists p
INNER JOIN usuarios u ON p.usuario_id = u.usuario_id
LEFT JOIN canciones c ON p.playlist_id = c.playlist_id
GROUP BY p.playlist_id, p.titulo, u.nombre, p.visibilidad
ORDER BY p.playlist_id;