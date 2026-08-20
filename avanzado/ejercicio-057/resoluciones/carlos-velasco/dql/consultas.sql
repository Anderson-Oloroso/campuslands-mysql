USE campuslands_mysql;

-- 1. Ranking general de jugadores según la puntuación obtenida
-- en sus partidas.
SELECT
    j.nombre AS jugador,
    p.mision,
    p.puntuacion,
    RANK() OVER (
        ORDER BY p.puntuacion DESC
    ) AS posicion_general
FROM jugadores AS j
INNER JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
ORDER BY posicion_general, p.puntuacion DESC;


-- 2. Ranking de puntuaciones separado por nivel de dificultad.
SELECT
    p.dificultad,
    j.nombre AS jugador,
    p.mision,
    p.puntuacion,
    DENSE_RANK() OVER (
        PARTITION BY p.dificultad
        ORDER BY p.puntuacion DESC
    ) AS posicion_dificultad
FROM jugadores AS j
INNER JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
ORDER BY p.dificultad, posicion_dificultad;


-- 3. Acumulado de puntuacion obtenido por cada jugador
-- ordenado cronologicamente.
SELECT
    j.nombre AS jugador,
    p.fecha_partida,
    p.mision,
    p.puntuacion,
    SUM(p.puntuacion) OVER (
        PARTITION BY p.id_jugador
        ORDER BY p.fecha_partida, p.id_partida
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS puntuacion_acumulada
FROM jugadores AS j
INNER JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
ORDER BY j.nombre, p.fecha_partida, p.id_partida;


-- 4. Comparacion de cada partida con la puntuacion obtenida
-- por el mismo jugador en su partida anterior.
SELECT
    j.nombre AS jugador,
    p.fecha_partida,
    p.mision,
    p.puntuacion,
    LAG(p.puntuacion) OVER (
        PARTITION BY p.id_jugador
        ORDER BY p.fecha_partida, p.id_partida
    ) AS puntuacion_anterior,
    p.puntuacion -
    LAG(p.puntuacion) OVER (
        PARTITION BY p.id_jugador
        ORDER BY p.fecha_partida, p.id_partida
    ) AS diferencia_puntuacion
FROM jugadores AS j
INNER JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
ORDER BY j.nombre, p.fecha_partida, p.id_partida;


-- 5. Promedio de puntuacion de cada jugador y comparacion
-- de cada partida contra ese promedio.
SELECT
    j.nombre AS jugador,
    p.mision,
    p.puntuacion,
    ROUND(
        AVG(p.puntuacion) OVER (
            PARTITION BY p.id_jugador
        ),
        2
    ) AS promedio_jugador,
    ROUND(
        p.puntuacion -
        AVG(p.puntuacion) OVER (
            PARTITION BY p.id_jugador
        ),
        2
    ) AS diferencia_promedio
FROM jugadores AS j
INNER JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
ORDER BY j.nombre, p.puntuacion DESC;


-- 6. Las partidas que ocupan los tres primeros lugares
-- dentro de cada dificultad.
SELECT
    dificultad,
    jugador,
    mision,
    puntuacion,
    posicion
FROM (
    SELECT
        p.dificultad,
        j.nombre AS jugador,
        p.mision,
        p.puntuacion,
        ROW_NUMBER() OVER (
            PARTITION BY p.dificultad
            ORDER BY p.puntuacion DESC
        ) AS posicion
    FROM jugadores AS j
    INNER JOIN partidas AS p
        ON j.id_jugador = p.id_jugador
) AS ranking_dificultad
WHERE posicion <= 3
ORDER BY dificultad, posicion;