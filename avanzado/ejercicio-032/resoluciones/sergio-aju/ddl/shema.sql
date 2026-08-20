CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas y procedimientos previos para garantizar una ejecución limpia desde cero
DROP PROCEDURE IF EXISTS sp_registrar_partida_jugador;
DROP PROCEDURE IF EXISTS sp_consultar_top_jugadores;
DROP TABLE IF EXISTS historial_partidas_royale;
DROP TABLE IF EXISTS jugadores_royale_avanzado;

-- 1. Tabla Principal de Jugadores Battle Royale Avanzado
CREATE TABLE jugadores_royale_avanzado (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_nickname VARCHAR(60) NOT NULL UNIQUE,
  partidas_jugadas INT UNSIGNED NOT NULL DEFAULT 0,
  victorias INT UNSIGNED NOT NULL DEFAULT 0,
  eliminaciones INT UNSIGNED NOT NULL DEFAULT 0,
  puntos_ranking INT NOT NULL DEFAULT 0,
  estado_cuenta ENUM('activo', 'suspendido', 'veterano') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_victorias_avanzado CHECK (victorias <= partidas_jugadas),
  CONSTRAINT chk_puntos_avanzado CHECK (puntos_ranking >= 0)
);

-- 2. Tabla Transaccional de Historial de Partidas
CREATE TABLE historial_partidas_royale (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_id INT NOT NULL,
  eliminaciones_partida INT UNSIGNED NOT NULL DEFAULT 0,
  puesto_obtenido INT UNSIGNED NOT NULL CHECK (puesto_obtenido >= 1 AND puesto_obtenido <= 100),
  puntos_ganados INT NOT NULL,
  fecha_partida DATETIME NOT NULL,
  CONSTRAINT fk_historial_jugador FOREIGN KEY (jugador_id) REFERENCES jugadores_royale_avanzado(id) ON DELETE CASCADE
);

-- 3. Definición de Procedimientos Almacenados
DELIMITER //

-- Procedimiento 1: Registrar una nueva partida y actualizar automáticamente las estadísticas del jugador
CREATE PROCEDURE sp_registrar_partida_jugador (
    IN p_jugador_id INT,
    IN p_eliminaciones INT,
    IN p_puesto INT,
    IN p_puntos INT
)
BEGIN
    DECLARE v_es_victoria INT DEFAULT 0;
    
    -- Determinar si el puesto es 1 (Victoria / Top 1)
    IF p_puesto = 1 THEN
        SET v_es_victoria = 1;
    ELSE
        SET v_es_victoria = 0;
    END IF;

    -- Iniciar transacción para garantizar atomicidad
    START TRANSACTION;

    -- Registrar en el historial
    INSERT INTO historial_partidas_royale (jugador_id, eliminaciones_partida, puesto_obtenido, puntos_ganados, fecha_partida)
    VALUES (p_jugador_id, p_eliminaciones, p_puesto, p_puntos, NOW());

    -- Actualizar las estadísticas acumuladas del jugador
    UPDATE jugadores_royale_avanzado
    SET 
        partidas_jugadas = partidas_jugadas + 1,
        victorias = victorias + v_es_victoria,
        eliminaciones = eliminaciones + p_eliminaciones,
        puntos_ranking = puntos_ranking + p_puntos
    WHERE id = p_jugador_id;

    COMMIT;
END //

-- Procedimiento 2: Consultar el ranking general ordenado por puntos
CREATE PROCEDURE sp_consultar_top_jugadores (
    IN p_limite INT
)
BEGIN
    SELECT 
        id,
        jugador_nickname,
        partidas_jugadas,
        victorias,
        eliminaciones,
        puntos_ranking,
        estado_cuenta
    FROM jugadores_royale_avanzado
    ORDER BY puntos_ranking DESC
    LIMIT p_limite;
END //

DELIMITER ;