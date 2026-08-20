-- ============================================================
-- Ejercicio 027 - Window Functions
-- Videojuego de acción y aventura
-- ============================================================

USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Ranking global de jugadores según experiencia obtenida.
-- ============================================================

SELECT
    j.nombre_usuario,
    j.pais,
    SUM(p.experiencia_ganada) AS experiencia_total,
    RANK() OVER (
        ORDER BY SUM(p.experiencia_ganada) DESC
    ) AS posicion
FROM jugadores AS j
INNER JOIN partidas AS p
    ON p.id_jugador = j.id_jugador
GROUP BY
    j.id_jugador,
    j.nombre_usuario,
    j.pais
ORDER BY posicion;


-- ============================================================
-- CONSULTA 2
-- Ranking de jugadores por país.
-- ============================================================

SELECT
    j.nombre_usuario,
    j.pais,
    SUM(p.oro_ganado) AS oro_total,
    RANK() OVER (
        PARTITION BY j.pais
        ORDER BY SUM(p.oro_ganado) DESC
    ) AS posicion_pais
FROM jugadores AS j
INNER JOIN partidas AS p
    ON p.id_jugador = j.id_jugador
GROUP BY
    j.id_jugador,
    j.nombre_usuario,
    j.pais
ORDER BY
    j.pais,
    posicion_pais;


-- ============================================================
-- CONSULTA 3
-- Número de partida de cada jugador.
-- ============================================================

SELECT
    j.nombre_usuario,
    p.id_partida,
    p.fecha_partida,
    p.experiencia_ganada,
    ROW_NUMBER() OVER (
        PARTITION BY p.id_jugador
        ORDER BY p.fecha_partida
    ) AS numero_partida
FROM jugadores AS j
INNER JOIN partidas AS p
    ON p.id_jugador = j.id_jugador
ORDER BY
    j.nombre_usuario,
    numero_partida;


-- ============================================================
-- CONSULTA 4
-- Comparación de experiencia con la partida anterior.
-- ============================================================

SELECT
    j.nombre_usuario,
    p.fecha_partida,
    p.experiencia_ganada,
    LAG(p.experiencia_ganada) OVER (
        PARTITION BY p.id_jugador
        ORDER BY p.fecha_partida
    ) AS experiencia_anterior,
    p.experiencia_ganada
        - LAG(p.experiencia_ganada) OVER (
            PARTITION BY p.id_jugador
            ORDER BY p.fecha_partida
        ) AS diferencia_experiencia
FROM jugadores AS j
INNER JOIN partidas AS p
    ON p.id_jugador = j.id_jugador
ORDER BY
    j.nombre_usuario,
    p.fecha_partida;


-- ============================================================
-- CONSULTA 5
-- Experiencia de la partida siguiente.
-- ============================================================

SELECT
    j.nombre_usuario,
    p.fecha_partida,
    p.experiencia_ganada,
    LEAD(p.experiencia_ganada) OVER (
        PARTITION BY p.id_jugador
        ORDER BY p.fecha_partida
    ) AS experiencia_siguiente
FROM jugadores AS j
INNER JOIN partidas AS p
    ON p.id_jugador = j.id_jugador
ORDER BY
    j.nombre_usuario,
    p.fecha_partida;


-- ============================================================
-- CONSULTA 6
-- Experiencia acumulada de cada jugador.
-- ============================================================

SELECT
    j.nombre_usuario,
    p.fecha_partida,
    p.experiencia_ganada,
    SUM(p.experiencia_ganada) OVER (
        PARTITION BY p.id_jugador
        ORDER BY p.fecha_partida
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS experiencia_acumulada
FROM jugadores AS j
INNER JOIN partidas AS p
    ON p.id_jugador = j.id_jugador
ORDER BY
    j.nombre_usuario,
    p.fecha_partida;


-- ============================================================
-- CONSULTA 7
-- Promedio de enemigos derrotados por jugador y comparación
-- de cada partida contra ese promedio.
-- ============================================================

SELECT
    j.nombre_usuario,
    p.id_partida,
    p.enemigos_derrotados,
    ROUND(
        AVG(p.enemigos_derrotados) OVER (
            PARTITION BY p.id_jugador
        ),
        2
    ) AS promedio_enemigos,
    ROUND(
        p.enemigos_derrotados
        - AVG(p.enemigos_derrotados) OVER (
            PARTITION BY p.id_jugador
        ),
        2
    ) AS diferencia_promedio
FROM jugadores AS j
INNER JOIN partidas AS p
    ON p.id_jugador = j.id_jugador
ORDER BY
    j.nombre_usuario,
    p.id_partida;


-- ============================================================
-- CONSULTA 8
-- Ranking de personajes según experiencia acumulada.
-- DENSE_RANK permite manejar empates sin saltos en las posiciones.
-- ============================================================

SELECT
    personaje,
    experiencia_total,
    DENSE_RANK() OVER (
        ORDER BY experiencia_total DESC
    ) AS posicion
FROM (
    SELECT
        pj.nombre AS personaje,
        SUM(p.experiencia_ganada) AS experiencia_total
    FROM personajes AS pj
    INNER JOIN partidas AS p
        ON p.id_personaje = pj.id_personaje
    GROUP BY
        pj.id_personaje,
        pj.nombre
) AS resumen_personajes
ORDER BY posicion;