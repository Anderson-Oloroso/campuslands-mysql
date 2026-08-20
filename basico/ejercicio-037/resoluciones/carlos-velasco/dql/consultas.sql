USE campuslands_mysql;

-- 1. Clasificación general ordenada por puntos.
SELECT
    nombre AS equipo,
    ciudad,
    puntos
FROM equipos_futbol
ORDER BY puntos DESC;


-- 2. Equipos ordenados por diferencia de goles.
SELECT
    nombre AS equipo,
    goles_favor,
    goles_contra,
    (goles_favor - goles_contra) AS diferencia_goles
FROM equipos_futbol
ORDER BY diferencia_goles DESC;


-- 3. Equipos con al menos 15 puntos, ordenados de mayor a menor.
SELECT
    nombre AS equipo,
    partidos_jugados,
    puntos
FROM equipos_futbol
WHERE puntos >= 15
ORDER BY puntos DESC;


-- 4. Top 5 equipos de la liga.
SELECT
    nombre AS equipo,
    puntos,
    goles_favor,
    goles_contra
FROM equipos_futbol
ORDER BY puntos DESC, goles_favor DESC
LIMIT 5;


-- 5. Equipos ordenados alfabéticamente por nombre.
SELECT
    nombre AS equipo,
    ciudad,
    puntos
FROM equipos_futbol
ORDER BY nombre ASC;


-- 6. Equipos con más goles anotados.
SELECT
    nombre AS equipo,
    goles_favor AS goles_anotados
FROM equipos_futbol
ORDER BY goles_favor DESC;


-- 7. Equipos con menor cantidad de goles recibidos.
SELECT
    nombre AS equipo,
    goles_contra AS goles_recibidos
FROM equipos_futbol
ORDER BY goles_contra ASC;