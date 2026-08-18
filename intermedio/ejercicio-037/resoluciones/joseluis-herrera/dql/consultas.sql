USE campuslands_mysql;

SELECT
    liga,
    temporada,
    equipo,
    puntos,
    diferencia_goles
FROM vista_tabla_posiciones
ORDER BY puntos DESC, diferencia_goles DESC;

SELECT
    equipo,
    puntos,
    diferencia_goles
FROM vista_tabla_posiciones
ORDER BY puntos DESC, diferencia_goles DESC
LIMIT 5;

SELECT
    equipo,
    partidos_jugados,
    puntos,
    porcentaje_rendimiento
FROM vista_rendimiento_equipos
ORDER BY porcentaje_rendimiento DESC;

SELECT
    equipo,
    porcentaje_rendimiento,
    promedio_goles_favor
FROM vista_rendimiento_equipos
WHERE porcentaje_rendimiento > 70
ORDER BY porcentaje_rendimiento DESC;

SELECT
    equipo,
    promedio_goles_favor,
    promedio_goles_contra
FROM vista_rendimiento_equipos
WHERE promedio_goles_favor > 1.5
ORDER BY promedio_goles_favor DESC;

SELECT
    equipo,
    goles_favor,
    goles_contra,
    diferencia_goles
FROM vista_tabla_posiciones
WHERE diferencia_goles > 0
ORDER BY diferencia_goles DESC;

SELECT *
FROM vista_tabla_posiciones;

SELECT *
FROM vista_rendimiento_equipos;