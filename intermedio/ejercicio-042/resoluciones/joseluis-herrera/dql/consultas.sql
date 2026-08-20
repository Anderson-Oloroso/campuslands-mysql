USE campuslands_mysql;

SELECT
    genero_principal AS genero,
    COUNT(*) AS total_playlists,
    SUM(cantidad_canciones) AS canciones_totales,
    ROUND(AVG(duracion_minutos), 2) AS duracion_promedio
FROM playlists
GROUP BY genero_principal
ORDER BY canciones_totales DESC;

SELECT
    estado,
    COUNT(*) AS total_playlists,
    SUM(cantidad_canciones) AS canciones_totales
FROM playlists
GROUP BY estado
ORDER BY total_playlists DESC;

SELECT
    nombre AS playlist,
    genero_principal AS genero,
    cantidad_canciones AS canciones,
    duracion_minutos AS duracion
FROM playlists
WHERE estado = 'activa'
ORDER BY cantidad_canciones DESC;

SELECT
    nombre AS playlist,
    genero_principal AS genero,
    cantidad_canciones AS canciones,
    duracion_minutos AS duracion
FROM playlists
ORDER BY duracion_minutos DESC
LIMIT 5;