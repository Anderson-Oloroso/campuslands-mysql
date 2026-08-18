USE ejercicio_12_int;
-- Reporte general de playlists.
SELECT
    p.nombre AS playlist,
    u.nombre AS usuario,
    p.fecha_creacion,
    COUNT(pc.id_cancion) AS cantidad_canciones
FROM playlists p
INNER JOIN usuarios u
    ON p.id_usuario = u.id_usuario
LEFT JOIN playlist_canciones pc
    ON p.id_playlist = pc.id_playlist
GROUP BY
    p.id_playlist,
    p.nombre,
    u.nombre,
    p.fecha_creacion
ORDER BY cantidad_canciones DESC;

-- Reporte de canciones por genero

 SELECT
    g.nombre AS genero,
    COUNT(c.id_cancion) AS cantidad_canciones,
    ROUND(AVG(c.duracion_segundos), 2) AS duracion_promedio_segundos
FROM generos g
LEFT JOIN canciones c
    ON g.id_genero = c.id_genero
GROUP BY
    g.id_genero,
    g.nombre
ORDER BY cantidad_canciones DESC;

-- Reporte de artistas mas utilizados

SELECT
    a.nombre AS artista,
    a.pais_origen,
    COUNT(pc.id_cancion) AS apariciones_en_playlists
FROM artistas a
INNER JOIN canciones c
    ON a.id_artista = c.id_artista
INNER JOIN playlist_canciones pc
    ON c.id_cancion = pc.id_cancion
GROUP BY
    a.id_artista,
    a.nombre,
    a.pais_origen
ORDER BY apariciones_en_playlists DESC;

--  Reporte Detallado de playlist

SELECT
    p.nombre AS playlist,
    u.nombre AS usuario,
    pc.posicion,
    c.titulo AS cancion,
    a.nombre AS artista,
    g.nombre AS genero,
    c.duracion_segundos
FROM playlist_canciones pc
INNER JOIN playlists p
    ON pc.id_playlist = p.id_playlist
INNER JOIN usuarios u
    ON p.id_usuario = u.id_usuario
INNER JOIN canciones c
    ON pc.id_cancion = c.id_cancion
INNER JOIN artistas a
    ON c.id_artista = a.id_artista
INNER JOIN generos g
    ON c.id_genero = g.id_genero
ORDER BY
    p.nombre,
    pc.posicion;


