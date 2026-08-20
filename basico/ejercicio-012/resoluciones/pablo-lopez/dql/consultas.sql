USE playlist_musical;

SELECT
    id_playlist,
    nombre,
    genero,
    cantidad_canciones,
    estado
FROM playlists
WHERE estado = 'activa';

SELECT
    nombre,
    genero,
    cantidad_canciones
FROM playlists
ORDER BY cantidad_canciones DESC;

SELECT
    nombre,
    genero,
    cantidad_canciones,
    duracion_minutos
FROM playlists
WHERE estado = 'activa'
ORDER BY cantidad_canciones DESC
LIMIT 5;

SELECT
    genero,
    COUNT(*) AS total_playlists,
    AVG(cantidad_canciones) AS promedio_canciones
FROM playlists
GROUP BY genero
ORDER BY promedio_canciones DESC;

SELECT
    nombre,
    genero,
    duracion_minutos
FROM playlists
WHERE duracion_minutos >= 100
ORDER BY duracion_minutos DESC;

SELECT
    COUNT(*) AS total_playlists,
    SUM(cantidad_canciones) AS total_canciones,
    AVG(cantidad_canciones) AS promedio_canciones,
    AVG(duracion_minutos) AS duracion_promedio
FROM playlists;