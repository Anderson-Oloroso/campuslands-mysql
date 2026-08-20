USE ejercicio_12;
-- Mostrar canciones donde la duracion sea mayor a 240.
SELECT
    titulo,
    duracion_segundos
FROM canciones
WHERE duracion_segundos > 240;

-- Mostrar las canciones con sus artistas.
SELECT
    c.titulo,
    c.album,
    c.anio_lanzamiento,
    a.nombre_artistico AS artista
FROM canciones c
INNER JOIN artistas a
    ON c.id_artista = a.id_artista;

-- Mostrar todas las playlists con su propietario    
SELECT
    p.nombre AS playlist,
    p.descripcion,
    u.nombre AS propietario,
    p.publica
FROM playlists p
INNER JOIN usuarios u
    ON p.id_usuario = u.id_usuario;
    
-- Mostrar las canciones de cada playlist

SELECT
    p.nombre AS playlist,
    c.titulo AS cancion,
    a.nombre_artistico AS artista,
    pc.posicion
FROM playlist_canciones pc
INNER JOIN playlists p
    ON pc.id_playlist = p.id_playlist
INNER JOIN canciones c
    ON pc.id_cancion = c.id_cancion
INNER JOIN artistas a
    ON c.id_artista = a.id_artista
ORDER BY p.id_playlist, pc.posicion;

-- Mostrar la playlists publicas
SELECT
    nombre,
    descripcion,
    fecha_creacion
FROM playlists
WHERE publica = TRUE;

-- Mostrar canciones con duracion mayor a 4 minutos
SELECT
    titulo,
    duracion_segundos
FROM canciones
WHERE duracion_segundos > 240;

-- Mostrar canciones por anio de lanzamiento
SELECT
    titulo,
    album,
    anio_lanzamiento
FROM canciones
ORDER BY anio_lanzamiento DESC;

-- Contar cuantas canciones tiene cada playlist
SELECT
    p.nombre AS playlist,
    COUNT(pc.id_cancion) AS total_canciones
FROM playlists p
LEFT JOIN playlist_canciones pc
    ON p.id_playlist = pc.id_playlist
GROUP BY p.id_playlist, p.nombre
ORDER BY total_canciones DESC;

-- Mostrar cuantas canciones tiene cada artista
SELECT
    a.nombre_artistico AS artista,
    COUNT(c.id_cancion) AS total_canciones
FROM artistas a
LEFT JOIN canciones c
    ON a.id_artista = c.id_artista
GROUP BY a.id_artista, a.nombre_artistico
ORDER BY total_canciones DESC;



