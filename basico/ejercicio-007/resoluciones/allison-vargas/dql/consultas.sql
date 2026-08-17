-- DQL: 5 Consultas aplicando ordenamientos con ORDER BY (ASC / DESC y múltiples criterios)
USE campuslands_mysql;

-- 1. Tabla de posiciones principal ordenada por puntos descendentemente
SELECT 
    equipo_id,
    nombre_equipo,
    ciudad,
    puntos,
    partidos_jugados
FROM equipos_liga_basico
ORDER BY puntos DESC;

-- 2. Clasificación por Diferencia de Goles (Criterio de desempate calculado)
SELECT 
    nombre_equipo,
    goles_favor,
    goles_contra,
    (goles_favor - goles_contra) AS diferencia_goles
FROM equipos_liga_basico
ORDER BY diferencia_goles DESC;

-- 3. Ordenamiento alfabético por ciudad y nombre de equipo (Múltiples columnas)
SELECT 
    ciudad,
    nombre_equipo,
    puntos,
    estado
FROM equipos_liga_basico
WHERE estado = 'activo'
ORDER BY ciudad ASC, nombre_equipo ASC;

-- 4. Top 3 equipos más goleadores de la liga
SELECT 
    nombre_equipo,
    goles_favor,
    puntos
FROM equipos_liga_basico
ORDER BY goles_favor DESC
LIMIT 3;

-- 5. Ranking de equipos con defensa más sólida (Menor cantidad de goles en contra)
SELECT 
    nombre_equipo,
    goles_contra,
    puntos
FROM equipos_liga_basico
ORDER BY goles_contra ASC;
