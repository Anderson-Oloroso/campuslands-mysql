-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    nombre,
    propietario,
    genero,
    privacidad
FROM playlists;

SELECT
    nombre,
    propietario
FROM playlists
WHERE privacidad='Pública';

SELECT
    nombre,
    cantidad_canciones
FROM playlists
ORDER BY cantidad_canciones DESC;

SELECT
    nombre,
    duracion_minutos
FROM playlists
WHERE duracion_minutos > 120;

SELECT
    genero,
    COUNT(*) AS total_playlists
FROM playlists
GROUP BY genero;

SELECT
    nombre,
    fecha_creacion
FROM playlists
ORDER BY fecha_creacion;