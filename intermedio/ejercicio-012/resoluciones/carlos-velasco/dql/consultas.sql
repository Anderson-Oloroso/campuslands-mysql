-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    titulo,
    artista,
    reproducciones
FROM canciones
WHERE estado = 'ACTIVA'
ORDER BY reproducciones DESC;

SELECT
    genero,
    COUNT(*) AS total_canciones
FROM canciones
GROUP BY genero
ORDER BY total_canciones DESC, genero;

SELECT
    genero,
    ROUND(AVG(calificacion),2) AS promedio_calificacion
FROM canciones
GROUP BY genero
ORDER BY promedio_calificacion DESC;

SELECT
    genero,
    COUNT(*) AS cantidad
FROM canciones
GROUP BY genero
HAVING COUNT(*) > 1
ORDER BY cantidad DESC;

SELECT
    titulo,
    artista,
    calificacion
FROM canciones
ORDER BY calificacion DESC
LIMIT 5;

SELECT
    COUNT(*) AS total_canciones,
    SUM(reproducciones) AS total_reproducciones,
    ROUND(AVG(calificacion),2) AS promedio_calificacion,
    MAX(duracion_segundos) AS mayor_duracion,
    MIN(duracion_segundos) AS menor_duracion
FROM canciones;