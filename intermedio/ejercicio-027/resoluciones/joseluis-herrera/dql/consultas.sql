USE campuslands_mysql;


SELECT
    nombre AS jugador,
    clase,
    nivel,
    puntuacion
FROM jugadores
WHERE estado = 'activo'
ORDER BY puntuacion DESC;


SELECT
    clase,
    COUNT(*) AS total_jugadores
FROM jugadores
GROUP BY clase
ORDER BY total_jugadores DESC;

SELECT
    clase,
    ROUND(AVG(nivel),2) AS promedio_nivel
FROM jugadores
GROUP BY clase
ORDER BY promedio_nivel DESC;

SELECT
    estado,
    SUM(monedas) AS monedas_totales
FROM jugadores
GROUP BY estado;

SELECT
    nombre AS jugador,
    clase,
    puntuacion
FROM jugadores
ORDER BY puntuacion DESC
LIMIT 5;

SELECT
    nombre AS jugador,
    clase,
    nivel
FROM jugadores
WHERE nivel > (
    SELECT AVG(nivel)
    FROM jugadores
)
ORDER BY nivel DESC;

SELECT
    COUNT(*) AS total_jugadores,
    AVG(nivel) AS promedio_nivel,
    SUM(puntuacion) AS puntuacion_total,
    SUM(monedas) AS monedas_totales
FROM jugadores;