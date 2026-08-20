USE campuslands_mysql;

-- 1. Listar TODOS los clanes y los jugadores asociados utilizando LEFT JOIN (incluye clanes sin miembros)
SELECT 
    c.nombre_clan,
    c.tag_clan,
    COALESCE(j.jugador_nickname, 'Sin Jugador Registrado') AS jugador_nickname,
    COALESCE(j.puntos_ranking, 0) AS puntos_ranking,
    COALESCE(j.estado_cuenta, 'N/A') AS estado_cuenta
FROM clanes_royale c
LEFT JOIN jugadores_royale j ON c.id = j.clan_id
ORDER BY c.nombre_clan ASC, j.puntos_ranking DESC;

-- 2. Encontrar clanes que actualmente NO tienen jugadores registrados utilizando LEFT JOIN y IS NULL
SELECT 
    c.id AS clan_id,
    c.nombre_clan,
    c.tag_clan,
    c.nivel_clan,
    c.fecha_creacion
FROM clanes_royale c
LEFT JOIN jugadores_royale j ON c.id = j.clan_id
WHERE j.id IS NULL;

-- 3. Reporte completo de todos los jugadores (incluyendo lobatos/solitarios) y sus clanes respectivos
SELECT 
    j.jugador_nickname,
    COALESCE(c.nombre_clan, 'Jugador Solitario (Sin Clan)') AS clan,
    COALESCE(c.tag_clan, '---') AS tag,
    j.partidas_jugadas,
    j.victorias,
    j.puntos_ranking,
    j.estado_cuenta
FROM jugadores_royale j
LEFT JOIN clanes_royale c ON j.clan_id = c.id
ORDER BY j.puntos_ranking DESC;

-- 4. Conteo de jugadores por clan utilizando LEFT JOIN para asegurar que aparezcan todos los clanes, incluso los vacíos
SELECT 
    c.nombre_clan,
    c.tag_clan,
    COUNT(j.id) AS total_miembros,
    COALESCE(SUM(j.puntos_ranking), 0) AS puntos_totales_clan
FROM clanes_royale c
LEFT JOIN jugadores_royale j ON c.id = j.clan_id
GROUP BY c.id, c.nombre_clan, c.tag_clan
ORDER BY puntos_totales_clan DESC;

-- 5. Top clanes o jugadores independientes ordenados por puntos de ranking utilizando LEFT JOIN general
SELECT 
    COALESCE(c.nombre_clan, CONCAT('Independiente: ', j.jugador_nickname)) AS entidad_competitiva,
    j.jugador_nickname,
    j.puntos_ranking,
    j.eliminaciones
FROM jugadores_royale j
LEFT JOIN clanes_royale c ON j.clan_id = c.id
ORDER BY j.puntos_ranking DESC
LIMIT 5;