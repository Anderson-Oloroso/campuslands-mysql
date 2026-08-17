-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM avanzado_ejercicio_011;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM avanzado_ejercicio_011
GROUP BY categoria
ORDER BY promedio DESC;

USE campuslands_mysql;

WITH resumen_categoria AS (
    SELECT
        categoria,
        COUNT(*) AS total_registros,
        AVG(puntaje) AS promedio_puntaje,
        MAX(puntaje) AS puntaje_maximo,
        MIN(puntaje) AS puntaje_minimo
    FROM avanzado_ejercicio_011
    GROUP BY categoria
)
SELECT
    categoria,
    total_registros,
    ROUND(promedio_puntaje, 2) AS promedio_puntaje,
    puntaje_maximo,
    puntaje_minimo
FROM resumen_categoria
ORDER BY promedio_puntaje DESC;