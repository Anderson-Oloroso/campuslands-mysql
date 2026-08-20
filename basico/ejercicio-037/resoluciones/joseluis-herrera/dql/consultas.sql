USE campuslands_mysql;

SELECT
    nombre,
    ciudad,
    puntos,
    partidos_jugados
FROM equipos_liga
ORDER BY puntos DESC;


SELECT
    nombre,
    goles_favor,
    goles_contra
FROM equipos_liga
ORDER BY goles_favor DESC;

SELECT
    nombre,
    goles_contra,
    puntos
FROM equipos_liga
ORDER BY goles_contra ASC;

SELECT
    nombre,
    partidos_ganados,
    puntos
FROM equipos_liga
ORDER BY partidos_ganados DESC, puntos DESC;


SELECT
    nombre,
    ciudad,
    puntos
FROM equipos_liga
ORDER BY puntos DESC
LIMIT 5;

SELECT
    nombre,
    ciudad,
    puntos
FROM equipos_liga
ORDER BY nombre ASC;