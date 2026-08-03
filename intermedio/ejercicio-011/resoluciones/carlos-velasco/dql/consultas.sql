-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    ranking,
    nombre,
    pais
FROM jugadores
WHERE estado = 'ACTIVO'
ORDER BY ranking ASC;

SELECT
    nombre,
    porcentaje_victorias
FROM jugadores
WHERE porcentaje_victorias > 75
ORDER BY porcentaje_victorias DESC;

SELECT
    estado,
    COUNT(*) AS total_jugadores
FROM jugadores
GROUP BY estado;

SELECT
    estado,
    ROUND(AVG(edad),2) AS promedio_edad
FROM jugadores
GROUP BY estado;

SELECT
    nombre,
    victorias,
    ranking
FROM jugadores
ORDER BY victorias DESC
LIMIT 5;

SELECT
    COUNT(*) AS total_jugadores,
    SUM(victorias) AS victorias_totales,
    SUM(derrotas) AS derrotas_totales,
    MAX(porcentaje_victorias) AS mejor_porcentaje,
    MIN(porcentaje_victorias) AS menor_porcentaje,
    ROUND(AVG(edad),2) AS promedio_edad
FROM jugadores;