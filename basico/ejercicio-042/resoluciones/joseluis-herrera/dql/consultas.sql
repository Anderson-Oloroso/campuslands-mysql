USE campuslands_mysql;

SELECT
    id_playlist,
    nombre,
    genero_principal,
    cantidad_canciones,
    duracion_minutos,
    estado
FROM playlists
ORDER BY nombre;

SELECT
    nombre,
    genero_principal,
    cantidad_canciones
FROM playlists
WHERE estado = 'activa'
ORDER BY cantidad_canciones DESC;

SELECT
    genero_principal,
    COUNT(*) AS total_playlists,
    AVG(cantidad_canciones) AS promedio_canciones
FROM playlists
GROUP BY genero_principal
ORDER BY total_playlists DESC;