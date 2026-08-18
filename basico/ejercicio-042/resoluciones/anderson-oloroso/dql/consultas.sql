USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por reproducciones descendentemente
SELECT cancion_id, titulo_cancion, artista, genero, reproducciones, estado
FROM canciones_playlist
ORDER BY reproducciones DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT cancion_id, titulo_cancion, artista, reproducciones
FROM canciones_playlist
WHERE estado = 'Activo';

-- 3. Agrupar por artista y calcular total y promedio de reproducciones
SELECT artista, COUNT(*) AS total_registros, AVG(reproducciones) AS promedio_valor
FROM canciones_playlist
GROUP BY artista
ORDER BY promedio_valor DESC;

-- 4. Filtrar por reproducciones mayor a 2000
SELECT cancion_id, titulo_cancion, artista, reproducciones
FROM canciones_playlist
WHERE reproducciones > 2000.00
ORDER BY reproducciones ASC;

-- 5. Seleccionar los 5 mejores registros según reproducciones
SELECT cancion_id, titulo_cancion, artista, reproducciones
FROM canciones_playlist
ORDER BY reproducciones DESC
LIMIT 5;
