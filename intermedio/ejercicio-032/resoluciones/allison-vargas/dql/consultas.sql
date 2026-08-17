USE battle_royale_left_db;

-- Consulta 1: Listado completo de clanes y sus jugadores utilizando LEFT JOIN (incluye clanes sin miembros)
SELECT 
    COALESCE(c.nombre_clan, 'Sin Clan') AS 'Clan',
    c.tag_clan AS 'Tag',
    COALESCE(j.nickname, 'Ninguno (Vacante)') AS 'Jugador',
    COALESCE(j.puntos_ranking, 0) AS 'Puntos',
    COALESCE(j.estado_cuenta, 'N/A') AS 'Estado'
FROM clanes_br c
LEFT JOIN jugadores_br j ON c.id_clan = j.id_clan
ORDER BY c.nivel_clan DESC, j.puntos_ranking DESC;

-- Consulta 2: Detectar clanes que actualmente no cuentan con jugadores registrados (Gracias al LEFT JOIN)
SELECT 
    c.nombre_clan AS 'Clan Vacante',
    c.tag_clan AS 'Tag',
    c.nivel_clan AS 'Nivel del Clan'
FROM clanes_br c
LEFT JOIN jugadores_br j ON c.id_clan = j.id_clan
WHERE j.id_jugador IS NULL;

-- Consulta 3: Resumen del puntaje total y cantidad de integrantes por clan usando LEFT JOIN
SELECT 
    c.nombre_clan AS 'Clan',
    c.nivel_clan AS 'Nivel',
    COUNT(j.id_jugador) AS 'Total de Miembros',
    COALESCE(SUM(j.puntos_ranking), 0) AS 'Puntaje Conjunto del Clan'
FROM clanes_br c
LEFT JOIN jugadores_br j ON c.id_clan = j.id_clan
GROUP BY c.id_clan, c.nombre_clan, c.nivel_clan
ORDER BY 'Puntaje Conjunto del Clan' DESC;

-- Consulta 4: Top 3 de mejores jugadores con su respectivo clan (o sin él)
SELECT 
    j.nickname AS 'Jugador Top',
    j.puntos_ranking AS 'Puntos de Ranking',
    COALESCE(c.nombre_clan, 'Agente Libre') AS 'Clan'
FROM jugadores_br j
LEFT JOIN clanes_br c ON j.id_clan = c.id_clan
ORDER BY j.puntos_ranking DESC
LIMIT 3;

-- Consulta 5: Reporte de rendimiento agrupado por clan evaluando eliminaciones totales y promedio de puntos
SELECT 
    c.nombre_clan AS 'Clan',
    COUNT(j.id_jugador) AS 'Miembros Activos',
    SUM(j.eliminaciones_totales) AS 'Kills Totales del Clan',
    AVG(j.puntos_ranking) AS 'Promedio de Puntos'
FROM clanes_br c
LEFT JOIN jugadores_br j ON c.id_clan = j.id_clan
GROUP BY c.id_clan, c.nombre_clan
ORDER BY 'Kills Totales del Clan' DESC;
