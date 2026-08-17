-- Consultas base e indicadores aplicando Normalizacion 2FN.
USE campuslands_mysql;

SELECT j.nombre, j.posicion, p.jornada, p.rival, r.minutos_jugados, r.goles 
    FROM intermedio_ejercicio_007_rendimiento r 
    JOIN intermedio_ejercicio_007_jugadores j ON r.jugador_id = j.id 
    JOIN intermedio_ejercicio_007_partidos p ON r.partido_id = p.id;

SELECT j.nombre, SUM(r.goles) AS total_goles, SUM(r.minutos_jugados) AS total_minutos 
    FROM intermedio_ejercicio_007_jugadores j 
    JOIN intermedio_ejercicio_007_rendimiento r ON j.id = r.jugador_id 
    GROUP BY j.id, j.nombre 
    ORDER BY total_goles DESC, total_minutos DESC;

SELECT j.posicion, SUM(r.goles) AS goles_totales, ROUND(AVG(r.minutos_jugados), 2) AS promedio_minutos 
    FROM intermedio_ejercicio_007_jugadores j 
    JOIN intermedio_ejercicio_007_rendimiento r ON j.id = r.jugador_id 
    GROUP BY j.posicion 
    ORDER BY goles_totales DESC;

SELECT p.jornada, p.rival, SUM(r.goles) AS goles_partido 
    FROM intermedio_ejercicio_007_partidos p 
    JOIN intermedio_ejercicio_007_rendimiento r ON p.id = r.partido_id 
    GROUP BY p.id, p.jornada, p.rival 
    HAVING goles_partido >= 2 
    ORDER BY goles_partido DESC;

SELECT DISTINCT j.nombre, j.posicion 
    FROM intermedio_ejercicio_007_jugadores j 
    JOIN intermedio_ejercicio_007_rendimiento r ON j.id = r.jugador_id 
    WHERE r.minutos_jugados = 90;