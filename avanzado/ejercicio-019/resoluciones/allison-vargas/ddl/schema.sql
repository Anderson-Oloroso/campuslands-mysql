-- DDL: Estructura de tablas y Triggers de automatización para Paracaidismo
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TRIGGER IF EXISTS tg_validar_altura_salto;
DROP TRIGGER IF EXISTS tg_actualizar_estadisticas_paracaidista;
DROP TRIGGER IF EXISTS tg_auditar_cambio_licencia;

DROP TABLE IF EXISTS auditoria_licencias;
DROP TABLE IF EXISTS saltos_paracaidismo;
DROP TABLE IF EXISTS paracaidistas;

CREATE TABLE paracaidistas (
    paracaidista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    licencia ENUM('A', 'B', 'C', 'D') NOT NULL DEFAULT 'A',
    total_saltos INT NOT NULL DEFAULT 0 CHECK (total_saltos >= 0),
    horas_caida_libre DECIMAL(6,2) NOT NULL DEFAULT 0.00 CHECK (horas_caida_libre >= 0.00)
) ENGINE=InnoDB;

CREATE TABLE saltos_paracaidismo (
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista_id INT NOT NULL,
    modalidad ENUM('tandem', 'tándem', 'solo', 'formación', 'freefly', 'wing suit') NOT NULL,
    altura_pies INT NOT NULL CHECK (altura_pies > 0),
    tiempo_caida_sec INT NOT NULL CHECK (tiempo_caida_sec >= 0),
    fecha_salto DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paracaidista_id) REFERENCES paracaidistas(paracaidista_id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE auditoria_licencias (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista_id INT NOT NULL,
    licencia_anterior VARCHAR(10),
    licencia_nueva VARCHAR(10),
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paracaidista_id) REFERENCES paracaidistas(paracaidista_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- TRIGGER 1: Validar seguridad antes de registrar el salto (Mínimo 3000 pies)
DELIMITER //
CREATE TRIGGER tg_validar_altura_salto
BEFORE INSERT ON saltos_paracaidismo
FOR EACH ROW
BEGIN
    IF NEW.altura_pies < 3000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error de seguridad: La altura mínima permitida para saltos es 3000 pies.';
    END IF;
END //
DELIMITER ;

-- TRIGGER 2: Actualizar automáticamente el conteo de saltos y tiempo de caída acumulado
DELIMITER //
CREATE TRIGGER tg_actualizar_estadisticas_paracaidista
AFTER INSERT ON saltos_paracaidismo
FOR EACH ROW
BEGIN
    UPDATE paracaidistas
    SET total_saltos = total_saltos + 1,
        horas_caida_libre = horas_caida_libre + (NEW.tiempo_caida_sec / 3600.0)
    WHERE paracaidista_id = NEW.paracaidista_id;
END //
DELIMITER ;

-- TRIGGER 3: Registrar cambios de licencia en la tabla de auditoría
DELIMITER //
CREATE TRIGGER tg_auditar_cambio_licencia
AFTER UPDATE ON paracaidistas
FOR EACH ROW
BEGIN
    IF OLD.licencia != NEW.licencia THEN
        INSERT INTO auditoria_licencias (paracaidista_id, licencia_anterior, licencia_nueva)
        VALUES (NEW.paracaidista_id, OLD.licencia, NEW.licencia);
    END IF;
END //
DELIMITER ;
