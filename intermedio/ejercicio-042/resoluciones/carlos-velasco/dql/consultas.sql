USE campuslands_mysql;


-- 1. Reporte general de canciones activas.
SELECT
    titulo,
    artista,
    genero,
    reproducciones,
    calificacion
FROM canciones
WHERE estado = 'activa'
ORDER BY reproducciones DESC;


-- 2. Top 5 canciones con más reproducciones.
SELECT
    titulo,
    artista,
    reproducciones
FROM canciones
WHERE estado = 'activa'
ORDER BY reproducciones DESC
LIMIT 5;


-- 3. Cantidad de canciones y reproducciones por género.
SELECT
    genero,
    COUNT(*) AS total_canciones,
    SUM(reproducciones) AS total_reproducciones
FROM canciones
WHERE estado = 'activa'
GROUP BY genero
ORDER BY total_reproducciones DESC;


-- 4. Promedio de calificación por género.
SELECT
    genero,
    COUNT(*) AS total_canciones,
    ROUND(AVG(calificacion), 2) AS calificacion_promedio
FROM canciones
WHERE estado = 'activa'
GROUP BY genero
ORDER BY calificacion_promedio DESC;


-- 5. Artistas con canciones que superan
-- el millón de reproducciones.
SELECT
    artista,
    COUNT(*) AS canciones_publicadas,
    SUM(reproducciones) AS reproducciones_totales,
    ROUND(AVG(calificacion), 2) AS calificacion_promedio
FROM canciones
WHERE estado = 'activa'
GROUP BY artista
HAVING SUM(reproducciones) > 1000000
ORDER BY reproducciones_totales DESC;


-- 6. Canciones mejor calificadas.
SELECT
    titulo,
    artista,
    genero,
    calificacion,
    reproducciones
FROM canciones
WHERE estado = 'activa'
  AND calificacion >= 4.8
ORDER BY calificacion DESC, reproducciones DESC;


-- 7. Reporte de duración promedio por género.
SELECT
    genero,
    COUNT(*) AS total_canciones,
    ROUND(AVG(duracion_segundos), 2) AS duracion_promedio_segundos
FROM canciones
WHERE estado = 'activa'
GROUP BY genero
ORDER BY duracion_promedio_segundos DESC;