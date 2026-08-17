USE campuslands_mysql;

-- 1. Todos los jugadores con sus partidas, incluyendo los que aun no han jugado
SELECT j.nickname, j.plataforma, p.posicion_final, p.kills, p.fecha
FROM jugadores_intermedio j
LEFT JOIN partidas_br_intermedio p ON p.id_jugador = j.id_jugador
ORDER BY j.nickname;

-- 2. Jugadores que nunca han jugado ninguna partida
SELECT j.nickname, j.plataforma
FROM jugadores_intermedio j
LEFT JOIN partidas_br_intermedio p ON p.id_jugador = j.id_jugador
WHERE p.id_partida IS NULL;

-- 3. Total de kills por jugador (0 si no ha jugado nunca)
SELECT j.nickname, COALESCE(SUM(p.kills), 0) AS kills_totales
FROM jugadores_intermedio j
LEFT JOIN partidas_br_intermedio p ON p.id_jugador = j.id_jugador
GROUP BY j.nickname
ORDER BY kills_totales DESC;

-- 4. Victorias (posicion 1) por jugador
SELECT j.nickname, COUNT(CASE WHEN p.posicion_final = 1 THEN 1 END) AS victorias
FROM jugadores_intermedio j
LEFT JOIN partidas_br_intermedio p ON p.id_jugador = j.id_jugador
GROUP BY j.nickname
ORDER BY victorias DESC;

-- 5. Promedio de daño por jugador (NULL si nunca ha jugado)
SELECT j.nickname, ROUND(AVG(p.damage_total), 1) AS danio_promedio
FROM jugadores_intermedio j
LEFT JOIN partidas_br_intermedio p ON p.id_jugador = j.id_jugador
GROUP BY j.nickname
ORDER BY danio_promedio DESC;

-- 6. Ranking completo de jugadores por kills, incluyendo los que tienen 0
SELECT j.nickname, COALESCE(SUM(p.kills), 0) AS kills_totales
FROM jugadores_intermedio j
LEFT JOIN partidas_br_intermedio p ON p.id_jugador = j.id_jugador
GROUP BY j.nickname
ORDER BY kills_totales DESC, j.nickname;
