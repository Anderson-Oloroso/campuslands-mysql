USE campuslands_mysql;

-- 1. promedio de puntaje por genero
SELECT genero, COUNT(*) AS total_canciones, ROUND(AVG(puntaje), 2) AS promedio_puntaje
FROM canciones
WHERE estado = 'activo'
GROUP BY genero;

-- 2. top 3 de canciones mas largas
SELECT titulo, artista, duracion_segundos
FROM canciones
ORDER BY duracion_segundos DESC
LIMIT 3;

-- 3. canciones de un artista especifico con puntaje mayor a 9
SELECT titulo, album, puntaje
FROM canciones
WHERE artista = 'michael jackson' AND puntaje > 9.0;

-- 4. reporte de canciones archivadas
SELECT titulo, artista, genero
FROM canciones
WHERE estado = 'archivado';

-- 5. canciones ordenadas por genero y luego por puntaje descendente
SELECT titulo, genero, puntaje
FROM canciones
WHERE estado = 'activo'
ORDER BY genero ASC, puntaje DESC;