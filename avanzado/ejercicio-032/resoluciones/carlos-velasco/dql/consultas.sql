USE campuslands_mysql;

-- =========================================================
-- 1. Consultar todos los jugadores activos.
-- =========================================================

SELECT
    id_jugador,
    nombre_jugador,
    plataforma,
    partidas_jugadas,
    victorias,
    eliminaciones,
    puntos
FROM jugadores_battle_royale
WHERE estado = 'activo'
ORDER BY puntos DESC;


-- =========================================================
-- 2. Ranking general de jugadores.
-- =========================================================

SELECT
    ROW_NUMBER() OVER (ORDER BY puntos DESC) AS posicion,
    nombre_jugador,
    plataforma,
    victorias,
    eliminaciones,
    puntos
FROM jugadores_battle_royale
WHERE estado = 'activo'
ORDER BY puntos DESC;


-- =========================================================
-- 3. Top 5 de jugadores por puntos.
-- =========================================================

SELECT
    nombre_jugador,
    plataforma,
    puntos
FROM jugadores_battle_royale
WHERE estado = 'activo'
ORDER BY puntos DESC
LIMIT 5;


-- =========================================================
-- 4. Jugadores con al menos 20 victorias.
-- =========================================================

SELECT
    nombre_jugador,
    partidas_jugadas,
    victorias,
    eliminaciones,
    puntos
FROM jugadores_battle_royale
WHERE victorias >= 20
ORDER BY victorias DESC;


-- =========================================================
-- 5. Promedio de puntos por plataforma.
-- =========================================================

SELECT
    plataforma,
    COUNT(*) AS total_jugadores,
    ROUND(AVG(puntos), 2) AS promedio_puntos,
    MAX(puntos) AS mayor_puntaje
FROM jugadores_battle_royale
GROUP BY plataforma
ORDER BY promedio_puntos DESC;


-- =========================================================
-- 6. Jugadores con mejor promedio de eliminaciones
--    por partida.
-- =========================================================

SELECT
    nombre_jugador,
    partidas_jugadas,
    eliminaciones,
    ROUND(
        eliminaciones / NULLIF(partidas_jugadas, 0),
        2
    ) AS eliminaciones_por_partida
FROM jugadores_battle_royale
WHERE estado = 'activo'
ORDER BY eliminaciones_por_partida DESC;


-- =========================================================
-- 7. PROCEDIMIENTO: ranking general.
--
-- Permite solicitar una cantidad determinada de jugadores
-- ordenados por puntos.
-- =========================================================

DROP PROCEDURE IF EXISTS sp_obtener_ranking;

DELIMITER $$

CREATE PROCEDURE sp_obtener_ranking(IN p_limite INT)
BEGIN
    SELECT
        ROW_NUMBER() OVER (ORDER BY puntos DESC) AS posicion,
        nombre_jugador,
        plataforma,
        victorias,
        eliminaciones,
        puntos
    FROM jugadores_battle_royale
    WHERE estado = 'activo'
    ORDER BY puntos DESC
    LIMIT p_limite;
END$$

DELIMITER ;


-- =========================================================
-- 8. PROCEDIMIENTO: resumen de un jugador.
-- =========================================================

DROP PROCEDURE IF EXISTS sp_resumen_jugador;

DELIMITER $$

CREATE PROCEDURE sp_resumen_jugador(IN p_nombre_jugador VARCHAR(100))
BEGIN
    SELECT
        nombre_jugador,
        plataforma,
        partidas_jugadas,
        victorias,
        eliminaciones,
        puntos,
        ROUND(
            victorias / NULLIF(partidas_jugadas, 0) * 100,
            2
        ) AS porcentaje_victorias
    FROM jugadores_battle_royale
    WHERE nombre_jugador = p_nombre_jugador;
END$$

DELIMITER ;


-- =========================================================
-- 9. Ejecutar el procedimiento del ranking.
--    Devuelve los 5 mejores jugadores.
-- =========================================================

CALL sp_obtener_ranking(5);


-- =========================================================
-- 10. Ejecutar el procedimiento para consultar
--     el resumen de un jugador.
-- =========================================================

CALL sp_resumen_jugador('ShadowX');