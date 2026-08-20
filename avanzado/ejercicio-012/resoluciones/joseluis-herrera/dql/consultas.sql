SELECT 
    p.titulo AS playlist,
    c.titulo AS cancion,
    c.artista,
    c.duracion_segundos,
    ROW_NUMBER() OVER(
        PARTITION BY c.playlist_id 
        ORDER BY c.cancion_id ASC
    ) AS numero_pista
FROM canciones c
INNER JOIN playlists p ON c.playlist_id = p.playlist_id;

SELECT 
    p.titulo AS playlist,
    c.titulo AS cancion,
    c.duracion_segundos,
    DENSE_RANK() OVER(
        PARTITION BY c.playlist_id 
        ORDER BY c.duracion_segundos DESC
    ) AS rank_duracion
FROM canciones c
INNER JOIN playlists p ON c.playlist_id = p.playlist_id