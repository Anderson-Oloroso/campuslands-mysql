CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar triggers y tablas previas para garantizar una ejecución limpia desde cero
DROP TRIGGER IF EXISTS tr_auditar_actualizacion_moto;
DROP TRIGGER IF EXISTS tr_auditar_eliminacion_moto;
DROP TABLE IF EXISTS auditoria_garaje_motos;
DROP TABLE IF EXISTS garaje_motos_triggers;

-- 1. Tabla Principal de Motocicletas en el Garaje
CREATE TABLE garaje_motos_triggers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(10) NOT NULL UNIQUE,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(60) NOT NULL,
  cilindrada_cc INT UNSIGNED NOT NULL,
  anio_fabricacion INT UNSIGNED NOT NULL,
  precio_comercial DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado_motos ENUM('disponible', 'en_mantenimiento', 'alquilada', 'reservada') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_cilindrada_trig CHECK (cilindrada_cc > 0),
  CONSTRAINT chk_anio_trig CHECK (anio_fabricacion >= 1950 AND anio_fabricacion <= 2026),
  CONSTRAINT chk_precio_trig CHECK (precio_comercial >= 0.00)
);

-- 2. Tabla de Auditoría para registrar cambios automáticos mediante Triggers
CREATE TABLE auditoria_garaje_motos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  moto_id INT,
  placa VARCHAR(10),
  accion VARCHAR(20) NOT NULL, -- 'UPDATE' o 'DELETE'
  detalles_cambio TEXT NOT NULL,
  usuario_bd VARCHAR(100) NOT NULL,
  fecha_evento DATETIME NOT NULL
);

-- 3. Creación de Triggers de Base de Datos
DELIMITER //

-- Trigger 1: AFTER UPDATE - Audita cambios en el precio comercial o estado de una motocicleta
CREATE TRIGGER tr_auditar_actualizacion_moto
AFTER UPDATE ON garaje_motos_triggers
FOR EACH ROW
BEGIN
    IF OLD.precio_comercial <> NEW.precio_comercial OR OLD.estado_motos <> NEW.estado_motos THEN
        INSERT INTO auditoria_garaje_motos (moto_id, placa, accion, detalles_cambio, usuario_bd, fecha_evento)
        VALUES (
            NEW.id,
            NEW.placa,
            'UPDATE',
            CONCAT('Cambio de estado: [', OLD.estado_motos, ' -> ', NEW.estado_motos, '] | Cambio de precio: [$', OLD.precio_comercial, ' -> $', NEW.precio_comercial, ']'),
            USER(),
            NOW()
        );
    END IF;
END //

-- Trigger 2: BEFORE DELETE - Registra información de respaldo antes de eliminar una motocicleta del garaje
CREATE TRIGGER tr_auditar_eliminacion_moto
BEFORE DELETE ON garaje_motos_triggers
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_garaje_motos (moto_id, placa, accion, detalles_cambio, usuario_bd, fecha_evento)
    VALUES (
        OLD.id,
        OLD.placa,
        'DELETE',
        CONCAT('Moto eliminada del sistema. Marca: ', OLD.marca, ', Modelo: ', OLD.modelo, ', Placa: ', OLD.placa),
        USER(),
        NOW()
    );
END //

DELIMITER ;