-- Ejercicio 013 - filtros por estado para catalogo de peliculas de miedo
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Peliculas disponibles, ordenadas por calificacion descendente
SELECT titulo, subgenero, calificacion
FROM basico_ejercicio_013
WHERE estado = 'disponible'
ORDER BY calificacion DESC;

-- 2. Total de peliculas y calificacion promedio por estado
SELECT estado,
       COUNT(*) AS total_peliculas,
       ROUND(AVG(calificacion), 2) AS calificacion_promedio
FROM basico_ejercicio_013
GROUP BY estado
ORDER BY calificacion_promedio DESC;

-- 3. Top 5 mejor calificadas entre disponibles y proximas (excluye retiradas)
SELECT titulo, estado, calificacion
FROM basico_ejercicio_013
WHERE estado IN ('disponible','proxima')
ORDER BY calificacion DESC
LIMIT 5;

-- 4. Peliculas retiradas, con su año de estreno
SELECT titulo, subgenero, anio_estreno
FROM basico_ejercicio_013
WHERE estado = 'retirada'
ORDER BY anio_estreno ASC;

-- 5. Conteo de peliculas proximas por subgenero
SELECT subgenero, COUNT(*) AS total
FROM basico_ejercicio_013
WHERE estado = 'proxima'
GROUP BY subgenero
ORDER BY total DESC;
