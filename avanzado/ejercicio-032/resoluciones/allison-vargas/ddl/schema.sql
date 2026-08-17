DROP DATABASE IF EXISTS battle_royale_db;
CREATE DATABASE battle_royale_db;
USE battle_royale_db;

CREATE TABLE jugadores_br (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(50) NOT NULL,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    puntos_ranking INT NOT NULL,
    eliminaciones_totales INT NOT NULL,
    partidas_jugadas INT NOT NULL,
    estado_cuenta VARCHAR(20) NOT NULL,
    CONSTRAINT chk_puntos_br CHECK (puntos_ranking >= 0),
    CONSTRAINT chk_eliminaciones CHECK (eliminaciones_totales >= 0),
    CONSTRAINT chk_partidas CHECK (partidas_jugadas >= 0),
    CONSTRAINT chk_estado_cuenta CHECK (estado_cuenta IN ('Activo', 'Suspendido', 'Leyenda'))
);

-- Creación de Procedimiento Almacenado para registrar o actualizar estadísticas de partida
DELIMITER //
CREATE PROCEDURE sp_actualizar_estadisticas (
    IN p_id_jugador INT,
    IN p_nuevos_puntos INT,
    IN p_nuevas_eliminaciones INT
)
BEGIN
    UPDATE jugadores_br
    SET 
        puntos_ranking = puntos_ranking + p_nuevos_puntos,
        eliminaciones_totales = eliminaciones_totales + p_nuevas_eliminaciones,
        partidas_jugadas = partidas_jugadas + 1
    WHERE id_jugador = p_id_jugador;
END //
DELIMITER ;

-- Creación de Procedimiento Almacenado para consultar el Top N de jugadores por ranking
DELIMITER //
CREATE PROCEDURE sp_consultar_top_ranking (
    IN p_limite INT
)
BEGIN
    SELECT 
        nombre_jugador AS 'Jugador',
        nickname AS 'Nickname',
        puntos_ranking AS 'Puntos',
        eliminaciones_totales AS 'Kills Totales',
        estado_cuenta AS 'Estado'
    FROM jugadores_br
    ORDER BY puntos_ranking DESC
    LIMIT p_limite;
END //
DELIMITER ;
