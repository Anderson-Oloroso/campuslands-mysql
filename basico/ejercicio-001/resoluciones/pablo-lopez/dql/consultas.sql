USE campuslands_mysql;

SELECT *
FROM equipos;

SELECT
    nombre,
    region
FROM equipos
WHERE estado = 'Activo';

SELECT
    nombre AS Equipo,
    puntaje AS Puntaje
FROM equipos
ORDER BY puntaje DESC;

SELECT
    region,
    AVG(puntaje) AS Promedio
FROM equipos
GROUP BY region;

SELECT
    nombre,
    puntaje
FROM equipos
ORDER BY puntaje DESC
LIMIT 5;