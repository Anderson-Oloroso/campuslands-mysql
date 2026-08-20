USE campuslands_mysql;

SELECT
    nombre AS playlist,
    genero_principal AS genero,
    cantidad_canciones AS canciones,
    ROW_NUMBER() OVER (
        ORDER BY cantidad_canciones DESC
    ) AS posicion_general
FROM playlists
ORDER BY posicion_general;

SELECT
    nombre AS playlist,
    genero_principal AS genero,
    cantidad_canciones AS canciones,
    RANK() OVER (
        PARTITION BY genero_principal
        ORDER BY cantidad_canciones DESC
    ) AS posicion_genero
FROM playlists
ORDER BY genero_principal, posicion_genero;


SELECT
    nombre AS playlist,
    genero_principal AS genero,
    cantidad_canciones AS canciones,
    ROUND(
        AVG(cantidad_canciones) OVER (
            PARTITION BY genero_principal
        ),
        2
    ) AS promedio_genero
FROM playlists
ORDER BY genero_principal, canciones DESC;