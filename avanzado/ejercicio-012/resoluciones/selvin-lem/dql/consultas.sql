-- Ejercicio 012 (Intermedio) - consultas de reportes para playlist musical
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Top 5 canciones mas reproducidas
SELECT nombre_cancion, artista, reproducciones
FROM reproducciones_playlist
ORDER BY reproducciones DESC
LIMIT 5;

-- 2. Artista con mayor total de reproducciones acumuladas
SELECT artista, SUM(reproducciones) AS total_reproducciones
FROM reproducciones_playlist
GROUP BY artista
ORDER BY total_reproducciones DESC
LIMIT 1;

-- 3. Generos con mas de una cancion en la playlist (reporte con HAVING)
SELECT genero, COUNT(*) AS total_canciones
FROM reproducciones_playlist
GROUP BY genero
HAVING COUNT(*) > 1
ORDER BY total_canciones DESC;

-- 4. Canciones con duracion mayor al promedio general (subconsulta)
SELECT nombre_cancion, artista, duracion_segundos
FROM reproducciones_playlist
WHERE duracion_segundos > (
  SELECT AVG(duracion_segundos) FROM reproducciones_playlist
)
ORDER BY duracion_segundos DESC;

-- 5. Reporte de reproducciones totales por genero
SELECT genero,
       COUNT(*) AS total_canciones,
       SUM(reproducciones) AS reproducciones_totales,
       ROUND(AVG(reproducciones), 2) AS reproducciones_promedio
FROM reproducciones_playlist
GROUP BY genero
ORDER BY reproducciones_totales DESC;
