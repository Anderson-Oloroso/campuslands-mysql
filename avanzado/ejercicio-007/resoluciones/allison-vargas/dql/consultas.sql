-- DQL: 5 Consultas avanzadas consumiendo tablas y Vistas compuestas
USE campuslands_mysql;

-- 1. Consultar la Vista de posiciones calculando diferencia de goles
SELECT 
    nombre_equipo,
    partidos_jugados,
    goles_a_favor,
    goles_en_contra,
    (goles_a_favor - goles_en_contra) AS diferencia_goles
FROM vw_tabla_posiciones_resumen
ORDER BY goles_a_favor DESC;

-- 2. Top 3 máximos goleadores consumiendo la Vista de goleadores
SELECT 
    nombre_jugador,
    nombre_equipo,
    posicion,
    goles_anotados
FROM vw_top_goleadores_liga
ORDER BY goles_anotados DESC
LIMIT 3;

-- 3. Rendimiento de partidos finalizados con nombres de equipos (JOIN de confirmación)
SELECT 
    p.partido_id,
    el.nombre_equipo AS equipo_local,
    p.goles_local,
    p.goles_visitante,
    ev.nombre_equipo AS equipo_visitante,
    p.fecha_partido
FROM partidos_liga_avanzado p
INNER JOIN equipos_liga_avanzado el ON p.equipo_local_id = el.equipo_id
INNER JOIN equipos_liga_avanzado ev ON p.equipo_visitante_id = ev.equipo_id
WHERE p.estado = 'finalizado'
ORDER BY p.fecha_partido ASC;

-- 4. Promedio de goles anotados por posición de jugador
SELECT 
    posicion,
    COUNT(*) AS total_jugadores,
    SUM(goles_anotados) AS total_goles,
    ROUND(AVG(goles_anotados), 2) AS promedio_goles
FROM jugadores_liga_avanzado
GROUP BY posicion
ORDER BY promedio_goles DESC;

-- 5. Equipos que han anotado más de 3 goles en total en la liga según la Vista
SELECT 
    nombre_equipo,
    goles_a_favor
FROM vw_tabla_posiciones_resumen
WHERE goles_a_favor > 3
ORDER BY goles_a_favor DESC;
