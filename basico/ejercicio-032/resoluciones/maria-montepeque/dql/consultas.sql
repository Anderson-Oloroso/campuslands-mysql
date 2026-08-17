USE campuslands_mysql;

-- 1. Ranking por kills totales
SELECT nickname, plataforma, kills_totales
FROM jugadores_br_basico
ORDER BY kills_totales DESC;

-- 2. Jugadores con pase de batalla activo
SELECT nickname, plataforma, tiene_pase_battle
FROM jugadores_br_basico
WHERE tiene_pase_battle = TRUE;

-- 3. Promedio de kills por partida jugada, por jugador
SELECT nickname, kills_totales, partidas_jugadas,
       ROUND(kills_totales / partidas_jugadas, 2) AS kills_por_partida
FROM jugadores_br_basico
ORDER BY kills_por_partida DESC;

-- 4. Jugadores por plataforma
SELECT plataforma, COUNT(*) AS total_jugadores
FROM jugadores_br_basico
GROUP BY plataforma
ORDER BY total_jugadores DESC;

-- 5. Jugadores conectados en los ultimos 3 dias (relativo a la ultima conexion mas reciente)
SELECT nickname, ultima_conexion
FROM jugadores_br_basico
WHERE ultima_conexion >= (SELECT DATE_SUB(MAX(ultima_conexion), INTERVAL 3 DAY) FROM jugadores_br_basico)
ORDER BY ultima_conexion DESC;

-- 6. Jugadores que dejaron una bio (texto opcional)
SELECT nickname, bio
FROM jugadores_br_basico
WHERE bio IS NOT NULL;
