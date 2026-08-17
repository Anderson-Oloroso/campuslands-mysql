USE campuslands_mysql;

-- 1. Listado general tras las actualizaciones
SELECT * FROM futsal_jugadores;

-- 2. Jugadores disponibles para el proximo partido
SELECT nombre_jugador, equipo, estado
FROM futsal_jugadores
WHERE disponible = TRUE;

-- 3. Goleadores con mas de 5 goles en la temporada
SELECT nombre_jugador, equipo, goles_temporada
FROM futsal_jugadores
WHERE goles_temporada > 5
ORDER BY goles_temporada DESC;

-- 4. Jugadores suspendidos (verificar UPDATE 3)
SELECT nombre_jugador, tarjetas_amarillas, estado
FROM futsal_jugadores
WHERE estado = 'suspendido';

-- 5. Confirmar que Jorge Tzul ya no aparece como lesionado (verificar UPDATE 2)
SELECT nombre_jugador, estado, disponible
FROM futsal_jugadores
WHERE nombre_jugador = 'Jorge Tzul';