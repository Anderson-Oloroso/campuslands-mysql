USE campuslands_mysql;

-- 1. Tabla de clasificación general ordenada por puntos de ranking de forma descendente
SELECT 
    jugador_nickname,
    plataforma,
    partidas_jugadas,
    victorias,
    puntos_ranking,
    estado_cuenta
FROM ranking_battle_royale
ORDER BY puntos_ranking DESC;

-- 2. Reporte analítico calculando el porcentaje de victorias (Win Rate) de cada jugador activo
SELECT 
    jugador_nickname,
    plataforma,
    partidas_jugadas,
    victorias,
    ROUND((victorias / NULLIF(partidas_jugadas, 0)) * 100, 2) AS win_rate_porcentaje,
    puntos_ranking
FROM ranking_battle_royale
WHERE estado_cuenta IN ('activo', 'veterano')
ORDER BY win_rate_porcentaje DESC;

-- 3. Agrupación por plataforma para conocer estadísticas globales de eliminaciones y promedio de precisión
SELECT 
    plataforma,
    COUNT(*) AS total_jugadores,
    SUM(eliminaciones) AS total_eliminaciones_plataforma,
    ROUND(AVG(precision_tiro), 2) AS promedio_precision
FROM ranking_battle_royale
GROUP BY plataforma
ORDER BY total_eliminaciones_plataforma DESC;

-- 4. Top 3 mejores jugadores del ranking battle royale basados en sus puntos de ranking
SELECT 
    jugador_nickname,
    plataforma,
    puntos_ranking,
    eliminaciones,
    estado_cuenta
FROM ranking_battle_royale
ORDER BY puntos_ranking DESC
LIMIT 3;

-- 5. Filtrar jugadores con alta precisión de tiro (mayor o igual al 65%) y ordenar por eliminaciones
SELECT 
    jugador_nickname,
    plataforma,
    precision_tiro,
    eliminaciones,
    fecha_ultimo_registro
FROM ranking_battle_royale
WHERE precision_tiro >= 65.00
ORDER BY eliminaciones DESC;