-- Consultas de reportes sobre canciones_playlist.
USE campuslands_mysql;

-- 1. Reporte general ordenado por reproducciones
SELECT titulo, artista, genero, reproducciones
FROM canciones_playlist
ORDER BY reproducciones DESC;

-- 2. Duracion total y promedio por genero
SELECT genero,
       COUNT(*) AS total_canciones,
       SUM(duracion_segundos) AS duracion_total_seg,
       ROUND(AVG(duracion_segundos), 2) AS duracion_promedio_seg
FROM canciones_playlist
GROUP BY genero
ORDER BY duracion_total_seg DESC;

-- 3. Top 3 canciones mas reproducidas
SELECT titulo, artista, reproducciones
FROM canciones_playlist
ORDER BY reproducciones DESC
LIMIT 3;

-- 4. Canciones por encima del promedio general de reproducciones
SELECT titulo, artista, reproducciones
FROM canciones_playlist
WHERE reproducciones > (SELECT AVG(reproducciones) FROM canciones_playlist)
ORDER BY reproducciones DESC;

-- 5. Reporte de artistas con mas de una cancion en la playlist
SELECT artista, COUNT(*) AS canciones_registradas
FROM canciones_playlist
GROUP BY artista
HAVING COUNT(*) > 1
ORDER BY canciones_registradas DESC;
