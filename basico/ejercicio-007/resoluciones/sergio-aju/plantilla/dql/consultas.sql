USE db_liga_futbol;

-- Consulta 1: Tabla general de posiciones ordenada de mayor a menor puntaje (y desempate por diferencia de goles)
SELECT 
    nombre_equipo AS equipo,
    partidos_jugados AS pj,
    puntos,
    goles_favor AS gf,
    goles_contra AS gc,
    (goles_favor - goles_contra) AS diferencia_goles
FROM equipos
WHERE estado = 'Activo'
ORDER BY puntos DESC, diferencia_goles DESC, goles_favor DESC;

-- Consulta 2: Top 5 de los equipos más goleadores de la liga (Práctica de LIMIT con ORDER BY)
SELECT 
    nombre_equipo AS equipo,
    goles_favor AS total_goles,
    ciudad
FROM equipos
ORDER BY goles_favor DESC
LIMIT 5;

-- Consulta 3: Ordenamiento alfabético ascendente de los equipos según su ciudad sede
SELECT 
    ciudad,
    nombre_equipo AS equipo,
    estado
FROM equipos
ORDER BY ciudad ASC, nombre_equipo ASC;

-- Consulta 4: Equipos con la defensa menos goleada (menor cantidad de goles en contra)
SELECT 
    nombre_equipo AS equipo,
    goles_contra AS goles_en_contra,
    partidos_jugados AS pj
FROM equipos
WHERE estado = 'Activo'
ORDER BY goles_contra ASC, partidos_jugados DESC;

-- Consulta 5: Reporte de rendimiento agrupado por estado con cálculos y ordenamiento por promedio de puntos
SELECT 
    estado,
    COUNT(*) AS total_equipos,
    ROUND(AVG(puntos), 2) AS promedio_puntos,
    ROUND(AVG(goles_favor), 2) AS promedio_goles_favor
FROM equipos
GROUP BY estado
ORDER BY promedio_puntos DESC;