-- Consultas base y definicion de Vistas Avanzadas.
USE campuslands_mysql;

CREATE VIEW vw_metricas_jugadores AS
SELECT j.nombre AS jugador, e.nombre AS equipo, j.posicion, est.partidos_jugados, est.goles, est.asistencias, (est.goles + est.asistencias) AS participacion_goles, ROUND(est.goles / NULLIF(est.partidos_jugados, 0), 2) AS goles_por_partido 
    FROM avanzado_ejercicio_007_jugadores j 
    JOIN avanzado_ejercicio_007_equipos e ON j.equipo_id = e.id 
    JOIN avanzado_ejercicio_007_estadisticas est ON j.id = est.jugador_id;

CREATE VIEW vw_resumen_equipos AS
SELECT e.nombre AS equipo, COUNT(j.id) AS plantilla_registrada, SUM(est.goles) AS goles_totales, SUM(est.asistencias) AS asistencias_totales, SUM(est.tarjetas_amarillas) AS tarjetas_totales 
    FROM avanzado_ejercicio_007_equipos e 
    LEFT JOIN avanzado_ejercicio_007_jugadores j ON e.id = j.equipo_id 
    LEFT JOIN avanzado_ejercicio_007_estadisticas est ON j.id = est.jugador_id 
    GROUP BY e.id, e.nombre;

SELECT jugador, equipo, participacion_goles, goles_por_partido 
    FROM vw_metricas_jugadores 
    WHERE goles_por_partido > 0.50 
    ORDER BY goles_por_partido DESC;

SELECT equipo, goles_totales, tarjetas_totales 
    FROM vw_resumen_equipos 
    ORDER BY tarjetas_totales ASC;

SELECT v.equipo, e.fundacion, v.goles_totales 
    FROM vw_resumen_equipos v 
    JOIN avanzado_ejercicio_007_equipos e ON v.equipo = e.nombre 
    ORDER BY v.goles_totales DESC;