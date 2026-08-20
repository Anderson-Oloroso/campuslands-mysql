USE campuslands_mysql;

SELECT
    nombre,
    clase,
    puntuacion,
    RANK() OVER(ORDER BY puntuacion DESC) AS ranking_global
FROM jugadores;


SELECT
    nombre,
    clase,
    puntuacion,
    RANK() OVER(
        PARTITION BY clase
        ORDER BY puntuacion DESC
    ) AS ranking_clase
FROM jugadores
ORDER BY clase, ranking_clase;


SELECT
    nombre,
    fecha_registro,
    ROW_NUMBER() OVER(
        ORDER BY fecha_registro
    ) AS orden_registro
FROM jugadores;

SELECT
    nombre,
    clase,
    puntuacion,
    ROUND(
        AVG(puntuacion) OVER(PARTITION BY clase),
        2
    ) AS promedio_clase
FROM jugadores
ORDER BY clase;

SELECT
    nombre,
    puntuacion,
    MAX(puntuacion) OVER() AS mejor_puntuacion,
    MAX(puntuacion) OVER() - puntuacion AS diferencia
FROM jugadores
ORDER BY diferencia;


SELECT
    nombre,
    fecha_registro,
    monedas,
    SUM(monedas) OVER(
        ORDER BY fecha_registro
    ) AS monedas_acumuladas
FROM jugadores;


SELECT
    nombre,
    puntuacion,
    LAG(puntuacion) OVER(
        ORDER BY puntuacion DESC
    ) AS puntuacion_anterior,
    LEAD(puntuacion) OVER(
        ORDER BY puntuacion DESC
    ) AS puntuacion_siguiente
FROM jugadores
ORDER BY puntuacion DESC;