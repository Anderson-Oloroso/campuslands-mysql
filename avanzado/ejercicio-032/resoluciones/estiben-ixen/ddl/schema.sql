-- Campuslands MySQL - avanzado ejercicio-032
-- Tema: ranking battle royale (procedimientos almacenados)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_battle_royale;
DROP TABLE IF EXISTS partidas_br;
DROP TABLE IF EXISTS jugadores_br;

CREATE TABLE jugadores_br (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL UNIQUE,
    pais VARCHAR(40) NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    estado ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE partidas_br (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    mapa VARCHAR(40) NOT NULL,
    posicion INT NOT NULL,
    eliminaciones INT NOT NULL DEFAULT 0,
    puntos DECIMAL(8,2) NOT NULL DEFAULT 0,
    fecha_partida DATETIME NOT NULL,
    FOREIGN KEY (id_jugador) REFERENCES jugadores_br(id_jugador) ON DELETE CASCADE
);

-- Procedimiento Almacenado
DROP PROCEDURE IF EXISTS sp_registrar_o_actualizar_battle_royale;
DELIMITER //
CREATE PROCEDURE sp_registrar_o_actualizar_battle_royale(
    IN p_nombre VARCHAR(80),
    IN p_id_ref INT,
    IN p_metrica DECIMAL(10,2),
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    
    SELECT COUNT(*) INTO v_existe 
    FROM jugadores_br 
    WHERE id_jugador = p_id_ref;
    
    IF v_existe > 0 THEN
        INSERT INTO partidas_br (id_jugador, mapa, eliminaciones)
        VALUES (p_nombre, p_id_ref, p_metrica);
        SET p_resultado = 'Registro insertado exitosamente con procedimiento.';
    ELSE
        SET p_resultado = 'Error: La entidad principal referenciada no existe.';
    END IF;
END //
DELIMITER ;
