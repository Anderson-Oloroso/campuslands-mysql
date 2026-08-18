-- Campuslands MySQL - avanzado ejercicio 019
-- Contexto: Modulo de datos para paracaidismo (Triggers).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TRIGGER IF EXISTS trg_avanz_019_after_insert;
DROP TRIGGER IF EXISTS trg_avanz_019_before_update;
DROP TRIGGER IF EXISTS trg_avanz_019_after_update;
DROP TABLE IF EXISTS avanzado_ejercicio_019_auditoria;
DROP TABLE IF EXISTS avanzado_ejercicio_019_saltos;

CREATE TABLE avanzado_ejercicio_019_saltos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  paracaidista VARCHAR(100) NOT NULL,
  modalidad ENUM('Tandem', 'Libre', 'Base', 'Formacion') NOT NULL,
  altitud_pies INT NOT NULL,
  estado ENUM('Programado', 'Completado', 'Cancelado') NOT NULL DEFAULT 'Programado',
  fecha_salto DATE NOT NULL
);

CREATE TABLE avanzado_ejercicio_019_auditoria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  salto_id INT NOT NULL,
  accion VARCHAR(50) NOT NULL,
  detalle_cambio VARCHAR(255) NOT NULL,
  usuario VARCHAR(100) NOT NULL,
  fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Trigger 1: AFTER INSERT (Registrar la creacion de un nuevo salto)
DELIMITER //
CREATE TRIGGER trg_avanz_019_after_insert
AFTER INSERT ON avanzado_ejercicio_019_saltos
FOR EACH ROW
BEGIN
    INSERT INTO avanzado_ejercicio_019_auditoria (salto_id, accion, detalle_cambio, usuario)
    VALUES (NEW.id, 'CREACION', CONCAT('Salto programado para ', NEW.paracaidista, ' en modalidad ', NEW.modalidad), CURRENT_USER());
END //
DELIMITER ;

-- Trigger 2: BEFORE UPDATE (Validar logica de negocio antes de actualizar)
DELIMITER //
CREATE TRIGGER trg_avanz_019_before_update
BEFORE UPDATE ON avanzado_ejercicio_019_saltos
FOR EACH ROW
BEGIN
    IF OLD.estado IN ('Completado', 'Cancelado') AND NEW.estado = 'Programado' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: No se puede retroceder un salto Completado o Cancelado a Programado.';
    END IF;
END //
DELIMITER ;

-- Trigger 3: AFTER UPDATE (Registrar el cambio de estado en la auditoria)
DELIMITER //
CREATE TRIGGER trg_avanz_019_after_update
AFTER UPDATE ON avanzado_ejercicio_019_saltos
FOR EACH ROW
BEGIN
    IF OLD.estado != NEW.estado THEN
        INSERT INTO avanzado_ejercicio_019_auditoria (salto_id, accion, detalle_cambio, usuario)
        VALUES (NEW.id, 'ACTUALIZACION_ESTADO', CONCAT('Estado cambio de ', OLD.estado, ' a ', NEW.estado), CURRENT_USER());
    END IF;
END //
DELIMITER ;