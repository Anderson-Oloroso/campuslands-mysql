-- DDL: Sistema de bitácora y eventos automáticos para naves y misiones de ciencia ficción
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS bitacora_mantenimiento;
DROP TABLE IF EXISTS naves_espaciales;

CREATE TABLE naves_espaciales (
    nave_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    nivel_energia DECIMAL(5,2) DEFAULT 100.00 CHECK (nivel_energia BETWEEN 0.00 AND 100.00),
    estado_mision ENUM('en_orbita', 'hiperespacio', 'mantenimiento', 'inactiva') DEFAULT 'en_orbita',
    horas_vuelo INT NOT NULL DEFAULT 0 CHECK (horas_vuelo >= 0),
    ultima_revision DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE bitacora_mantenimiento (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    nave_id INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fecha_evento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (nave_id) REFERENCES naves_espaciales(nave_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Activar el motor de eventos de MySQL
SET GLOBAL event_scheduler = ON;

-- Evento 1: Recarga automática de energía a naves en mantenimiento cada hora
DROP EVENT IF EXISTS evt_recargar_energia_naves;
DELIMITER //
CREATE EVENT evt_recargar_energia_naves
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE naves_espaciales 
    SET nivel_energia = LEAST(100.00, nivel_energia + 15.00)
    WHERE estado_mision = 'mantenimiento';
END //
DELIMITER ;

-- Evento 2: Verificación de naves con sobrecarga de horas de vuelo
DROP EVENT IF EXISTS evt_auditar_mantenimiento_naves;
DELIMITER //
CREATE EVENT evt_auditar_mantenimiento_naves
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    INSERT INTO bitacora_mantenimiento (nave_id, descripcion)
    SELECT nave_id, CONCAT('Alerta: Nave con ', horas_vuelo, ' horas requerida para inspección.')
    FROM naves_espaciales
    WHERE horas_vuelo > 5000 AND estado_mision != 'mantenimiento';

    UPDATE naves_espaciales
    SET estado_mision = 'mantenimiento'
    WHERE horas_vuelo > 5000 AND estado_mision != 'mantenimiento';
END //
DELIMITER ;
