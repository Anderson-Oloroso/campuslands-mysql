CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminación previa de objetos si existen para permitir re-ejecución limpia
DROP PROCEDURE IF EXISTS sp_registrar_partida_br;
DROP TABLE IF EXISTS partidas_br;
DROP TABLE IF EXISTS jugadores_br;

CREATE TABLE jugadores_br (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gamertag VARCHAR(50) NOT NULL UNIQUE,
    rango VARCHAR(30) NOT NULL,
    puntos_liga INT DEFAULT 0,
    victorias_totales INT DEFAULT 0,
    estado ENUM('activo', 'suspendido', 'leyenda') DEFAULT 'activo',
    CONSTRAINT chk_puntos_liga CHECK (puntos_liga >= 0),
    CONSTRAINT chk_victorias CHECK (victorias_totales >= 0)
);

CREATE TABLE partidas_br (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    asesinatos INT NOT NULL,
    puesto_obtenido INT NOT NULL,
    puntos_ganados INT NOT NULL,
    fecha_partida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_jugador_partida FOREIGN KEY (jugador_id) REFERENCES jugadores_br(id),
    CONSTRAINT chk_asesinatos CHECK (asesinatos >= 0),
    CONSTRAINT chk_puesto CHECK (puesto_obtenido BETWEEN 1 AND 100)
);

-- Creación del procedimiento almacenado avanzado para registrar partidas y actualizar ranking de forma transaccional
DELIMITER //

CREATE PROCEDURE sp_registrar_partida_br(
    IN p_jugador_id INT,
    IN p_asesinatos INT,
    IN p_puesto INT,
    IN p_puntos INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Registrar la partida individual
    INSERT INTO partidas_br (jugador_id, asesinatos, puesto_obtenido, puntos_ganados)
    VALUES (p_jugador_id, p_asesinatos, p_puesto, p_puntos);

    -- Actualizar los puntos de liga y victorias totales del jugador
    UPDATE jugadores_br
    SET puntos_liga = puntos_liga + p_puntos,
        victorias_totales = victorias_totales + IF(p_puesto = 1, 1, 0)
    WHERE id = p_jugador_id;

    COMMIT;
END //

DELIMITER ;