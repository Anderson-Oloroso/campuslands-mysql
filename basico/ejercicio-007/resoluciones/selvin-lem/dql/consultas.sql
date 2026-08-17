USE campuslands_mysql;

-- 1. Tabla de posiciones ordenada por puntos (orden simple descendente)
SELECT nombre_equipo, puntos, partidos_jugados
FROM liga_futbol_posiciones
ORDER BY puntos DESC;

-- 2. Ordenado por puntos y, en caso de empate, por diferencia de gol (multiple ORDER BY)
SELECT nombre_equipo, puntos, (goles_favor - goles_contra) AS diferencia_gol
FROM liga_futbol_posiciones
ORDER BY puntos DESC, diferencia_gol DESC;

-- 3. Equipos ordenados por fecha de su ultimo partido (mas reciente primero)
SELECT nombre_equipo, fecha_ultimo_partido
FROM liga_futbol_posiciones
ORDER BY fecha_ultimo_partido DESC;

-- 4. Top 3 con menos goles en contra (orden ascendente)
SELECT nombre_equipo, goles_contra
FROM liga_futbol_posiciones
ORDER BY goles_contra ASC
LIMIT 3;

-- 5. Equipo en el ultimo lugar de la tabla, caso limite (0 puntos)
SELECT nombre_equipo, puntos, estado
FROM liga_futbol_posiciones
ORDER BY puntos ASC
LIMIT 1;