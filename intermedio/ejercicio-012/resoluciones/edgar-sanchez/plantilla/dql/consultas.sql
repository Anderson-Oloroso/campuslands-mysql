SELECT 
    p.playlist_id,
    p.nombre_playlist,
    u.nombre_usuario AS propietario,
    u.tipo_suscripcion,
    COUNT(ep.cancion_id) AS total_canciones,
    COALESCE(SUM(c.duracion_segundos), 0) AS duracion_total_segundos,
    ROUND(COALESCE(SUM(c.duracion_segundos), 0) / 60.0, 2) AS duracion_total_minutos,
    SUM(CASE WHEN c.es_explicita = TRUE THEN 1 ELSE 0 END) AS total_canciones_explicitas
FROM playlists_musica p
INNER JOIN usuarios_playlist u ON p.usuario_id = u.usuario_id
LEFT JOIN elementos_playlist ep ON p.playlist_id = ep.playlist_id
LEFT JOIN canciones_playlist c ON ep.cancion_id = c.cancion_id
GROUP BY p.playlist_id, p.nombre_playlist, u.nombre_usuario, u.tipo_suscripcion
ORDER BY duracion_total_segundos DESC;

SELECT 
    a.artista_id,
    a.nombre_artista,
    a.genero_principal,
    a.pais_origen,
    COUNT(DISTINCT c.cancion_id) AS total_canciones_registradas,
    COUNT(ep.elemento_id) AS total_veces_en_playlists
FROM artistas_playlist a
LEFT JOIN canciones_playlist c ON a.artista_id = c.artista_id
LEFT JOIN elementos_playlist ep ON c.cancion_id = ep.cancion_id
GROUP BY a.artista_id, a.nombre_artista, a.genero_principal, a.pais_origen
ORDER BY total_veces_en_playlists DESC, total_canciones_registradas DESC;