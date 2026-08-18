USE campuslands_mysql;

-- 1. Mostrar todas las canciones de la playlist.
SELECT
    id_cancion,
    titulo,
    artista,
    album,
    genero,
    duracion_segundos,
    anio_lanzamiento,
    estado
FROM canciones_playlist
ORDER BY titulo ASC;


-- 2. Mostrar únicamente las canciones activas.
SELECT
    titulo,
    artista,
    genero,
    duracion_segundos
FROM canciones_playlist
WHERE estado = 'activa'
ORDER BY titulo ASC;


-- 3. Mostrar las canciones del genero Rock.
SELECT
    titulo,
    artista,
    album,
    duracion_segundos
FROM canciones_playlist
WHERE genero = 'Rock'
ORDER BY duracion_segundos DESC;


-- 4. Mostrar las canciones ordenadas de mayor a menor duración.
SELECT
    titulo,
    artista,
    duracion_segundos
FROM canciones_playlist
ORDER BY duracion_segundos DESC;


-- 5. Contar canciones por genero.
SELECT
    genero,
    COUNT(*) AS total_canciones
FROM canciones_playlist
GROUP BY genero
ORDER BY total_canciones DESC;


-- 6. Calcular la duración promedio de las canciones por genero.
SELECT
    genero,
    ROUND(AVG(duracion_segundos), 2) AS duracion_promedio_segundos
FROM canciones_playlist
GROUP BY genero
ORDER BY duracion_promedio_segundos DESC;


-- 7. Mostrar las cinco canciones mas largas.
SELECT
    titulo,
    artista,
    genero,
    duracion_segundos
FROM canciones_playlist
WHERE estado = 'activa'
ORDER BY duracion_segundos DESC
LIMIT 5;


-- 8. Mostrar canciones lanzadas desde 2015.
SELECT
    titulo,
    artista,
    anio_lanzamiento,
    genero
FROM canciones_playlist
WHERE anio_lanzamiento >= 2015
ORDER BY anio_lanzamiento DESC, titulo ASC;