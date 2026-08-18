-- Ejercicio 012 - modelado de entidad para playlist musical
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Total de canciones y duracion promedio por genero
SELECT genero,
    COUNT(*) AS total_canciones,
    ROUND(AVG(duracion_segundos), 2) AS duracion_promedio_seg
FROM basico_ejercicio_012
GROUP BY genero
ORDER BY duracion_promedio_seg DESC;

-- 2. Top 5 canciones mas largas
SELECT nombre_cancion, artista, duracion_segundos
FROM basico_ejercicio_012
ORDER BY duracion_segundos DESC
LIMIT 5;

-- 3. Canciones marcadas como favoritas, ordenadas por duracion
SELECT nombre_cancion, artista, genero, duracion_segundos
FROM basico_ejercicio_012
WHERE favorito = 'si'
ORDER BY duracion_segundos DESC;

-- 4. Conteo de canciones por artista
SELECT artista, COUNT(*) AS total_canciones
FROM basico_ejercicio_012
GROUP BY artista
ORDER BY total_canciones DESC;

-- 5. Duracion total (SUM) de la playlist agregada en el primer trimestre de 2026
SELECT SUM(duracion_segundos) AS duracion_total_seg
FROM basico_ejercicio_012
WHERE agregada_en BETWEEN '2026-01-01 00:00:00' AND '2026-03-31 23:59:59';