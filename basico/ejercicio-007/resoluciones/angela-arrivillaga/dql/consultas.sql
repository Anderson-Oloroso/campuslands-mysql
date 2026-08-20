USE campuslands_mysql;

-- 1. Tabla de posiciones general ordenada por puntos de forma descendente
SELECT nombre_equipo, puntos, partidos_jugados, (goles_a_favor - goles_en_contra) AS diferencia_goles
FROM equipos_liga
ORDER BY puntos DESC, diferencia_goles DESC;

-- 2. Top 3 equipos más goleadores ordenados por goles a favor
SELECT nombre_equipo, goles_a_favor
FROM equipos_liga
ORDER BY goles_a_favor DESC
LIMIT 3;

-- 3. Equipos ordenados alfabéticamente por nombre
SELECT nombre_equipo, estado, puntos
FROM equipos_liga
ORDER BY nombre_equipo ASC;

-- 4. Equipos con estado activo ordenados por menor cantidad de goles en contra (defensas más sólidas)
SELECT nombre_equipo, goles_en_contra, estado
FROM equipos_liga
WHERE estado = 'activo'
ORDER BY goles_en_contra ASC;

-- 5. Ranking general ordenado por rendimiento combinando puntos y diferencia de goles
SELECT nombre_equipo, puntos, goles_a_favor, goles_en_contra, (goles_a_favor - goles_en_contra) AS diff_goles
FROM equipos_liga
ORDER BY puntos DESC, diff_goles DESC, goles_a_favor DESC;