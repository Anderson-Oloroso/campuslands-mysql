USE campuslands_mysql;

-- =========================================================================
-- PRUEBA DE EJECUCIÓN DE PROCEDIMIENTOS ALMACENADOS
-- =========================================================================

-- 1. Ejecutar el procedimiento almacenado para registrar una partida al jugador con ID 1 ('ShadowKiller')
-- Parámetros: (jugador_id, eliminaciones, puesto_obtenido, puntos_ganados)
CALL sp_registrar_partida_jugador(1, 7, 1, 150);

-- 2. Ejecutar el procedimiento almacenado para consultar el Top 5 de mejores jugadores
CALL sp_consultar_top_jugadores(5);

-- =========================================================================
-- CONSULTAS ANALÍTICAS Y REPORTES ADICIONALES
-- =========================================================================

-- 3. Historial detallado de partidas recientes utilizando INNER JOIN
SELECT 
    h.id AS id_historial,
    j.jugador_nickname,
    h.eliminaciones_partida,
    h.puesto_obtenido,
    h.puntos_ganados,
    h.fecha_partida
FROM historial_partidas_royale h
JOIN jugadores_royale_avanzado j ON h.jugador_id = j.id
ORDER BY h.fecha_partida DESC;

-- 4. Reporte analítico calculando el porcentaje de victorias (Win Rate) y promedio de bajas por partida
SELECT 
    jugador_nickname,
    partidas_jugadas,
    victorias,
    ROUND((victorias / NULLIF(partidas_jugadas, 0)) * 100, 2) AS win_rate_porcentaje,
    ROUND(eliminaciones / NULLIF(partidas_jugadas, 0), 2) AS promedio_eliminaciones_por_partida,
    puntos_ranking
FROM jugadores_royale_avanzado
WHERE estado_cuenta IN ('activo', 'veterano')
ORDER BY puntos_ranking DESC;

-- 5. Agrupación y conteo de jugadores por su estado de cuenta y su total de puntos acumulados
SELECT 
    estado_cuenta,
    COUNT(*) AS total_jugadores,
    SUM(puntos_ranking) AS puntos_acumulados_grupo,
    ROUND(AVG(puntos_ranking), 2) AS promedio_puntos
FROM jugadores_royale_avanzado
GROUP BY estado_cuenta
ORDER BY total_jugadores DESC;