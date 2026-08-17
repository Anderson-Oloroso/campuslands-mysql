USE mi_playlist;

-- 1. Reporte principal: Total de reproducciones y duración promedio agrupado por género
SELECT genero, SUM(reproducciones) AS total_reproducciones, AVG(duracion_segundos) AS prom_duracion_seg FROM canciones GROUP BY genero ORDER BY total_reproducciones DESC;

-- 2. Reporte de popularidad: Top 3 canciones más reproducidas
SELECT titulo, artista, reproducciones FROM canciones ORDER BY reproducciones DESC LIMIT 3;

-- 3. Indicador global: Tiempo total de la playlist convertido a minutos
SELECT SUM(duracion_segundos) / 60 AS duracion_total_minutos FROM canciones;

-- 4. Distribución del contenido: Conteo de canciones por cada artista
SELECT artista, COUNT(id_cancion) AS total_canciones FROM canciones GROUP BY artista ORDER BY total_canciones DESC;

-- 5. Análisis de duración: Identificar la duración máxima de una canción por cada género
SELECT genero, MAX(duracion_segundos) AS max_duracion FROM canciones GROUP BY genero ORDER BY max_duracion DESC;